package com.fw.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fw.dao.AccountDAO;
import com.fw.dto.BoardInfoDTO;

public class BoardCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDAO dao = AccountDAO.getAccountDAO();
		ArrayList<BoardInfoDTO> list = dao.listBoardDAO(request.getParameter("season"), request.getParameter("age"));
		request.setAttribute("list", list);
	}
}


