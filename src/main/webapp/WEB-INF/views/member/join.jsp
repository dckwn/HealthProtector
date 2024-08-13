<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<style>
.input {
 color: #8A7575;
}
.dg-upContainer {
        width: 500px;
        margin: 100px auto;
        padding: 50px;
        border: 2px solid #FAD4D4;
        border-radius: 10px;
        display: flex;
        justify-content: center;
        text-align: center;
        flex-direction: column;
        align-items: center;
        gap: 30px;
        box-shadow: -7px -7px 10px white, 5px 5px 10px rgba(0, 0, 0, 0.585);
    }
    .dg-upContainer  i {
   padding: 3px;
   padding-left:0px;
   padding-right:10px;	
   text-align: center;
   color: #8A7575;
	}
    h1 {
        font-size: 45px;
        color: #8A7575;
    }
    .dg-sign-form {
        width: 100%;
        margin: 5px auto;
        display: flex;
        box-shadow: -7px -7px 10px white, 1px 1px 3px rgba(0, 0, 0, 0.585);
        padding: 10px;
    }
    .dg-sign-form img {
        width: 21px;
        height: 20px;
    }
    .dg-sign-form input {
        margin-right: 5px;
        border-radius: 5px;
        border: none;
        outline: none;
        
    }
    .dg-sign-form2 {
        width: 100%;
        margin: 5px auto;
        display: flex;
        padding: 10px;
        box-shadow: -7px -7px 10px white, 1px 1px 3px rgba(0, 0, 0, 0.585);
    }
    .dg-sign-form,
    .dg-sign-form2 {
        border-radius: 5px;
    }
    .dg-sign-form input,
    .dg-sign-form2 input {
        box-shadow: inset -5px -5px 10px white, inset 5px 5px 10px #dadada;
        background-color: rgb(232, 240, 254);
        padding: 5px;
    }
    .dg-sign-form input:hover,
    .dg-sign-form2 input:hover {
        background-color: #FAD4D4;
    } 
    .dg-sign-form2 input[type="submit"] {
        box-shadow: -7px -7px 10px white, 5px 5px 10px rgba(0, 0, 0, 0.585);
    }

    .dg-sign-form2 img {
        width: 21px;
        height: 20px;
      
    }
    .dg-sign-form2 input,
    #checkAuthBtn {
        border-radius: 5px;
        border: none;
        outline: none;
    }
    .dg-sign-form2 input[type="button"],
    #checkAuthBtn {
        width: 100%;
        color: #8A7575;
        cursor: pointer;
    }
    .dg-sign-form input {
        width: 100%;
    }        
    div#preview {
        border: 3px solid #dadada;
        border-radius: 50%;
        width: 200px;
        height: 200px;
        margin: auto;
        margin-bottom: 13px;
        background-position: center center;
        background-repeat: no-repeat;
        background-size: auto 100%;
        overflow: hidden;
        background-color: rgb(232, 240, 254);
        box-shadow: inset -5px -5px 10px white, inset 5px 5px 10px #dadada;
    }
    div#preview:hover {
       background-color: #FAD4D4;
    }
       .dg-sign-form input[type=file] {
        position: absolute;
        width: 0;
        height: 0;
        padding: 0;
        overflow: hidden;
        border: 0;
    }

    .dg-sign-form input[type=file]+label {
        cursor: pointer;
        color: #757575;
    }
    .dg-sign-form input[type=radio] {
         display: none;
    }

    .dg-sign-form input[type=radio]+label {
        border: 1px solid #dadada;
        border-top: 0px;
        display: flex;
        justify-content: center;
        height: 110%;
        width: 50%;
        background-color: #fff;
        color: #757575;
        padding: 14px 17px 13px;
        overflow: hidden;
        border-radius: 5px;
        cursor: pointer;
    }

    .dg-sign-form input[type=radio]:checked+label {
        background-color: #dadada;
        color: #fff;
    }
    .profileSet {
        display: block;
    }


    p#result , .pw1_message, .pw2_message, .message{
        padding-top: 10px;
        font-size: 12px;
        display:none;
        text-align: left;
    }
    .mailSendBox{
        border: 1px solid #dadada;
        border-top: 0px;
        display: flex;
        justify-content: center;
        height: 110%;
        width: 50%;
        background-color: #fff;
        color: #757575;
    }
    #timer{
       margin: auto;
        padding:20px auto;
        color: #8A7575;
        font-size: 16px;]
    }
        
    .dg-joinBtn {
        background-color: #FAD4D4;
    }
    .dh-loginbutton {
        width: 100%;
        border: none;
        margin: auto;
        color: #8A7575;
        font-weight: bold;
        letter-spacing: 4px;
        font-size: 18px;
        background-color: inherit;
        cursor: pointer;
    }
    .dg-joinBtn:hover {
        background-color: #dadada;
    }
   .dg-fxblock {
      width: 100%;
   }
   .dg-fxx {
      display: flex;
      width: 100%;
   }
   #checkAuthBtn {
      width: 80%;
      margin: 10px auto;
      color: #8A7575;
      font-weight: bold;
      background-color: rgb(232, 240, 254);
       box-shadow: -7px -7px 10px white, 5px 5px 10px rgba(0, 0, 0, 0.585);
   }
   .auth {
      border-radius: 5px;
      box-shadow: inset -5px -5px 10px white, inset 5px 5px 10px #dadada;
   }
   .auth input {
      width: 80%;
       margin-right: 5px;
        border-radius: 5px;
        border: none;
        outline: none;
        box-shadow: inset -5px -5px 10px white, inset 5px 5px 10px #dadada;
        background-color: rgb(232, 240, 254);
        padding: 5px;
   }
