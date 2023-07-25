package com.fw.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fw.dao.AccountDAO;
import com.fw.dto.AccountDTO;

public class LoginOkCommand implements Command{
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("euc-kr");
	    
	    HttpSession session = request.getSession();
	    // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
	    String identified = request.getParameter("identified");
	    String password = request.getParameter("password");
	    
	    // DB에서 아이디, 비밀번호 확인
	    AccountDAO dao = AccountDAO.getAccountDAO();
	    int check = dao.loginCheck(identified, password);
	    
	    // URL 및 로그인 관련 전달 메시지
	    String url = "";
	    String alert = "";
	    
	    if (check == 1) { // 로그인 성공
	        AccountDTO dto = dao.getAccountDTO(identified);
	        // 세션에 현재 아이디 세팅
	        session.setAttribute("account", dto);
	        alert = "로그인 성공";
	        url = "frist.do";
	    } else if (check == 0) { // 비밀번호가 틀릴 경우
	    	alert = "비밀번호가 틀렸습니다.";
	    	url = "login.do";
	    } else { // 아이디가 틀릴 경우
	    	alert = "아이디가 틀렸습니다.";
	    	url = "login.do";
	    }
	    
	    request.setAttribute("alert", alert);
	    request.setAttribute("url", url);
		
	}
}
