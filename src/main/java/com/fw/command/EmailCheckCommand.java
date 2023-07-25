package com.fw.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fw.dao.AccountDAO;

public class EmailCheckCommand implements Command{
	
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDAO dao = AccountDAO.getAccountDAO();
		int result = dao.checkEmail(request.getParameter("email"));
		request.setAttribute("result", result);
	}
}