</style>
</head>
<body>
      <script>
         var img = document.createElement("img");
         function changeHandler(event) {
            // event.target 은 파일을 첨부하는 input 요소이다
            // preview는 미리보기 그림을 보여줄 div 요소이다
            const preview = document.getElementById('preview')

            if (event.target.files && event.target.files[0]) {
               var reader = new FileReader();
               reader.onload = function(event) {
                  img.setAttribute("src", event.target.result);
                  img.style.width = '100%'
                  img.style.height = '100%'
                  //                img.setAttribute("width", "100%");
                  //                img.setAttribute("height", "100%");
                  document.querySelector("div#preview").appendChild(img);
               };

               reader.readAsDataURL(event.target.files[0]);
            } else {
               document.querySelector("div#preview").removeChild(img);
            }
         }
      </script>

<div class="frame">

   <div class="dg-upContainer">
            <h1>Sign Up</h1>
            
            <form method="POST" enctype="multipart/form-data">
                <div class="dg-join">
                
                    <div class="dg-sign-form2 dh-loform">
                       <i class="fa-solid fa-user"></i>
                          <div class="dg-fxblock">
                           <div class="dg-fxx">
                              <input class="dh-input" type="text" name="userid" placeholder="ID" autofocus required>
                               <input type="button" id="runcheck" class="dh-checkbutton center" value="중복확인">
                            </div>
                              <p id="result"></p>
                          </div>
                    </div>
                    <!--  비번 -->
                    <div class="dg-sign-form dh-loform">
                        
                           <i class="fa-solid fa-lock"></i>
                        <div class="dg-fxblock" >
                           <input class="dh-input"  type="password" name="userpw"  placeholder="Password" required>
                           <p class="pw1_message"></p>
                        </div>
                    </div>
                    <!--  비번확인 -->
                    <div class="dg-sign-form dh-loform">
                        <i class="fa-solid fa-lock"></i>
                        <div class="dg-fxblock">
                             <input  class="dh-input" type="password" name="pw2"  placeholder="Checked Password" required>
                           <p class="pw2_message"></p>
                        </div>
                    </div>
                    <!--  프로필사진 -->
                    <div class="dg-sign-form profileSet dh-loform">
                        <div id="preview"></div>
                        <i class="fa-regular fa-image"></i>
                        <input type="file" name="profile_Upload" accept="image/*" id="file">
                        <label for="file" style="font-weight: bold;">Profile Photo</label>
                    </div>
                    <!--  이름 -->
                    <div class="dg-sign-form dh-loform">
                        <i class="fa-solid fa-heart"></i>
                        <input  class="dh-input" type="text" name="username" placeholder="이름">
                    </div>
               <!--  전화번호 -->
                    <div class="dg-sign-form dh-loform">
                        <i class="fa-solid fa-phone-volume"></i>
                        <input class="dh-input" height="25" width="26"type="text" name="phone_num" placeholder="전화번호">
                    </div>
               <!--  생년월일 -->
                    <div class="dg-sign-form dh-loform">
                        <i class="fa-solid fa-cake-candles"></i>
                        <input class="dh-input" type="text" name="strbirth" placeholder="생년월일 (1900-00-00)">
                    </div>
               <!--  메일인증 -->
                    <div class="dg-sign-form2 dh-loform mailSend">
                        <i class="fa-solid fa-envelope"></i>
                        <div class="dg-fxblock">
                           <div class="dg-fxx">
                              <input class="dh-input" type="text" name="email" placeholder="Email" autofocus required>
                              <input type="button" id="sendMailBtn" class="dh-checkbutton center" value="인증번호">
                           </div>
                              <p class="message"></p>
                        </div>
                    </div>
                    
                    <div class="auth hidden">
                        <div >
                           <input class="dh-input" type="text" name="authNumber" placeholder=" 시간 내에 입력해주세요" style="margin: 20px auto 10px auto;">
                           <div class="dh-chbutton center">
                              <input type="button" id="checkAuthBtn" class="dh-checkbutton center" value="인증번호 확인">
                           </div>
                           <p id="timer"></p>
                           <p class="message"></p>
                        </div>
                    </div>

                    <div class="dg-sign-form dh-loform">
                        <input id="dh-gender1" type="radio" name="gender" value="남성" required><label for="dh-gender1">남성</label> 
                        <input id="dh-gender2" type="radio" name="gender" value="여성" required><label for="dh-gender2">여성</label>
                    </div>

                    <div class="dg-sign-form dg-joinBtn dh-loform">
                        <button class="dh-loginbutton center">회원가입</button>
                    </div>

                </div>
            </form>
        </div>
