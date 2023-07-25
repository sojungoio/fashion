package com.fw.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.fw.dto.AccountDTO;
import com.fw.dto.BoardInfoDTO;

public class AccountDAO {
	private static AccountDAO accountDAO = new AccountDAO();
	private String CONNECTION_POOL_RESOURCE_NAME = "jdbc/fashion";
	private final String TABLE_NAME = "account";
	private DataSource dataSource;

	private AccountDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/" + CONNECTION_POOL_RESOURCE_NAME);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static AccountDAO getAccountDAO() {
		return accountDAO;
	}
	
	// 회원정보 가져오기
	public AccountDTO getAccountDTO(String identified) {
		final String sql = "SELECT * FROM " + TABLE_NAME + " WHERE identified = '" + identified  + "'";
		System.out.println(sql);
		AccountDTO dto = new AccountDTO();
		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			if (rs.next()) {
				dto = new AccountDTO();
				dto.setAccountId(rs.getString("AccountId"));
				dto.setIdentified(rs.getString("identified"));
				dto.setPassword(rs.getString("password"));
				dto.setEmail(rs.getString("email"));
				dto.setCreatedDttm(rs.getString("createdDttm"));
				dto.setNickname(rs.getString("nickname"));
				dto.setName(rs.getNString("name"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	// 회원정보 넣기
	public void insertAccountDAO(AccountDTO dto) {
		// AccountId 생성 :: 현재 행의 갯수 + 1, 8글자, 왼쪽 빈공간 0으로 채우기
		// LPAD((SELECT CNT FROM (SELECT COUNT(*) + 1 AS CNT FROM FASHION.ACCOUNT) AS
		// ACCOUNTID), '8', '0')
		final String sql = "INSERT INTO ACCOUNT (AccountId, email, identified, password, createdDttm, nickname, name) "
				+ "VALUES (LPAD((SELECT CNT FROM (SELECT COUNT(*) + 1 AS CNT FROM FASHION.ACCOUNT) AS ACCOUNTID), '8', '0'), ?, ?, ?, NOW(), ?, ?)";

		int result = 0;
		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, dto.getEmail());
			ps.setString(2, dto.getIdentified());
			ps.setString(3, dto.getPassword());
			ps.setString(4, dto.getNickname());
			ps.setString(5, dto.getName());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 아이디 유효성 검사
	public int checkId(String identified) {
		String sql = "SELECT * FROM " + TABLE_NAME + " WHERE identified = '" + identified + "'";
		int result = 0;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			if (rs.next())
				result = 0;
			else
				result = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 이름 유효성 검사 
	public int checkname(String name) {
		String sql = "SELECT * FROM " + TABLE_NAME + " WHERE name = '" + name + "'";
		int result = 0;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			if (rs.next())
				result = 0;
			else
				result = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 이메일로 회원정보 조회
	public int checkEmail(String email) {
		String sql = "SELECT * FROM " + TABLE_NAME + " WHERE email = '" + email + "'";
		int result = 0;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			if (rs.next())
				result = 0;
			else
				result = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 닉네임으로 회원정보 조회
	public int nicknameCheck(String nickname) {
		String sql = "SELECT * FROM " + TABLE_NAME + " WHERE nickname = '" + nickname + "'";
		int result = 0;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			if (rs.next())
				result = 0;
			else
				result = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 로그인 체크
	  public int loginCheck(String identified, String password) 
	    {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	 
	        String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
	        int x = -1;
	 
	        try {
	            // 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
	            StringBuffer query = new StringBuffer();
	            query.append("SELECT PASSWORD FROM ACCOUNT WHERE Identified=?");
	 
	            conn = dataSource.getConnection();
	            pstmt = conn.prepareStatement(query.toString());
	            pstmt.setString(1, identified);
	            rs = pstmt.executeQuery();
	 
	            if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
	            {
	                dbPW = rs.getString("password"); // 비번을 변수에 넣는다.
	 
	                if (dbPW.equals(password)) 
	                    x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
	                else                  
	                    x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
	                
	            } else {
	                x = -1; // 해당 아이디가 없을 경우
	            }
	 
	            return x;
	 
	        } catch (Exception sqle) {
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
	    } // end loginCheck()

	// 회원정보 수정
	public int updateInfo(AccountDTO account) {
		
		String password = account.getPassword();
		String identified = account.getIdentified();
		
		String sql = "UPDATE " + TABLE_NAME + " SET password = '" + password + "' WHERE identified = '" + identified + "'";


		System.out.println(sql);

		int result = 0;
		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 회원정보 삭제
	public int deleteInfo(String identified) {
		AccountDTO dto = this.getAccountDTO(identified);

		String sql = "DELETE FROM " + TABLE_NAME + " WHERE AccountId = '" + dto.getAccountId() + "'";

		System.out.println(sql);

		int result = 0;
		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
	// 게시판 글쓰기 업로드
	public int writeOKDAO(BoardInfoDTO dto) {	
		final String sql = "INSERT INTO BoardInfo( boardidx, AccountId, season, age, title, text, isDelete, createDttm, file, hashTag, nickname ) values( (SELECT A.boardidx FROM (SELECT IFNULL(MAX(boardidx),0) + 1 AS boardidx FROM BoardInfo) A ) , ?, ?, ?, ?, ?, true, now(), ?, ?, ?)";
		int result = 0;
		System.out.println(sql);
		System.out.println(dto.getFile());
		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql))
		{
			ps.setString(1, dto.getAccountId());
			ps.setString(2, dto.getSeason());
			ps.setString(3, dto.getAge());
			ps.setString(4, dto.getTitle());
			ps.setString(5, dto.getText());
			ps.setString(6, dto.getFile());
			ps.setString(7, dto.getHashTag());
			ps.setString(8, dto.getNickname());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	// 게시판 삭제 기능
	public void deleteDAO(int no) {
		final String sql =
				"DELETE FROM " + TABLE_NAME + " WHERE no=?";
		int result = 0;
		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql))
		{
			ps.setInt(1, no);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//게시글리스트
	public ArrayList<BoardInfoDTO> listBoardDAO(String season, String age){
		ArrayList<BoardInfoDTO> list = new ArrayList<BoardInfoDTO>();
		final String sql = "SELECT * FROM " + "BoardInfo A left outer join account B on A.AccountId = B.AccountId" + " WHERE A.season = '" + season + "' AND age = '" + age + "'";
		System.out.println(sql);
		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery())
		{
			while(rs.next()) {
				BoardInfoDTO dto = new BoardInfoDTO();
				dto.setBoardidx(rs.getInt("boardidx"));
				dto.setSeason(rs.getString("season"));
				dto.setAge(rs.getString("age"));
				dto.setTitle(rs.getString("title"));
				dto.setText(rs.getString("text"));
				dto.setFile(rs.getString("file"));
				dto.setHashTag(rs.getString("hashTag"));
				dto.setView(rs.getInt("view"));
				dto.setNickname(rs.getString("nickname"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<BoardInfoDTO> listBoardDAOByLike(){
		ArrayList<BoardInfoDTO> list = new ArrayList<BoardInfoDTO>();
		final String sql = "select * from Boardinfo order by view desc limit 9";
		System.out.println(sql);
		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery())
		{
			while(rs.next()) {
				BoardInfoDTO dto = new BoardInfoDTO();
				dto.setBoardidx(rs.getInt("boardidx"));
				dto.setSeason(rs.getString("season"));
				dto.setAge(rs.getString("age"));
				dto.setTitle(rs.getString("title"));
				dto.setText(rs.getString("text"));
				dto.setFile(rs.getString("file"));
				dto.setHashTag(rs.getString("hashTag"));
				dto.setView(rs.getInt("view"));
				dto.setNickname(rs.getString("nickname"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
//	public ArrayList<BoardInfoDTO> listBoardDAOMyCodi(String identified){
	public ArrayList<BoardInfoDTO> listBoardDAOMyCodi(String nickname){
		ArrayList<BoardInfoDTO> list = new ArrayList<BoardInfoDTO>();
//		final String sql = "select * from boardinfo where identified = '" + identified + "'";
		final String sql = "select * from boardinfo where nickname = '" + nickname + "'";
		System.out.println(sql);
		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery())
		{
			while(rs.next()) {
				BoardInfoDTO dto = new BoardInfoDTO();
				dto.setBoardidx(rs.getInt("boardidx"));
				dto.setSeason(rs.getString("season"));
				dto.setAge(rs.getString("age"));
				dto.setTitle(rs.getString("title"));
				dto.setText(rs.getString("text"));
				dto.setFile(rs.getString("file"));
				dto.setHashTag(rs.getString("hashTag"));
				dto.setView(rs.getInt("view"));
				dto.setNickname(rs.getString("nickname"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
/*
	// 댓글 기능
	public AccountDTO replyDAO(String no) {
		AccountDTO dto = getAccountDTO(no);
		return dto;
	}

	public void modifyOK(AccountDTO dto) {
		final String sql = "UPDATE " + TABLE_NAME + " SET TITLE=?, TEXT=?, FILE=?, WTIME=NOW() WHERE no=?";
		int result = 0;
		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql))
		{
			ps.setString(1, dto.gettitle());
			ps.setString(2, dto.gettext());
			ps.setString(3, dto.getfile());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
*/
	public int UpDate(String boardidx) {
		final String sql = "UPDATE " + "BoardInfo SET view = view + 1 WHERE boardidx = '" + boardidx + "'" ;
		System.out.println(sql);
		int result = 0;
		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql))
		{
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//게시글 정보 가져오기
	public BoardInfoDTO selectBoard(String boardidx) {
		final String sql = "SELECT * FROM BoardInfo WHERE boardidx = '" + boardidx + "'" ;
		int result = 0;
		System.out.println(sql);
		
		BoardInfoDTO dto = new BoardInfoDTO();
		
		try(Connection conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery())
		{
			while(rs.next()) {
				
				dto.setBoardidx(rs.getInt("boardidx"));
				dto.setSeason(rs.getString("season"));
				dto.setAge(rs.getString("age"));
				dto.setTitle(rs.getString("title"));
				dto.setText(rs.getString("text"));
				dto.setFile(rs.getString("file"));
				dto.setHashTag(rs.getString("hashTag"));
				dto.setView(rs.getInt("view"));
				dto.setNickname(rs.getString("nickname"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}