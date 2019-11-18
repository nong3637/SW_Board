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
int idx = Integer.parseInt(request.getParameter("idx"));
int rs = dao.deleteBoard(idx);
if (rs==1) {
%>
	<script type="text/javascript">
		alert("삭제완료!");
		location.href="index.jsp";
	</script>
<%}%>
</body>
</html>