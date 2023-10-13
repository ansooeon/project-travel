

window.onload= function() {

    var Jtext = document.querySelectorAll("input[type=text]");
    var Jmem = document.getElementById("member");

    var id = document.getElementById("id");
    var name = document.getElementById("name");
    var pwd = document.getElementById("pwd");
    var pwd2 = document.getElementById("pwd2");
    var phone = document.getElementById("phone");
    var email1 = document.getElementById("email1");
    var birth1 = document.getElementById("birth_yy");
    var birth2 = document.getElementById("birth_mm");
    var birth3 = document.getElementById("birth_dd");
    var address1 = document.getElementById("address1");
    var address2 = document.getElementById("address2");
    var address3 = document.getElementById("address3");
    var address = document.getElementById("address_button");

    var idCheck = /^(?=.*[a-z])(?=.*[0-9]).{4,14}$/; //아이디 소문자 +숫자 체크
    var pwdCheck = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;//비번  소문자 + 특수문자 + 숫자 체크
    var reg = /^\d{3}-\d{3,4}-\d{4}$/; //숫자만 사용할수 있게 체크
    var korcheck = /^[ㄱ-ㅎ|가-힣]+$/; //한글 체크
    
    var use = "";
    var ischeck = false;
    Jmem.onclick= function() {
    
        
        
    }
    
    
    $('#id').focusout(function(){
        $.ajax({
            url:"",
            success : function() {
                if (!idCheck.test(id.value)) {
                    $("#checkId").html('영어와 숫자를 조합해 4자 이상, 14자 이하로 입력해주세요!');
                    $("#id").css("border","2px solid red");
                   
                } else {
                    $("#checkId").html("");
                    $("#id").css("border","2px solid #e5e5e5");
                    
                }
            },
           
        })
    })
    
    /*https://ssungkang.tistory.com/entry/javascript-%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85-%EC%8B%9C-%EC%95%84%EC%9D%B4%EB%94%94-%EC%A4%91%EB%B3%B5-%ED%99%95%EC%9D%B8%ED%95%98%EA%B8%B0-ajax
     중복 확인 예제*/
    $('#loginBtn').click(function(){
    	ischeck =true;
    	if($('#id').val() == '') {
    		alert("영어와 숫자를 조합해 4자 이상, 14자 이하로 입력해주세요!");
    		id.focus();
    		return;
    	}
    	
    	if(id.value.length < 4 || id.value.length > 14) {
    		alert("영어와 숫자를 조합해 4자 이상, 14자 이하로 입력해주세요!");
    		return;
    	}
    	
        $.ajax({
            url:"member_check.jsp",
            data: {userId : $('#id').val()},
            success : function(result) {
            	
                if ($.trim(result) == 0) {
                	
                    $("#logincheck").html('중복된 아이디 입니다.');
                    $("#logincheck").css("color","red");// 실제 css 문법과 같은 코딩 내용을 적는다. 
                    $("#id").css("border","2px solid red");
                    use = "possible";
                } else {
                    $("#logincheck").html("사용가능한 아이디 입니다.");
                    $("#logincheck").css("color","black");
                    $("#id").css("border","2px solid #e5e5e5");
                    use = "impossible";
                }
            },
           
        })
    })

    $('#name').focusout(function(){
        $.ajax({
            url:"",
            success : function() {
                if (!korcheck.test(name.value)) {
                    $("#checkkor").html('한글만 입력 가능 합니다!');
                    $("#name").css("border","2px solid red");
                    
                } else {
                    $("#checkkor").html("");
                    $("#name").css("border","2px solid #e5e5e5");
                    
                }
            },
           
        })
    })
    
    
    $('#pwd').focusout(function(){

        $.ajax({
            url:"",
            success : function() {
                if (!pwdCheck.test(pwd.value)) {
                    $("#checkPwd").html('대/소문자+숫자+특수문자 조합으로 8~20자리 사용해야 합니다.');
                    $("#pwd").css("border","2px solid red");
                    
                } else {
                    $("#checkPwd").html('');
                    $("#pwd").css("border","2px solid #e5e5e5");
                }
            },
            
        })
    })

    $('#pwd2').focusout(function(){

        $.ajax({
            url:"",
            success : function() {
                if (pwd.value != pwd2.value) {
                    $("#checkPwd2").html('비밀번호를 재확인 해주세요.');
                    $("#pwd2").css("border","2px solid red");
                    
                } else {
                    $("#checkPwd2").html('');
                    $("#pwd2").css("border","2px solid #e5e5e5");
                }
            },
            
        })
    })

    $('#phone').focusout(function(){

        $.ajax({
            url:"",
            success : function() {
                if (!reg.test(phone.value)) {
                    $("#checkPhone").html('전화번호 형식으로 입력해 주세요. (Ex:???-????-????)');
                    $("#phone").css("border","2px solid red");
                    
                } else {
                    $("#checkPhone").html('');
                    $("#phone").css("border","2px solid #e5e5e5");
                }
            },
            
        })
    })
    
    $('#member').click(function() {
    	
    	if(use == "possible") {
			alert('아이디가 중복되었습니다. 다시 확인해 주세요.');
			return false;
		}
		
       if(ischeck == false) {
			alert('중복검사를 먼저 해주세요');
			return false;
		}		
		
		if(id.value == "") {
            
            alert("아이디를 입력해 주세요.");
            id.focus();
            return false;
        } else if(!idCheck.test(id.value)) {
            
            alert("아이디는 영어와 숫자를 조합해 4자 이상, 14자 이하로 입력해주세요.");
            id.focus();
            return false;
        } else if(name.value == "") {
            
             alert("이름을 입력해 주세요.");
             name.focus();
             return false;

        }else if(!korcheck.test(name.value)) {
            
            alert("이름은 한글만 입력 가능합니다.");
            name.focus();
            return false;

       } else if(!pwdCheck.test(pwd.value)) {
            
            alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~20자리 사용해야 합니다.");
            pwd.focus();
            return false;	
        } else if(pwd2.value != pwd.value) {
            
            alert("비밀번호 재확인해 주세요.");
            pwd2.focus();
            return false;
        } else if(!reg.test(phone.value)) {
            
            alert("전화번호 형식으로 입력해 주세요.");
            phone.focus();
            return false;
        }else if(email1.value == "") {
            
            alert("이메일을 입력해 주세요.");
            email1.focus();
            return false;
        } else if(birth1.value == "") {
        
            alert("년도을 선택해 주세요.");
            birth1.focus();
            return false;
        }else if(birth2.value == "") {
        
            alert("월을 선택해 주세요.");
            birth2.focus();
            return false;
        }else if(birth3.value == "") {
        
            alert("요일을 선택해 주세요.");
            birth3.focus();
            return false;
        }else if(address1.value == "") {
            
            alert("우편번호를 입력해 주세요.");
            address1.focus();
            return false;
        } else if(address2.value == "") {
            
            alert("주소를 입력해 주세요.");
            address2.focus();
            return false;
        }else if(address3.value == "") {
            
            alert("상세주소를 입력해 주세요.");
            address3.focus();
            return false;
        }else if(hobby.value == "") {
        	
        	alert("취미를 최소 한개 이상 선택해주세요.");
        	hobby.focus();
        	return false;
        	
        }else {
        	alert("회원가입 실패!");
        	return;
        }
		
		alert("회원 가입 성공!");
		location.href="mainPage.jsp";
	})
	
    address.onclick= function () {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
    
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
    
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address2").value = extraAddr;
                
                } else {
                    document.getElementById("address2").value = '';
                }
    
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('address1').value = data.zonecode;
                document.getElementById("address2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address3").focus();
            }
        }).open();
    }

    $(function () {

		$('.nb').hide();
       
        $('.util_nav').mouseenter(function(){
            $(".nb").slideDown("slow");
        });

        $('.nb').mouseleave(function(){
            $(".nb").slideUp("middle");
			
        });
	})

}