<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.fw.dto.BoardInfoDTO" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Text&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cardo&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&family=Orbit&display=swap" rel="stylesheet">

<title>Insert title here</title>
</head>
<style>
body{
    background-color: #fff;
    overflow-y:scroll
}
#hearder_wrapper{
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
#header_wrapper .logo a{
    margin-left: 38px;
    font-size: xxx-large;
    font-weight: bold;
    text-decoration: none;
    color: black;
    font-family: 'DM Serif Text', serif;
}
a, button{
    cursor: pointer;
}
#main_menu_container{
    border-bottom: 2px solid rgba(0, 0, 0, .2);
    border-top: 2px solid rgba(0, 0, 0, .2);
    width: 100%;
    background-color: #fff;
    margin-top: 150px;
    margin-bottom: 30px;
}
#main_menu_container #main_menu {
    display: flex;
    justify-content: space-between;
    margin: 30px 100px; /* 위아래 30px, 좌우는 각각 요소들 사이의 간격으로 조정 */
    max-width: 1300px;
    position: relative;
}
#main_menu_container .main_menu a{
    display: flex;
    margin-right: 150px; 
    justify-content: center;
    color: #666;
    text-decoration: none;
    white-space: nowrap;
    font-size: 15px;
    font-family: 'Cardo', serif;
}
.season balloon{
    position: absolute;
    left: 160px;
    top: 45px;
    z-index: 100;
    width: 140px;
    box-shadow: 0 2px 5px 0 rgba(0,0,0,.15);
    border: 1px solid rgba(0,0,0,.12);
    border-radius: 3px;
    background: #fff;
    padding: 5px 0;
}
#main_menu_container .season_menu a{
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
table {
	margin-left: 20px;
	border-collapse: collapse;
	border: none;
}
td {
  border: none;
  padding-right: 10px;
}
tr {
	border: none;
}
.centered-table {
        margin-left: 43px;
    }
    .red {
        color: rgb(230, 124, 124);
        text-decoration: none;
    }
    .red:hover {
        text-decoration: underline;
    }
</style>
<script type="text/javascript">

function showDropdown(season) {
	var dropdown = document.getElementById(season + "Dropdown");
	dropdown.style.display = "block";
}

function hideDropdown(season) {
	var dropdown = document.getElementById(season + "Dropdown");
	dropdown.style.display = "none";
}
</script>
<body>
    <div id="header_wrapper">
        <div class="logo">
            <a href="Frist.jsp">Fashion Weeks</a>
        </div>
    </div>
        <div id="main_menu_container">
            <div id="main_menu">
                <div class="main_menu">
                    <a href="">BEST 10</a>
                </div>
                <div class="main_menu">
                    <a href="#" onmouseover="showDropdown('spring')">Spring</a>
                    <div class="dropdown-content" id="springDropdown" style="display: none;" onmouseleave="hideDropdown('spring')">
                        <!-- 드롭다운 메뉴 항목 -->
                        <a href="board.do?season=spring&age=10">10대</a><br>
                        <a href="board.do?season=spring&age=20">20대</a><br>
                        <a href="board.do?season=spring&age=30">30대</a>
                    </div>
                </div>
                <div class="main_menu">
                    <a href="#" onmouseover="showDropdown('summer')">Summer</a>
                    <div class="dropdown-content" id="summerDropdown" style="display: none;" onmouseleave="hideDropdown('summer')">
                        <!-- 드롭다운 메뉴 항목 -->
                        <a href="board.do?season=summer&age=10">10대</a><br>
                        <a href="board.do?season=summer&age=20">20대</a><br>
                        <a href="board.do?season=summer&age=30">30대</a>
                    </div>
                </div>
                <div class="main_menu">
                    <a href="#" onmouseover="showDropdown('fall')">Fall</a>
                    <div class="dropdown-content" id="fallDropdown" style="display: none;" onmouseleave="hideDropdown('fall')">
                        <!-- 드롭다운 메뉴 항목 -->
                        <a href="board.do?season=fall&age=10">10대</a><br>
                        <a href="board.do?season=fall&age=20">20대</a><br>
                        <a href="board.do?season=fall&age=30">30대</a>
                    </div>
                </div>
                <div class="main_menu">
                    <a href="#" onmouseover="showDropdown('winter')">Winter</a>
                    <div class="dropdown-content" id="winterDropdown" style="display: none;" onmouseleave="hideDropdown('winter')">
                        <!-- 드롭다운 메뉴 항목 -->
                        <a href="board.do?season=winter&age=10">10대</a><br>
                        <a href="board.do?season=winter&age=20">20대</a><br>
                        <a href="board.do?season=winter&age=30">30대</a>
                    </div>
                </div>
                <div class="main_menu">
                	<a id="mypageBtn" href="mypage.do">MyPage</a>
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
                		<a id="writeBtn" href="write.do">Write</a>
                </div>
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
        <td width="300" height="300">
            <img alt="이미지" src="<%= dto.getFile() %>" width="400" height="400"><br>
            ${account.nickname}<a href="view.do?boardidx=<%= dto.getBoardidx() %>" class="red">♥</a><%= dto.getView() %>
        </td>
<%
        if ((i + 1) % 4 == 0) {
%>
    </tr>
</table><br>
<table border="1" class="centered-table">
    <tr>
<%			
        }
    }
%>
    </tr>
</table>
</html>