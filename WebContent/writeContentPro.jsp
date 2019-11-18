<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.board.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 작성</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
BoardDAO dao = BoardDAO.getInstance();
String writer = request.getParameter("writer");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
BoardVO vo = new BoardVO();
vo.setWriter(writer);
vo.setSubject(subject);
vo.setContent(content);
int rs = dao.insertBoard(vo);
if(rs==1) {
%>
	<script type="text/javascript">
		alert("작성이 완료되었습니다!");
		location.href="index.jsp";
	</script>
<%
}
%>
</body>
</html>