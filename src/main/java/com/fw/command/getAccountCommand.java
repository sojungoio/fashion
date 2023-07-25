package com.fw.command;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fw.dao.AccountDAO;
import com.fw.dto.AccountDTO;

public class getAccountCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDAO dao = AccountDAO.getAccountDAO();
		AccountDTO dto = dao.getAccountDTO(request.getParameter("identified"));
		// 세션 객체 가져오기
		// 세션 객체에 어카운트 아이디
		request.setAttribute("dto", dto);
	}
}