package com.test.board;

import java.sql.*;
import java.util.ArrayList;

public class BoardDAO extends DBConnection {
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	private BoardDAO() {}
	
	public int getBoardCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int cnt = 0;
		
		try {
			conn = getConnection();
			sql = "SELECT COUNT(*) FROM BOARD_TBL";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				cnt = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(rs, pstmt, conn);
		}
		
		return cnt;
	}
	
	public ArrayList<BoardVO> getBoardList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<BoardVO> volist = new ArrayList<BoardVO>();
		
		try {
			conn = getConnection();
			sql = "SELECT IDX, WRITER, SUBJECT, CONTENT, TO_CHAR(WDATE, 'YYYY-MM-DD HH24:MI:SS') "
					+ " FROM BOARD_TBL";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setIdx(rs.getInt(1));
				vo.setWriter(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setWdate(rs.getString(5));
				volist.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(rs, pstmt, conn);			
		}
		
		return volist;
	}
	
	public BoardVO getBoardContent(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		BoardVO vo = new BoardVO();
		
		try {
			conn = getConnection();
			sql = "SELECT IDX, WRITER, SUBJECT, CONTENT, TO_CHAR(WDATE, 'YYYY-MM-DD HH24:MI:SS') "
					+ " FROM BOARD_TBL "
					+ " WHERE IDX=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt(1));
				vo.setWriter(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setWdate(rs.getString(5));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(rs, pstmt, conn);
		}
		
		return vo;
	}
	
	public ArrayList<CommentVO> getComment(int bidx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<CommentVO> volist = new ArrayList<CommentVO>();
		
		try {
			conn = getConnection();
			sql = "SELECT IDX, BIDX, WRITER, CONTENT, TO_CHAR(WDATE, 'YYYY-MM-DD HH24:MI:SS') "
					+ " FROM COMMENT_TBL"
					+ " WHERE BIDX=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommentVO vo = new CommentVO();
				vo.setIdx(rs.getInt(1));
				vo.setBidx(rs.getInt(2));
				vo.setWriter(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setWdate(rs.getString(5));
				volist.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(rs, pstmt, conn);
		}
		
		return volist;
	}
	
	public int insertComment(CommentVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		String sql = "";
		
		try {
			conn = getConnection();
			sql = "INSERT INTO COMMENT_TBL VALUES ((SELECT (NVL((MAX(IDX)), 0)+1) FROM COMMENT_TBL), ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBidx());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
			rs = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(pstmt, conn);
		}
		
		return rs;
	}
	
	public int deleteComment(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		String sql = "";
		
		try {
			conn = getConnection();
			sql = "DELETE FROM COMMENT_TBL WHERE IDX=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(pstmt, conn);
		}
		
		return rs;
	}
	
	public int insertBoard(BoardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		String sql = "";
		
		try {
			conn = getConnection();
			sql = "INSERT INTO BOARD_TBL VALUES ((SELECT (NVL(MAX(IDX),0)+1) FROM BOARD_TBL), ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getContent());
			rs = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(pstmt, conn);
		}
		
		return rs;
	}
	
	public int updateBoard(BoardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		String sql = "";
		
		try {
			conn = getConnection();
			sql = "UPDATE BOARD_TBL SET WRITER=?, SUBJECT=?, CONTENT=? WHERE IDX=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getIdx());
			rs = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(pstmt, conn);
		}
		
		return rs;
	}
	
	public int deleteBoard(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		String sql = "";
		
		try {
			conn = getConnection();
			sql = "DELETE FROM BOARD_TBL WHERE IDX=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(pstmt, conn);
		}
		
		return rs;
	}
}












