<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.fw.dao.AccountDAO" %>
<%@ page import="com.fw.dto.AccountDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script>
    function showAlert(message) {
        alert(message);
        window.location.href = "/project/Login.jsp";
    }
</script>
</head>
<body>
<%
    request.setCharacterEncoding("euc-kr"); 
    // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
    String identified = request.getParameter("identified");
    String password = request.getParameter("password");
    
    // DB에서 아이디, 비밀번호 확인
    AccountDAO dao = AccountDAO.getAccountDAO();
    int check = dao.loginCheck(identified, password);
    
    // URL 및 로그인 관련 전달 메시지
    String msg = "";
    String alert = "";
    
    if (check == 1) { // 로그인 성공
        AccountDTO dto = dao.getAccountDTO(identified);
        // 세션에 현재 아이디 세팅
        session.setAttribute("nickname", dto.getNickname());
        
        System.out.println(request.getParameter("nickname"));
        
        session.setAttribute("accountId", dto.getAccountId());
        session.setAttribute("identified", dto.getIdentified());
        session.setAttribute("email", dto.getEmail());
        msg = "/project/Frist.jsp?msg=1";
    } else if (check == 0) { // 비밀번호가 틀릴 경우
    	alert = "비밀번호가 틀렸습니다.";
        msg = "/project/Login.jsp?msg=0";
        %> <!-- alert 창을 띄우기 위해 스크립트 코드 추가 -->
        <script>
            alert("<%= alert %>"); // alert 창 표시
            location.href = "<%= msg %>"; // 페이지 이동
        </script>
        <% // 스크립트 종료
        return; // 코드 실행 중지
    } else { // 아이디가 틀릴 경우
    	alert = "아이디가 틀렸습니다.";
        msg = "/project/Login.jsp?msg=-1";
        %> <!-- alert 창을 띄우기 위해 스크립트 코드 추가 -->
        <script>
            alert("<%= alert %>"); // alert 창 표시
            location.href = "<%= msg %>"; // 페이지 이동
        </script>
        <% // 스크립트 종료
        return; // 코드 실행 중지
    }
    
    // sendRedirect(String URL) : 해당 URL로 이동
    // URL 뒤에 get 방식처럼 데이터를 전달 가능
    response.sendRedirect(msg);
%>
</body>
</html>