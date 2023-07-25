<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.fw.dto.AccountDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<%
	int cnt = (Integer) request.getAttribute("result");
	AccountDTO dto = (AccountDTO) request.getAttribute("dto");
	//(String)session.getAttribute("nickname");
	%>
	<%
	if (cnt == 0) {
	%>
	<script>
		alert("등록 실패");
		history.back();
	</script>
	<%
	} else {
	%>
	<script>
		alert("등록 성공");
		location.href = "view.frist.do";
		";
	</script>
	<%
	}
	%>
</body>
</html>