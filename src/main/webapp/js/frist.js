const nickname = '<%=(String)session.getAttribute("nickname")%>';

$(document).ready(function(){
    if (nickname && nickname != 'null') {
        $("#nickname").html(nickname + "님");
        $("#loginYn").html('Logout');
        
     }else {
        $("#nickname").html("");
        $("#loginYn").html('Login');
     }
});
function redirectToFristPage() {
	if (nickname && nickname != 'null') {
		window.location.href = "logout.do";
	} else {
		window.location.href = "login.do";
	}
}
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


/*
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
*/