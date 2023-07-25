package com.fw.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fw.dao.AccountDAO;
import com.fw.dto.AccountDTO;

public class ViewPageCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		String accountId = (String)session.getAttribute("accountId");
		
		if(accountId != null && request.getParameter("boardidx") != null) {
			AccountDAO dao = AccountDAO.getAccountDAO();
			int result = dao.UpDate(request.getParameter("boardidx"));
			
			if(result < 1) {
				System.out.println("좋아요 추가 실패");
			}
			
		} else {
			System.out.println("accountId : " + session.getAttribute("accountId"));
			System.out.println("boardindex : " + request.getParameter("boardindex"));
		}
	}

}
