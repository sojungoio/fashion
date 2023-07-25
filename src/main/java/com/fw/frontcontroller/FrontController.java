package com.fw.frontcontroller;

import java.io.IOException;


import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fw.command.BoardCommand;
import com.fw.command.Command;
import com.fw.command.DeleteCommand;
import com.fw.command.EmailCheckCommand;
import com.fw.command.FristCommand;
import com.fw.command.IDCheckCommand;
import com.fw.command.LoginOkCommand;
import com.fw.command.ModiyMyPageCommand;
import com.fw.command.MyPageCommand;
import com.fw.command.NameCheckCommand;
import com.fw.command.NicknameCheckCommand;
import com.fw.command.ReplyOKCommand;
import com.fw.command.ViewPageCommand;
import com.fw.command.WriteOKCommand;
import com.fw.command.getAccountCommand;
import com.fw.command.insertAccountCommand;
import com.fw.dao.AccountDAO;
import com.fw.dto.AccountDTO;
import com.fw.dto.BoardInfoDTO;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	public void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String commandName = request.getServletPath();
		String viewPage = null;
		Command command = null;
		PrintWriter out = null;
		int flag = 0;

		if (commandName.equals("/login.do")) {
			viewPage = "Login.jsp";
			flag = 1;
		} else if (commandName.equals("/getAccount.do")) {
			command = new getAccountCommand();
			command.excute(request, response);
			viewPage = "getAccount.do";
			flag = 1;
		} else if (commandName.equals("/alert.do")) {
			viewPage = "alert.jsp";
			flag = 1;
		} else if (commandName.equals("/regist.do")) {
			viewPage = "Regist.jsp";
			flag = 1;
		} else if (commandName.equals("/search.do")) {
			viewPage = "Search.jsp";
			flag = 1;
		} else if (commandName.equals("/insertAccount.do")) {
			command = new insertAccountCommand();
			command.excute(request, response);
			HttpSession session = request.getSession();
			viewPage = "login.do";
			flag = 1;
		} else if (commandName.equals("/mypage.do")) {
			HttpSession session = request.getSession();
			AccountDTO dto = (AccountDTO) session.getAttribute("account");
			if(dto != null) {
				command = new MyPageCommand();
				command.excute(request, response);
				viewPage = "MyPage.jsp";
				flag = 1;
			}
			else {
				viewPage = "login.do";
			}
		} else if (commandName.equals("/frist.do")) {
			command = new FristCommand();
			command.excute(request, response);
			viewPage = "Frist.jsp";
			flag = 1;
		} else if (commandName.equals("/loginok.do")) {
			command = new LoginOkCommand();
			command.excute(request, response);
			viewPage = "alert.do";
			flag = 1;
		} else if (commandName.equals("/logout.do")) {
			HttpSession session = request.getSession(); // 세션 가져오기
			session.invalidate(); // 세션 삭제
			viewPage = "Frist.jsp";
			flag = 1;
		//새로 추가한 내용
		} else if (commandName.equals("/write.do")) {
			HttpSession session = request.getSession();
			AccountDTO dto = (AccountDTO) session.getAttribute("account");
			if(dto != null) {
				viewPage = "Write.jsp";
				flag = 1;
			}
			else {
				viewPage = "login.do";
			}
		} else if (commandName.equals("/board.do")) {
			command = new BoardCommand();
			command.excute(request, response);
			HttpSession session = request.getSession();
			viewPage = "Board.jsp";
			flag = 1;
		} else if(commandName.equals("/writeOK.do")) {
			command = new WriteOKCommand();
			command.excute(request, response);
			viewPage = "frist.do";
			flag = 1;

		} else if(commandName.equals("/delete.do")) {
			command = new DeleteCommand();
			command.excute(request, response);
			viewPage = "frist.do";
			flag =1;
		} else if(commandName.equals("/replyOK.do")) {
			command = new ReplyOKCommand();
			command.excute(request, response);
			viewPage = "frist.do";	
			
			
		} else if (commandName.equals("/idCheck.do")) {
			command = new IDCheckCommand();
			command.excute(request, response);
			out = response.getWriter();
//			System.out.println("result " + request.getAttribute("result"));
			out.write(request.getAttribute("result") + "");
			flag = 2;
		} else if (commandName.equals("/emailCheck.do")) {
			command = new EmailCheckCommand();
			command.excute(request, response);
			out = response.getWriter();
//			System.out.println("result " + request.getAttribute("result"));
			out.write(request.getAttribute("result") + "");
			flag = 2;
		} else if (commandName.equals("/nameCheck.do")) {
			command = new NameCheckCommand();
			command.excute(request, response);
			out = response.getWriter();
//			System.out.println("result " + request.getAttribute("result"));
			out.write(request.getAttribute("result") + "");
			flag = 2;
		} else if (commandName.equals("/nicknameCheck.do")) {
			command = new NicknameCheckCommand();
			command.excute(request, response);
			out = response.getWriter();
//			System.out.println("result " + request.getAttribute("result"));
			out.write(request.getAttribute("result") + "");
			flag = 2;
			
		} else if (commandName.equals("/updateInfo.do")) {
			command = new ModiyMyPageCommand();
			command.excute(request, response);
			viewPage = "frist.do";
			flag = 1;
			
		} else if (commandName.equals("/deleteInfo.do")) {
			
			AccountDAO dao = AccountDAO.getAccountDAO();
			int cnt = dao.deleteInfo(request.getParameter("identified"));
			
			if(cnt < 1) {
				System.out.println("삭제가 불가능합니다.");
			}
			
			System.out.println("삭제할놈 아이디 : " + request.getParameter("identified"));
			System.out.println("삭제할놈 패스워드 : " + request.getParameter("password"));
			
			HttpSession session = request.getSession(); // 세션 가져오기
			session.invalidate(); // 세션 삭제
			viewPage = "frist.do";
			flag = 1;
			
		} else if (commandName.equals("/BoardInfo.do")) {
			
			BoardInfoDTO BoardInfoVO = new BoardInfoDTO();
			BoardInfoVO.setAccountId(request.getParameter("identified"));
			BoardInfoVO.setSeason   (request.getParameter("season"    ));
			BoardInfoVO.setAge      (request.getParameter("age"       ));
			BoardInfoVO.setTitle    (request.getParameter("title"     ));
			BoardInfoVO.setText     (request.getParameter("text"      ));
			BoardInfoVO.setFile     (request.getParameter("file"      ));
			BoardInfoVO.setHashTag  (request.getParameter("hashTag"   ));
			
			
			AccountDAO dao = AccountDAO.getAccountDAO();
			int cnt = dao.writeOKDAO(BoardInfoVO);
			
			System.out.println("hi");
			
			if(cnt < 1) {
				System.out.println("등록 실패");
			}
			
			flag = 1;
			
		} else if (commandName.equals("/view.do")) {
			
			
			System.out.println("야야 : " + request.getParameter("boardidx"));
			
			command = new ViewPageCommand();
			command.excute(request, response);
			
			flag = 1;
			
			AccountDAO dao = AccountDAO.getAccountDAO();
			BoardInfoDTO boardDto = dao.selectBoard(request.getParameter("boardidx"));
			
			viewPage = "board.do?season=" + boardDto.getSeason() + "&age=" + boardDto.getAge();
			
		}
		
		if (flag == 0) {
			response.sendRedirect(viewPage);
		} else if (flag == 1) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}

	}
}