<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fw.dto.AccountDTO" %>
<%@ page import="com.fw.dto.BoardInfoDTO" %>
<%@ page import="java.util.ArrayList"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script src="js/jquery-3.6.0.min.js"></script>
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
.slideshow-container {
          max-width: 1500px;
          position: relative;
          margin-left: 7%;
        }
        
        .mySlides {
          display: none;
        }
        
        .slideshow-container img {
            width: calc(33.33% - 20px);
          height: auto;
          float: left;
          box-sizing: border-box;
          margin: 0 5px;
          border: 1px solid rgba(0,0,0,.12);
        }
        
        .prev{
          cursor: pointer;
          position: absolute;
          left: 0%;
          top: 50%;
          width: auto;
          padding: 16px;
          margin-top: 200px;
          color: white;
          font-weight: bold;
          font-size: 18px;
          transition: 0.6s ease;
          border-radius: 0 3px 3px 0;
          user-select: none;
          background-color: rgba(0, 0, 0, 0.5); /* 버튼 배경색 */
        }
        .next {
          cursor: pointer;
          position: absolute;
          top: 50%;
          width: auto;
          padding: 16px;
          margin-top: 200px;
          color: white;
          font-weight: bold;
          font-size: 18px;
          transition: 0.6s ease;
          border-radius: 0 3px 3px 0;
          user-select: none;
          background-color: rgba(0, 0, 0, 0.5); /* 버튼 배경색 */
        }
        
        .next {
          right: 30px;
          border-radius: 3px 0 0 3px;
        }
        
        .prev:hover,
        .next:hover {
          background-color: rgba(92, 89, 89, 0.76);
        }
        
        .clearfix::after {
          content: "";
          clear: both;
          display: table;
        }
h1{
    font-size: 30px;
    margin-left: 43%;
    margin-top: 4%;
    font-family: 'Orbit', sans-serif;
}
.best {
  color: rgb(230, 124, 124); /* BEST의 색상을 빨강으로 설정 */
}

.codi {
  color: black; /* 코디의 색상을 검정으로 설정 */
}
</style>
<script>
function redirectToMyPage() {
	window.location.href = "mypage.do";
}

function showDropdown(season) {
	var dropdown = document.getElementById(season + "Dropdown");
	dropdown.style.display = "block";
}

function hideDropdown(season) {
	var dropdown = document.getElementById(season + "Dropdown");
	dropdown.style.display = "none";
}
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
	showSlides(slideIndex += n);
}

function showSlides(n) {
	var i;
	var slides = document.getElementsByClassName("mySlides");

	if (n > slides.length) {
		slideIndex = 1;
	}

	if (n < 1) {
		slideIndex = slides.length;
	}

	for (i = 0; i < slides.length; i++) {
		slides[i].style.display = "none";
	}

	slides[slideIndex - 1].style.display = "block";
}

// JavaScript to show and hide the blurred background and image container
document.addEventListener('DOMContentLoaded', function() {
	var imageContainer1 = document.querySelector('.image-container1');
	var blurBackground = document.getElementById('blurBackground');
	var imageContainer = document.getElementById('imageContainer');
	var viewCount = document.getElementById('viewCount');
	var commentsSection = document.getElementById('commentsSection');

	imageContainer1.addEventListener('click', function(e) {
		if (e.target.tagName === 'IMG') {
			var imgSrc = e.target.src;
			var imgAlt = e.target.alt;
			var imgViewCount = e.target.getAttribute('data-view-count');
			var imgComments = e.target.getAttribute('data-comments');

			blurBackground.style.display = 'block';
			imageContainer.style.display = 'block';
			imageContainer.querySelector('img').src = imgSrc;
			imageContainer.querySelector('img').alt = imgAlt;
			viewCount.textContent = 'View Count: ' + imgViewCount;

			// Clear existing comments
			commentsSection.innerHTML = '';

			// If there are comments, add them to the comments section
			if (imgComments) {
				var comments = imgComments.split(',');
				comments.forEach(function(comment) {
					var newComment = document.createElement('p');
					newComment.textContent = comment;
					commentsSection.appendChild(newComment);
				});
			}
		}
	});

	blurBackground.addEventListener('click', function() {
		blurBackground.style.display = 'none';
		imageContainer.style.display = 'none';
	});

	document.getElementById('commentForm')
		.addEventListener(
			'submit',
			function(e) {
				e.preventDefault();
				var comment = document
					.getElementById('commentInput').value;
				var newComment = document.createElement('p');
				newComment.textContent = comment;
				commentsSection.appendChild(newComment);
				document.getElementById('commentInput').value = '';
			});
});

var blurBackground = document.getElementById("blurBackground");
var imageContainer = document.getElementById("imageContainer");

imageContainer.addEventListener("click", function() {
	blurBackground.style.display = "block";
	imageContainer.style.zIndex = "3";
	imageContainer.style.transform = "scale(1.1)";
});

blurBackground.addEventListener("click", function() {
	blurBackground.style.display = "none";
	imageContainer.style.zIndex = "2";
	imageContainer.style.transform = "scale(1)";
});

</script>
<body>
    <div id="header_wrapper">
        <div class="logo">
            <a href="">Fashion Weeks</a>
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
        <h1>이달의 <span class="best">BEST</span> <span class="codi">코디</span></h1>
        
		<div class="slideshow-container">
	        <%
				ArrayList<BoardInfoDTO> list = (ArrayList<BoardInfoDTO>)request.getAttribute("list");
	        	if (list != null) {
					for(int i=0; i < list.size(); i += 3) {
						BoardInfoDTO dto = list.get(i);
						BoardInfoDTO dto1 = list.get(i+1);
						BoardInfoDTO dto2 = list.get(i+2);
					
			%>
						<div class="mySlides">
							<img src="<%= dto.getFile() %>" >
							<img src="<%= dto1.getFile() %>" >
							<img src="<%= dto2.getFile() %>" >
						</div>
			<%
					} 
	        	}
			%>
		
          <a class="prev" onclick="plusSlides(-1)">❮</a>
          <a class="next" onclick="plusSlides(1)">❯</a>
        </div>   
</body>
</html>