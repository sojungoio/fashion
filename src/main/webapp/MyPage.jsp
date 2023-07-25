<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fw.dto.BoardInfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.fw.dao.AccountDAO"%>
<%@ page import="com.fw.dto.AccountDTO"%>
<%@ page import="com.fw.dto.AccountDTO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=DM+Serif+Text&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cardo&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&family=Orbit&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/MyPage.css">
<title>MyPage</title>
</head>
<style>
body {
	background-color: #fff;
	overflow-y: scroll
}

#hearder_wrapper {
	max-width: 1300px;
	height: 100%;
	margin-top: 100px auto;
}

#header_wrapper .logo {
	position: absolute;
	top: 3%;
	left: 10%;
	font-size: xx-large;
}

#header_wrapper .logo a {
	margin-left: 38px;
	font-size: xxx-large;
	font-weight: bold;
	text-decoration: none;
	color: black;
	font-family: 'DM Serif Text', serif;
}

a, button {
	cursor: pointer;
}

#main_menu_container {
	border-bottom: 2px solid rgba(0, 0, 0, .2);
	border-top: 2px solid rgba(0, 0, 0, .2);
	width: 100%;
	background-color: #fff;
	margin-top: 150px;
}

#main_menu_container #main_menu {
	display: flex;
	justify-content: space-between;
	margin: 30px 100px; /* 위아래 30px, 좌우는 각각 요소들 사이의 간격으로 조정 */
	max-width: 900px;
	position: relative;
}

#main_menu_container .main_menu a {
	display: flex;
	margin-right: 150px;
	justify-content: center;
	color: #666;
	text-decoration: none;
	white-space: nowrap;
	font-size: large;
	font-family: 'Cardo', serif;
}

.season balloon {
	position: absolute;
	left: 160px;
	top: 45px;
	z-index: 100;
	width: 140px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .15);
	border: 1px solid rgba(0, 0, 0, .12);
	border-radius: 3px;
	background: #fff;
	padding: 5px 0;
}

#main_menu_container .season_menu a {
	display: flex;
	padding: 10px 15px;
	color: #666;
	text-decoration: none;
	font-size: 13px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #d2d2d2;
	min-width: 130px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	height: 120px;
}

.container {
	display: flex;
}

.page_menu {
	display: inline-block;
	justify-content: center;
	font-size: 20px;
	margin-right: 20px;
	border-bottom: 2px solid rgba(0, 0, 0, .2);
	border-top: 2px solid rgba(0, 0, 0, .2);
	width: 100%;
	background-color: #fff;
}

#header_navi {
	background-color: #b15a5a;
	backdrop-filter: blur(30px);
}

#header_navi li {
	display: inline-flex;
	align-items: center;
}

#header_navi li img {
	margin-top: 28%;
	margin-right: 10px;
	width: 200px;
	height: 200px;
}

#header_navi li span {
	position: relative;
	margin-top: 30%;
	margin-left: 10px;
	color: white;
	font-size: xx-large;
	font-weight: bolder;
	white-space: nowrap;
}

#header_navi .btn-info {
	background-color: transparent;
	background: #b15a5a;
	color: rgb(254, 254, 254);
	border: 2px solid rgba(251, 249, 249, 0.2);
	font-size: larger;
	padding: 10px 10px;
	margin-left: 220%;
	margin-top: 50%;
	transform: rotate(-360deg);
	white-space: nowrap;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bolder;
}

.blur-background {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5); /* 블러 효과를 위한 반투명한 배경색 */
	backdrop-filter: blur(5px); /* 블러 효과 적용 */
	display: none; /* 초기에는 보이지 않도록 설정 */
}

#modal-container {
	display: none;
	position: fixed;
	padding-top: 15%; 
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 9999;
}

#modal-content {
	width: 400px;
	height: 300px;
	margin: 100px auto;
	background-color: white;
	padding: 20px;
	
}
h1 {
	margin-bottom:30px;
	font-size: 20px;
	
}
.withdraw {
	margin-left: 60%;
}
    .red {
        color: rgb(230, 124, 124);
        text-decoration: none;
    }
    .red:hover {
        text-decoration: underline;
    }
    .centered-table {
        margin-left: 35px;
        margin-top: 20px;
    }
</style>
<script type="text/javascript">
function showModel() {
	var modalContainer = document.getElementById('modal-container');
	modalContainer.style.display = 'block';
}

function hideModal(event) {
	if (event.target === event.currentTarget) {
		var modalContainer = document.getElementById('modal-container');
		modalContainer.style.display = 'none';
	}
}
	function showDropdown(season) {
		var dropdown = document.getElementById(season + "Dropdown");
		dropdown.style.display = "block";
	}

	function hideDropdown(season) {
		var dropdown = document.getElementById(season + "Dropdown");
		dropdown.style.display = "none";
	}

	function redirectToFristPage() {
		window.location.href = "frist.do";
	}
	function redirectToMyPage() {
		window.location.href = "mypage.do";
	}
	function goWrite() {
		if (nickname && nickname != 'null') {
			window.location.href = "write.do";
		} else {
			window.location.href = "login.do";
		}
	}
	function showPasswordChange() {
		var modalContainer = document.getElementById('modal-container');
		modalContainer.style.display = 'block';
	}

	function hideModal(event) {
		if (event.target === event.currentTarget) {
			var modalContainer = document.getElementById('modal-container');
			modalContainer.style.display = 'none';
		}
	}

	function showAlert() {
		alert("패스워드가 변경되었습니다.");
	}
    $('#passwordOk').blur(function() {
        if($('#password').val() != $('#passwordOk').val()) {
           if($('#passwordOk').val()!='') {
              alert("비밀번호가 일치하지 않습니다.");
              $('#passwordOk').val('');
              $('#passwordOk').focus();
           }
        }
     });