</div>

<script>
         const input = document.querySelector('input[name="profile_Upload"]')
         
         input.addEventListener('change', changeHandler)
         
         const runcheck = document.getElementById('runcheck')
         const inputUserid = document.querySelector('input[name="userid"]')
         const result = document.getElementById('result')
         
         const clickHandler = function(){
            const userid = inputUserid.value
            if (!userid.trim()) {
                return;
            }
            const url = '${cpath}/member/check'
            const opt = {               // 요청의 옵션들을 지정
                  method: 'POST',         // 옵션1) 요청 메서드 'POST'
                  body: JSON.stringify({    
                     userid:userid         // 옵션2) POST의 전달내용은 userid를 포함하는 객체를 JSON문자열형식으로 전달
                  }),
                  headers:{            // 옵션3) 헤더, 전송하는 데이터의 형식 및 인코딩을 지정
                     'Content-Type':'application/json; charset=utf-8'
                  }
            }
            
            fetch(url, opt)
               .then(resp => resp.json())
               .then(json => {
                  
                  result.style.display = 'block'
                  result.innerText = json.msg
                  if(json.row != 0){
                     result.style.color='red'
                     document.querySelector('.dh-loginbutton').disabled = true;
                  }
                  else{
                     result.style.color='#ccc'
                     runcheck.value='✔'
                     document.querySelector('.dh-loginbutton').disabled = false;
                  }
               })      
         }      
         inputUserid.onkeyup = function() {
        	 result.style.display = 'none';
        	    runcheck.value = '중복확인';
        	};
         runcheck.onclick = clickHandler
      </script>
         
