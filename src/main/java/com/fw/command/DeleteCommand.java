package com.fw.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fw.dao.AccountDAO;

public class DeleteCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDAO dao = AccountDAO.getAccountDAO();
		dao.deleteDAO(Integer.parseInt(request.getParameter("num")));
	}
}