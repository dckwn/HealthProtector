
const back = document.getElementById('chat')
const chatFrame = document.querySelector('.dh-chatFrame')
const openChatButton = document.querySelector('.dh-chatButton');
const closeBtn = document.querySelector('.close-btn')
const headAlert = document.querySelector('.headAlert')
let isIn = '0'
let naIn = '0'
//const sessionId = '${pageContext.session.getId()}'

closeBtn.addEventListener('click',function(event){
	headAlert.classList.add('hide')
})

function onConnect() {
	stomp.subscribe('/broker/message/'+ userid, alarm)
}

function updateIsIn(value) {
    isIn = value;
}

function alarm(from){
	const body = JSON.parse(from.body)
	const isInFromServer = body.isIn;
	if(isInFromServer != null){updateIsIn(isInFromServer);}
	if(isInFromServer == 1 && !chatFrame.classList.contains('hidden')){
		readChat()
	}
	if(isInFromServer == null && chatFrame.classList.contains('hidden')){
		
		headAlert.classList.remove('hide')
	}
}

async function readChat(){
	const show = document.querySelector('div#'+userid)
	
	const url = cpath + '/getChat/'+ userid
	
	const result = await fetch(url).then(resp=>resp.json())
	const arr = Array.from(result)
	
	const chatInput = document.querySelector('input[name="msg"]')		
	show.innerHTML = ''
	let lastPo = ''
	let checkPo = ''
	if(arr.length != 0){
		for(let i = 0; i < arr.length; i++) {
			const e = arr[i]
			let po = ''
			let who = ''
			let userRead = ''
			let adminRead = ''
			let dbRead = ''
			
			if(e.isRead  == 1){dbRead = e.isRead}
			
			if(e.who_send != 'admin'){po = 'end'; adminRead = dbRead}
			else {
				po = 'start';
				who = '관리자';
				userRead=dbRead
			}
			checkPo = document.querySelectorAll('.dh-message')
			if(checkPo.length > 0){
				lastPo = checkPo[checkPo.length - 1]
				if(lastPo.classList.contains(po)){who = ''}
			}
			let	str = ''
			str += '<div class="dh-message '+ po +'"><h2>'+ who +'</h2>'+adminRead+'<div style="margin: 0px 10px;">' + e.content+'</div>'+userRead+'</div>'	
			show.innerHTML += str			
		}
	}
	chatFrame.classList.remove('hidden');
	show.scrollTop = show.scrollHeight
	
}

async function onInput(value){
		const text = '님의 상담'
		let tag = ''
	        tag += '<div class="dh-chatHead">'
	        tag += '<div><h3>'+userid+'</h3></div>'
	        tag += '<div class="out">상담종료</div>'
	        tag += '</div>'
	        tag += '<div id="'+userid+'" style="width: 350px; height: 500px; overflow-y: scroll;">'
			tag += '</div>'
			tag += '<div class="dh-send">'
			tag += '<input type="text" name="msg" id="msg">'
			tag += '<div class="dm">전송</div>'
			tag += '</div>'
			
		back.innerHTML = tag

// 		async function readgo(){
// 			const readURL = cpath+'/isRead/'+ userid +'/' + 'admin'
// 			await fetch(readURL)
// 		}
		readChat()
		
		const chatInput = document.querySelector('input[name="msg"]')
		if(value!='0'){
			stomp.subscribe('/broker/goChat/'+ userid, chatT)
			stomp.send('/app/openChat/' + userid, {}, JSON.stringify({		
				text: text,
				from: userid
			}))
		}	
	const outBtn = document.querySelector('.out')
    const sendBtn = document.querySelector('.dm')
	const msgInput = document.querySelector('input[name="msg"]')
	
	outBtn.onclick = outM
	sendBtn.onclick = sendM
	msgInput.onkeyup = function(e){
		if(e.key == 'Enter') sendM()
	}
	
	chatInput.addEventListener('focus', async () => {
// 		readgo()
		const readURL = cpath + '/isRead/'+ userid +'/' + 'admin'
 		await fetch(readURL)
		readChat()
		naIn = '1'
	    stomp.send('/app/alarm/' + 'admin', {}, JSON.stringify({ chat: userid, isIn: '1' }));
	});
	
	chatInput.addEventListener('blur', () => {
		naIn = '0'
	    stomp.send('/app/alarm/' + 'admin', {}, JSON.stringify({ chat: userid, isIn: '0' }));
	});
	
// 	show.scrollTop = show.scrollHeight
// 	if(value==0){
// 		chatInput.focus()
// 		value=1
// 	}
}

async function sendM(){
	const text = document.querySelector('input[name="msg"]').value	// 내용을 불러와서
	if(text == ''){													// 내용이 없으면 중단
		return
	}
	document.querySelector('input[name="msg"]').value = ''			// 입력창 비우기
	
	const url = cpath+'/saveChat'
	
	let isRead = '1'
	if(isIn == 1 ) {isRead = '0'}
	
	const opt = {
	  method: 'POST',
	  body: JSON.stringify({ 
	  	who_send: userid,			
		who_chat: userid,
		content: text,
		isRead: isRead
	  }),
	  headers: {
           'Content-Type': 'application/json; charset=utf-8'
       }
	}
	
	const addResult = await fetch(url,opt).then(resp=>resp.text())
	
	stomp.send('/app/sendM/' + userid, {}, JSON.stringify({		
		to: to,			
		from: userid,
		text: text
	}))
	stomp.send('/app/alarm/' + 'admin', {}, JSON.stringify({		
		from: userid
	}))
			
		document.querySelector('input[name="msg"]').focus()	// 다시 입력할 수 있도록 포커스 잡아주기
}

async function outM(){
	chatFrame.classList.add('hidden')
	openChatButton.classList.remove('hidden')
	const url = cpath+'/outChat/'+ userid
	
	const result = await fetch(url).then(resp=>resp.text())
	
	const text = 'out'	
	if(text == ''){													
		return
	}
	stomp.send('/app/sendM/' + userid, {}, JSON.stringify({		
		to: to,			
		from: userid,
		text: text
	}))
// 	stomp.disconnect(function() {
// 	    console.log('Disconnected');
// 	});
}

openChatButton.addEventListener('click', function(event) {
	
    if(userid==''){openChatButton.disabled = true}
    else{    
	    openChatButton.classList.add('hidden')
	    onInput()
    }
});

function chatT(chat){
	const content = JSON.parse(chat.body)
	const to = content.to
	const from = content.from
	let text = content.text
	let isReadUser = ''
	let isReadAdmin = ''
	let po = ''
	let who = ''
	let toA = ''
	if(from == 'admin'){toA = to; po = 'start'; who = '관리자'; isReadAdmin='1'}
	if(to == 'admin'){toA = from; po = 'end'; isReadUser = '1'}
	if(text === 'out'){ text = '상담이 종료되었습니다.'; po ='service'; who=''; isReadUser=''; isReadAdmin=''}	
	
	if(isIn == '1') {isReadUser = ''}
	if(naIn == '1') {isReadAdmin = ''}
	
	const checkPo = document.querySelectorAll('.dh-message')
	if(checkPo.length > 0){
		const lastPo = checkPo[checkPo.length - 1]
		if(lastPo.classList.contains(po)){who = ''}
	}
	let	str = ''
		str += '<div class="dh-message '+ po +'"><h2>'+ who +'</h2>'+isReadUser+'<div style="margin: 0px 10px;">' + text+'</div>'+isReadAdmin+'</div>'

	const show = document.getElementById(toA)
	show.innerHTML += str	
	show.scrollTop = show.scrollHeight
}