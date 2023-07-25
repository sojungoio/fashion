<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/Login.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Text&display=swap" rel="stylesheet">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="rectangle">
            <button onclick="redirectToFristPage()"><h1>Fashion Week</h1></button>
            <form method="post" class="joinForm" action="loginok.do" name="loginInfo" onsubmit="return checkValue()">
            <div class="textForm">
                <input name="identified" type="text" class="id" placeholder="아이디" required>
            </div>
            <div class="textForm">
                <input name="password" type="password" class="pw" placeholder="비밀번호" required>
            </div>
            <input type="submit" id="btn" class="btn" value="로그인" />
            <h2>아이디가 없으신가요?<a href="regist.do">회원가입</a></h2>
            <h2>아이디나 패스워드를 잊으셨나요?<a href="">계정찾기</a></h2>
        </div>
    </div>
<script src="js/Login.js"></script>
</body>
</html>