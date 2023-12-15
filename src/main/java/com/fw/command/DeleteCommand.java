package com.fw.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fw.dao.AccountDAO;
import com.fw.dto.AccountDTO;

public class DeleteCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		AccountDTO account = (AccountDTO)session.getAttribute("account");
		AccountDAO dao = AccountDAO.getAccountDAO();
		
		int cnt = dao.deleteInfo(account);
	}
}
