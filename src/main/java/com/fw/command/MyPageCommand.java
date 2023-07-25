package com.fw.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fw.dao.AccountDAO;
import com.fw.dto.AccountDTO;
import com.fw.dto.BoardInfoDTO;

public class MyPageCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		AccountDTO account = (AccountDTO)session.getAttribute("account");
		String nickname = account.getNickname();
		
		AccountDAO dao = AccountDAO.getAccountDAO();
		
		ArrayList<BoardInfoDTO> list = dao.listBoardDAOMyCodi(nickname);
		request.setAttribute("list", list);
	}
}
