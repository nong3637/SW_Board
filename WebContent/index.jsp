<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.test.board.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>커뮤니티 사이트33</title>
	<link rel="stylesheet" href="style.css" type="text/css">
	<script type="text/javascript">
		function view(idx){
			document.viewForm.idx.value = idx;
			document.viewForm.action = "viewContent.jsp";
			document.viewForm.submit();
		}
	</script>
</head>
<body>
<%
BoardDAO dao = BoardDAO.getInstance();
int cnt = dao.getBoardCount();
ArrayList<BoardVO> volist = dao.getBoardList();
%>
	<header>
		<h3>커뮤니티 사이트</h3>
	</header>
	<nav>
	
	</nav>
	<section>
		<h4>총 <%=cnt %>개의 게시물이 있습니다.</h4>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<%for(BoardVO e : volist) { %>
			<tr>
				<td><%=e.getIdx() %></td>
				<td><%=e.getWriter() %></td>
				<td class="subject"><a href="javascript:view(<%=e.getIdx()%>)"><%=e.getSubject() %></a></td>
				<td><%=e.getWdate() %></td>
			</tr>
			<%} %>
		</table>
		<input type="button" value="작성" onclick="location.href='writeContent.jsp'">
	</section>
	<footer>
		<h4>Copyright &copy; 2018 정보처리산업기가 All Right Reserved</h4>
	</footer>
	<form name="viewForm" method="get">
		<input type="hidden" name="idx">
	</form>
</body>
</html>