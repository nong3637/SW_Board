<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.board.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 수정</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
BoardDAO dao = BoardDAO.getInstance();
int idx = Integer.parseInt(request.getParameter("idx"));
String writer = request.getParameter("writer");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
BoardVO vo = new BoardVO();
vo.setIdx(idx);
vo.setWriter(writer);
vo.setSubject(subject);
vo.setContent(content);
int rs = dao.updateBoard(vo);
if(rs==1) {
%>
	<script type="text/javascript">
		alert("수정완료!");
	</script>
<%
	response.sendRedirect("viewContent.jsp?idx=" + idx);
}
%>
</body>
</html>