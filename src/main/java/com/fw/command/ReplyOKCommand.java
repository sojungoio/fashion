package com.fw.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fw.dao.AccountDAO;
import com.fw.dto.AccountDTO;

public class ReplyOKCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDAO dao = AccountDAO.getAccountDAO();
		AccountDTO dto = new AccountDTO();
	/*
		dto.setName(request.getParameter("name"));
		dto.setTitle(request.getParameter("title"));
		dto.setContents(request.getParameter("contents"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setGroupNum(Integer.parseInt(request.getParameter("groupNum")));
		dto.setStepNum(Integer.parseInt(request.getParameter("stepNum")));
		dto.setIndentNum(Integer.parseInt(request.getParameter("indentNum")));
		dao.replyOKDAO(dto);
	*/
	}
}