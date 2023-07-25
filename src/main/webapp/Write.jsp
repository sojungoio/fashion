<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<!-- 부트스트랩 js -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<!-- 부트스트랩  css -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 페이지</title>
<style type="text/css">
.container {
	margin-top: 100px;
}

.input-group {
	margin-bottom: 5px;
}

#btn {
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<form method="post" action="writeOK.do" name="boardForm" onsubmit="return checkValue()" enctype="multipart/form-data">
			<!-- 제목 -->
			<div class="input-group">
				<span class="input-group-text" id="inputGroup-sizing-default">제목</span>
				<input name="title" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group">
				<span class="input-group-text">계절 선택</span>
				<select name="season" class="form-select" aria-label="Select category">
					<option selected>Choose...</option>
					<option value="spring">봄</option>
					<option value="summer">여름</option>
					<option value="fall">가을</option>
					<option value="winter">겨울</option>
				</select>
			</div>
			<div class="input-group">
				<span class="input-group-text">연령 선택</span>
				<select name="age" class="form-select" aria-label="Select category">
					<option selected>Choose...</option>
					<option value="10">10대</option>
					<option value="20">20대</option>
					<option value="30">30대</option>
				</select>
			</div>
			<!-- 첨부파일 -->
			<div class="input-group mb-3">
				<input multiple type="file" name="file" class="form-control" id="inputGroupFile02" onchange="setDetailImage(event);"> 
				<label class="input-group-text" for="inputGroupFile02">Upload</label>
			</div>
			<div id="images_container"></div>
			<div class="input-group">
				<span class="input-group-text" id="inputGroup-sizing-default">해시 태그</span>
				<input name="hashTag" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<!-- 내용 -->
			<div class="input-group">
				<span class="input-group-text">내용</span>
				<textarea name="text" class="form-control" aria-label="With textarea" rows="20"></textarea>
			</div>
			<!-- 등록/취소 버튼  -->
			<div id="btn" class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<input type="submit" class="btn btn-primary btn-sm px-3 gap-3" value="등록"></input>
				<input type="button" class="btn btn-outline-secondary btn-sm px-3" value="취소" onclick="goToList()"></input>
			</div>
		</form>
	</div>
<script src="js/Write.js"></script>
</body>
</html>