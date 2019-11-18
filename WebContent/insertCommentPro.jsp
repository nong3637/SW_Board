<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.board.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 조회</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
BoardDAO dao = BoardDAO.getInstance();
int bidx = Integer.parseInt(request.getParameter("bidx"));
String writer = request.getParameter("writer");
String content = request.getParameter("content");
CommentVO vo = new CommentVO();
vo.setBidx(bidx);
vo.setWriter(writer);
vo.setContent(content);
int rs = dao.insertComment(vo);
if(rs==1) {
	response.sendRedirect("viewContent.jsp?idx=" + bidx);
}%>
</body>
</html>