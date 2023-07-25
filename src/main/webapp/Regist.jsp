<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" href="css/Regist.css">
   	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Text&display=swap" rel="stylesheet">
    
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<form name="joinForm" action="insertAccount.do" method="POST"
		class="joinForm" onsubmit="return checkValidation();">
    <div class="container">
        <div class="rectangle">
            <button onclick="redirectToFristPage()"><h1>Fashion Week</h1></button>
            <div class="textForm">
                <input name="identified" id="identified" type="text" class="id"
                    placeholder="아이디"> <span id="idCheckMsg"></span>
            </div>
            <div class="textForm">
                <input name="password" id="password" type="password" class="pw"
                    placeholder="비밀번호">
            </div>
            <div class="textForm">
                <input name="passwordOk" id="passwordOk" type="password" class="pw"
                    placeholder="비밀번호 확인">
            </div>
            <div class="textForm">
                <input name="name" type="text" id="name" class="name" placeholder="이름"> <span id="nameCheckMsg"></span>
            </div>
            <div class="textForm">
                <input name="email" id="email" type="email" class="email"
                    placeholder="이메일"> <span id="emailCheckMsg"></span>
            </div>
            <div class="textForm">
                <input name="nickname" type="text" id="nickname" class="nickname"
                    placeholder="닉네임"> <span id="nicknameCheckMsg"></span>
            </div>
            <input type="submit" id="btn" class="btn" value="J O I N" />
            <h2>이미 계정이 있으신가요?<a href="login.do">로그인</a></h2>
        </div>
    </div>
<script src="js/Regist.js"></script>
</body>
</html>