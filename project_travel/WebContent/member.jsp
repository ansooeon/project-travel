<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Member</title>
</head>
<link href="css/member.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/slick.css" />
<link rel="stylesheet" href="css/slick-theme.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 자바스크립트 -->
<script src="js/member.js"></script>
<!-- 네비 슬라이드 스크립트 -->
<script src="js/slick.js"></script>
<script src="js/slick.min.js"></script>
<!-- 우편번호 스크립트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<body>
	
    <div class="mainbody">
    	<%@ include file="headerfooter/header.jsp" %>
        <div class="main_body">
	
            <div class="login">
                <div>
                    <h1 class="title">회원 가입</h1>
                </div>
                <form action="member_ok.jsp" method="post">
	                <div class="content">
	                    <div>
	                        <h2 class="info">정보 입력</h2>
	                        <p class="info" style="font-size: 15px; margin-top: 5px;">회원정보는 예약이나 따른 정보 제공에 활용되므로 정확하게 입력해 주십시오.</p>
	                    </div>
	                    <div>
	                        <div>
	                            <h4 class="content-title">I D</h2>
	                        </div> 
	                       <input type="text" name="id" id="id" placeholder="아이디를 입력해 주세요.">
	                       <input type="button" name="loginBtn" id="loginBtn" value="중복확인"> 
						   
	                       <div class="error_msg" id="checkId" style="color:red"></div>
	                       <div class="error_msg" id="logincheck"></div>
	                    </div>
	                    
	                    <div>
	                        <div>
	                            <h4 class="content-title">이름</h2>
	                        </div> 
	                        <input type="text" name="name" id="name" placeholder="이름을 입력해 주세요.">
							<div class="error_msg" id="checkkor" style="color:red"></div>
	                    </div>
	                    
	                    <div>
	                        <div>
	                            <h4 class="content-title">패스워드</h2>
	                        </div> 
	                       <input type="text" name="pwd" id="pwd" placeholder="대/소문자+숫자+특수문자를 조합해주세요.">
	                       <div class="error_msg" id="checkPwd" style="color:red"></div>
	                    </div>
	                    
	                    <div>
	                        <div>
	                            <h4 class="content-title">패스워드 확인</h2>
	                        </div> 
	                        <input type="text" id="pwd2" placeholder="패스워드 확인해 주세요.">
							<div class="error_msg" id="checkPwd2" style="color:red"></div>
	                    </div>
	                    
	                    <div>
	                        <div>
	                            <h4 class="content-title">휴대전화번호</h2>
	                        </div> 
	                        <input type="text" name="phone" id="phone" placeholder="전화번호를 입력해 주세요."> 
	                        <div class="error_msg" id="checkPhone" style="color:red"></div>
	                    </div>
	                    
	                    <div>
	                        <div>
	                            <h4 class="content-title">이메일</h4>
	                            <input type="text" name="email1" id="email1" placeholder="이메일">@</input>
	                            <select name="email2" id="email2">
	                                <option>naver.com</option>
	                                <option>daum.net</option>
	                                <option>gmail.com</option>
	                                <option>nate.com</option>
	                            </select>
	                        </div>
	                    </div>
	                    
	                    <div>
	                        <div>
	                            <h4 class="content-title">생년월일</h2>
	                            <select id="birth_yy" name="birth_yy">
	                                <option value="" disabled selected>년</option>
	                                
	                                <option value="2008">2008</option>
	                                <option value="2007">2007</option>
	                                <option value="2006">2006</option>
	                                <option value="2005">2005</option>
	                                <option value="2004">2004</option>
	                                <option value="2003">2003</option>
	                                <option value="2002">2002</option>
	                                <option value="2001">2001</option>
	                                <option value="2000">2000</option>
	                                <option value="1999">1999</option>
	                                <option value="1998">1998</option>
	                                <option value="1997">1997</option>
	                                <option value="1996">1996</option>
	                                <option value="1995">1995</option>
	                                <option value="1994">1994</option>
	                                <option value="1993">1993</option>
	                                <option value="1992">1992</option>
	                                <option value="1991">1991</option>
	                                <option value="1990">1990</option>
	                                <option value="1989">1989</option>
	                                <option value="1988">1988</option>
	                                <option value="1987">1987</option>
	                                <option value="1986">1986</option>
	                                <option value="1985">1985</option>
	                                <option value="1984">1984</option>
	                                <option value="1983">1983</option>
	                                <option value="1982">1982</option>
	                                <option value="1981">1981</option>
	                                <option value="1980">1980</option>
	                                <option value="1979">1979</option>
	                                <option value="1978">1978</option>
	                                <option value="1977">1977</option>
	                                <option value="1976">1976</option>
	                                <option value="1975">1975</option>
	                                <option value="1974">1974</option>
	                                <option value="1973">1973</option>
	                                <option value="1972">1972</option>
	                                <option value="1971">1971</option>
	                                <option value="1970">1970</option>
	                                <option value="1969">1969</option>
	                                <option value="1968">1968</option>
	                                <option value="1967">1967</option>
	                                <option value="1966">1966</option>
	                                <option value="1965">1965</option>
	                                <option value="1964">1964</option>
	                                <option value="1963">1963</option>
	                                <option value="1962">1962</option>
	                                <option value="1961">1961</option>
	                                <option value="1960">1960</option>
	                                <option value="1959">1959</option>
	                                <option value="1958">1958</option>
	                                <option value="1957">1957</option>
	                                <option value="1956">1956</option>
	                                <option value="1955">1955</option>
	                                <option value="1954">1954</option>
	                                <option value="1953">1953</option>
	                                <option value="1952">1952</option>
	                                <option value="1951">1951</option>
	                                <option value="1950">1950</option>
	                                <option value="1949">1949</option>
	                                <option value="1948">1948</option>
	                                <option value="1947">1947</option>
	                                <option value="1946">1946</option>
	                                <option value="1945">1945</option>
	                                <option value="1944">1944</option>
	                                <option value="1943">1943</option>
	                                <option value="1942">1942</option>
	                                <option value="1941">1941</option>
	                                <option value="1940">1940</option>
	                                <option value="1939">1939</option>
	                                <option value="1938">1938</option>
	                                <option value="1937">1937</option>
	                                <option value="1936">1936</option>
	                                <option value="1935">1935</option>
	                                <option value="1934">1934</option>
	                                <option value="1933">1933</option>
	                                <option value="1932">1932</option>
	                                <option value="1931">1931</option>
	                                <option value="1930">1930</option>
	                                <option value="1929">1929</option>
	                                <option value="1928">1928</option>
	                                <option value="1927">1927</option>
	                                <option value="1926">1926</option>
	                                <option value="1925">1925</option>
	                                <option value="1924">1924</option>
	                                <option value="1923">1923</option>
	                                                                
	                            </select>
	                            <select id="birth_mm" name="birth_mm">
	                                <option value="" disabled selected>월</option>
	                                <option value="01">01</option>
	                                <option value="02">02</option>
	                                <option value="03">03</option>
	                                <option value="04">04</option>
	                                <option value="05">05</option>
	                                <option value="06">06</option>
	                                <option value="07">07</option>
	                                <option value="08">08</option>
	                                <option value="09">09</option>
	                                <option value="10">10</option>
	                                <option value="11">11</option>
	                                <option value="12">12</option>
	                            </select>
	                            <select id="birth_dd" name="birth_dd">
	                                <option value="" disabled selected>일</option>
	                                <option value="01">01</option>
	                                <option value="02">02</option>
	                                <option value="03">03</option>
	                                <option value="04">04</option>
	                                <option value="05">05</option>
	                                <option value="06">06</option>
	                                <option value="07">07</option>
	                                <option value="08">08</option>
	                                <option value="09">09</option>
	                                <option value="10">10</option>
	                                <option value="11">11</option>
	                                <option value="12">12</option>
	                                <option value="13">13</option>
	                                <option value="14">14</option>
	                                <option value="15">15</option>
	                                <option value="16">16</option>
	                                <option value="17">17</option>
	                                <option value="18">18</option>
	                                <option value="19">19</option>
	                                <option value="20">20</option>
	                                <option value="21">21</option>
	                                <option value="22">22</option>
	                                <option value="23">23</option>
	                                <option value="24">24</option>
	                                <option value="25">25</option>
	                                <option value="26">26</option>
	                                <option value="27">27</option>
	                                <option value="28">28</option>
	                                <option value="29">29</option>
	                                <option value="30">30</option>
	                                <option value="31">31</option>
	                            </select>
	                        </div>
	                    </div>
	                    
	                    <div>
	                        <div>
	                            <h4 class="content-title">주소</h2>
	                        </div> 
	                        <input type="text" name="address1" id="address1" placeholder="우편번호">
	                        <input type="button" id="address_button" value="우편번호 찾기"> 
	                        <input type="text" name="address2" id="address2" placeholder="주소를 입력해 주세요.">
	                        <input type="text" name="address3" id="address3" placeholder="상세주소를 입력해 주세요.">
	                    </div>
	                    <div>
	                        <div>
	                            <h4 class="content-title">취미</h2>
	                        </div>
	                        <br/>
	                        <input type="checkbox" name="hobby" class="hobby" value="자전거">자전거
	                        <input type="checkbox" name="hobby" class="hobby" value="등산">등산
	                        <input type="checkbox" name="hobby" class="hobby" value="영화">영화
	                        <input type="checkbox" name="hobby" class="hobby" value="독서">독서
	                        <input type="checkbox" name="hobby" class="hobby" value="풋살">풋살
	                        <input type="checkbox" name="hobby" class="hobby" value="헬스">헬스
	                        <input type="checkbox" name="hobby" class="hobby" value="수집">수집
	                    </div>
	                </div>
	                <br/>  <br/>               
	                <div class="submit">                    
	                    <input type="submit" value="회원가입" id="member">     
	                </div>
                </form>
            </div>
        </div>
        <!-- footer -->
        <%@ include file="headerfooter/footer.jsp" %>
    </div>
    
    
</body>
</html>