<script>
   
   const mailSend = document.querySelector(".mailSend");
   const auth = document.querySelector(".auth")
   
   
      document.getElementById("sendMailBtn").onclick = async function(event){
      event.preventDefault()
      
      const url = '${cpath}/ajax/sendMail'
      const inputAddress = document.querySelector('input[name="email"]').value
//       console.log(inputAddress)
      
      const opt ={
            method:'POST',
            body:JSON.stringify({
               address : inputAddress
            }),
            headers: {
               'Content-Type' :'application/json; charset=utf-8' 
            }
      }   
      const result = await fetch(url, opt).then(resp => resp.text())
      const message = document.querySelector('.mailSend > div > p.message')
      if(result == 1){ 
         message.innerText = '메일을 전송했습니다'
         message.style.color = 'blue'
           message.style.display = 'block'
           mailSend.classList.add('hidden')
           mailSend.classList.remove('dh-loform')
         document.querySelector('.auth').classList.remove('hidden')
         document.querySelector('.auth').classList.add('dh-loform')
      }
      else{
         message.innerText = '메일을 보낼 수 없습니다'
         message.style.color = 'red'
           message.style.display = 'block'
      } 
   }// end of mailSendForm.onsubmit
   
   
      document.getElementById("checkAuthBtn").onclick = async function(event){
      event.preventDefault()
      
      const inputNumber = document.querySelector('input[name="authNumber"]').value
      const url = '${cpath}/ajax/authNumber/'+ inputNumber
      const result = await fetch(url).then(resp => resp.text())
      const message = document.querySelector('.auth > div > p.message')
      
      if(result == 1){
         message.innerText =  '인증 성공'
         message.style.color = 'blue'
           message.style.display = 'block'
        document.getElementById('timer').classList.add('hidden')
         document.querySelector('.dh-loginbutton').disabled = false;
      }else{
         message.innerText ='인증 실패'
         message.style.color = 'red'
         message.style.display = 'block'
         document.querySelector('.dh-loginbutton').disabled = true;
      }
         
      } // end of authForm.onsubmit
   
</script>

<script>
      const timer = document.getElementById('timer')
      const sendMailBtn = document.getElementById('sendMailBtn')
      
      var time = 300
      var min = ""
      var sec = ""
      
      
      sendMailBtn.addEventListener('click', function(){
      
      clearInterval(x)
      
      var x = setInterval(function(){
      min = parseInt(time/60)
      sec = time% 60
         
      document.getElementById('timer').innerHTML = min + "분" + sec + "초"
      time--
         
      if(time < 0){
      clearInterval(x)
      document.getElementById('timer').innerHTML ="시간초과"
         }
      }, 1000)
   
      })
      
      
</script>

<script>
      const pw1 = document.querySelector('input[name="userpw"]')
      const pw2 = document.querySelector('input[name="pw2"]')
      const pw1_message = document.querySelector('.pw1_message')
      const pw2_message = document.querySelector('.pw2_message')

      function pw1Handler(event) {
            const pw1Value = event.target.value
            if(pw1Value.length < 4) {
                pw1_message.innerText = '길이는 4자 이상이여야 합니다'
                pw1_message.style.color = 'red'
                  pw1_message.style.display = 'block'
            }
            else {
                pw1_message.innerText = '사용가능합니다'
                pw1_message.style.color = 'blue'
                pw1_message.style.display = 'block'
            }
        }
        function pw2Handler(event) {
            const pw1Value = document.querySelector('input[name="userpw"]').value
            const pw2Value = event.target.value
            if(pw1Value != pw2Value) {
                pw2_message.innerText = '비밀번호가 일치하지 않습니다'
                pw2_message.style.color = 'red'
                  pw2_message.style.display = 'block'
            }
            else {
                pw2_message.innerText = '비밀번호가 일치합니다'
                pw2_message.style.color = 'blue'
                  pw2_message.style.display = 'block'
            }
        }
        
        pw1.onkeyup = pw1Handler
        pw2.onkeyup = pw2Handler

</script>
      
      
<%@ include file="../footer.jsp" %>      
</body>
</html>