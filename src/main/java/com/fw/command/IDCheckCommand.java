package com.fw.command;

import java.io.IOException;



import com.fw.dao.AccountDAO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IDCheckCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDAO dao = AccountDAO.getAccountDAO();
		int result = dao.checkId(request.getParameter("identified"));
		request.setAttribute("result", result);
	}
}