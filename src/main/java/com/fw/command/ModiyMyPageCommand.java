package com.fw.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fw.dao.AccountDAO;
import com.fw.dto.AccountDTO;

public class ModiyMyPageCommand implements Command{
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		AccountDTO account = (AccountDTO) session.getAttribute("account");
		AccountDAO dao = AccountDAO.getAccountDAO();
		int cnt = dao.updateInfo(account);
		
		if(cnt < 1) {
			System.out.println("비밀번호를 다시 입력해주세요.");
		}
		
		System.out.println("변경할놈 아이디 : " + request.getParameter("identified"));
		System.out.println("변경할놈 패스워드 : " + request.getParameter("password"));
	}
}
