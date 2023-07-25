package com.fw.command;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fw.dao.AccountDAO;
import com.fw.dto.AccountDTO;

public class insertAccountCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String birthStr = request.getParameter("birth");
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		Date birth = null;
//		try {
//			birth = (Date) format.parse(birthStr);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		AccountDAO dao = AccountDAO.getAccountDAO();
		AccountDTO dto = new AccountDTO();
		 
		dto.setEmail(request.getParameter("email"));
		dto.setIdentified(request.getParameter("identified"));
		dto.setPassword(request.getParameter("password"));
		dto.setNickname(request.getParameter("nickname"));
//		dto.setBirth(birth);
//		dto.setGender(request.getParameter("gender"));
		dao.insertAccountDAO(dto);		
	}

}