</script>
<body>
	<div id="header_wrapper">
		<div class="logo">
			<a href="frist.do">Fashion Weeks</a>
		</div>
	</div>
	<div id="main_menu_container">
		<div id="main_menu">
			<div class="main_menu">
				<a href="">BEST 10</a>
			</div>
			<div class="main_menu">
				<a href="#" onmouseover="showDropdown('spring')">Spring</a>
				<div class="dropdown-content" id="springDropdown"
					style="display: none;" onmouseleave="hideDropdown('spring')">
					<!-- 드롭다운 메뉴 항목 -->
					<a href="board.do?season=spring&age=10">10대</a><br> <a
						href="board.do?season=spring&age=20">20대</a><br> <a
						href="board.do?season=spring&age=30">30대</a>
				</div>
			</div>
			<div class="main_menu">
				<a href="#" onmouseover="showDropdown('summer')">Summer</a>
				<div class="dropdown-content" id="summerDropdown"
					style="display: none;" onmouseleave="hideDropdown('summer')">
					<!-- 드롭다운 메뉴 항목 -->
					<a href="board.do?season=summer&age=10">10대</a><br> <a
						href="board.do?season=summer&age=20">20대</a><br> <a
						href="board.do?season=summer&age=30">30대</a>
				</div>
			</div>
			<div class="main_menu">
				<a href="#" onmouseover="showDropdown('fall')">Fall</a>
				<div class="dropdown-content" id="fallDropdown"
					style="display: none;" onmouseleave="hideDropdown('fall')">
					<!-- 드롭다운 메뉴 항목 -->
					<a href="board.do?season=fall&age=10">10대</a><br> <a
						href="board.do?season=fall&age=20">20대</a><br> <a
						href="board.do?season=fall&age=30">30대</a>
				</div>
			</div>
			<div class="main_menu">
				<a href="#" onmouseover="showDropdown('winter')">Winter</a>
				<div class="dropdown-content" id="winterDropdown"
					style="display: none;" onmouseleave="hideDropdown('winter')">
					<!-- 드롭다운 메뉴 항목 -->
					<a href="board.do?season=winter&age=10">10대</a><br> <a
						href="board.do?season=winter&age=20">20대</a><br> <a
						href="board.do?season=winter&age=30">30대</a>
				</div>
			</div>
			<div class="main_menu">
				<a href="mypage.do">MyPage</a>
			</div>
               <div class="main_menu">
                	<c:if test="${account eq null}">
                		<span id="nickname"></span> <a id="loginYn" href="login.do">Login</a>
                	</c:if>
                	<c:if test="${account ne null}">
                		<span id="nickname"></span><a id="loginYn" href="logout.do">${account.nickname}</a>
                	</c:if>
                </div>
			<div class="main_menu">
                    <a id="writeBtn" onclick="goWrite()">Write</a>
                </div>
		</div>
	</div>
	<ul id="header_navi">
		<li><img src="mypageimg.png"> <span>${account.nickname}님<br>
				환영합니다.
		</span>
			<button class="btn-info" onclick="showModel()">정보수정</button></li>
	</ul>
	<div class="container">
		<div class="page_menu">내 코디</div>
	</div>
	<div id="modal-container" onclick="hideModal()">
		<div id="modal-content">
			<form action="updateInfo.do" method="post" name="updateInfo" onsubmit="return InfoCheck();">
				<h1>정보수정</h1>
				<label for="username">아이디:</label> <input type="text" id="identified" name="identified" value="${account.identified}" ><br><br>

					<labal for="password">패스워드:</labla> <input type="password" id="password" name="password" required><br><br>
					<labla for="passwordOk">패스워드 확인:</labla> <input type="password" id="passwordOk" name="passwordOk" required><br><br>
					<label for="email">이메일:</label> <input type="email" id="email" name="email" value="${account.email}" disabled="disabled"><br> <br> 
					<button class="save" onclick="event.stopPropagation(); showAlert()">저장</button> 
					<button class="close" onclick="redirectToMyPage()">닫기</button>
					<button class="withdraw" onclick="withdrawFromAccount()">탈퇴</button>
			</form>
		</div>
	</div>





	<%
	ArrayList<BoardInfoDTO> list = (ArrayList<BoardInfoDTO>) request.getAttribute("list");
	%>
	<table border="1" class="centered-table">
		<tr>
			<%
			for (int i = 0; i < list.size(); i++) {
				BoardInfoDTO dto = list.get(i);
			%>
			<td width="300" height="300"><img alt="이미지"
				src="<%=dto.getFile()%>" width="370" height="370"><br>${account.nickname}<a
				href="view.do?boardidx=<%=dto.getBoardidx()%>" class="red">♥</a><%=dto.getView()%>
			</td>
			<%
			if ((i + 1) % 4 == 0) {
			%>
		</tr>
	</table>
	<br>
	<table border="1" class="centered-table">
		<tr>
			<%
			}
			}
			%>
		</tr>
</body>
</html>