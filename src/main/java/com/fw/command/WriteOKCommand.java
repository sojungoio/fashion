package com.fw.command;

import java.io.IOException;


import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fw.dao.AccountDAO;
import com.fw.dto.AccountDTO;
import com.fw.dto.BoardInfoDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteOKCommand implements Command {
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDAO dao = AccountDAO.getAccountDAO();
		BoardInfoDTO dto = new BoardInfoDTO();
		
		HttpSession session = request.getSession();
		ServletContext context = request.getServletContext();
		
		String savePath = "/upload";
		String realPath = context.getRealPath(savePath);
		System.out.println("savePath " + savePath);
		
		
		int fileSizeLimit = 1024 * 1024;
		String encType = "UTF-8"; 
		MultipartRequest multi = new MultipartRequest(request, realPath, fileSizeLimit, encType, new DefaultFileRenamePolicy());
		// 세션 객체 가져오기
		// 세션 객체에서 어카운트 아이디 가져오기
		// dto에 어카운트 아이디 set 하기
		dto.setAccountId(multi.getParameter("accountId"));
		dto.setSeason(multi.getParameter("season"));
		dto.setAge(multi.getParameter("age"));
		dto.setTitle(multi.getParameter("title"));
		dto.setText(multi.getParameter("text"));
		//dto.setIsDelete(multi.getParameter("isDelete"));
		dto.setHashTag(multi.getParameter("hashTag"));
		
		System.out.println(session.getAttribute("nickname"));
		
		String nickname = (String)session.getAttribute("nickname");
		
		dto.setNickname(nickname);
		
		String files = null;
		
		Enumeration fileList = multi.getFileNames();
		while(fileList.hasMoreElements()) {
			String file = (String) fileList.nextElement();
			String fileName = multi.getFilesystemName(file);
			
			System.out.println(fileName);
			
			if(fileName!=null) {
				files = request.getContextPath() + savePath + "/" + fileName;
			}
		}
		
		dto.setFile(files);
		dao.writeOKDAO(dto);		
		System.out.println(dto.toString());
	}
	
}