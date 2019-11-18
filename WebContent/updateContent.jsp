<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.board.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 수정</title>
	<link rel="stylesheet" href="style.css" type="text/css">
	<script type="text/javascript">
		function check() {
			if(writeContent.writer.value=="") {
				alert("작성자가 입력되지 않았습니다.");
				writeContent.writer.focus();
				return false;
			} else if(writeContent.subject.value=="") {
				alert("제목이 입력되지 않았습니다.");
				writeContent.subject.focus();
				return false;
			} else if(writeContent.content.value=="") {
				alert("내용이 입력되지 않았습니다.");
				writeContent.content.focus();
				return false;
			} else
				return true;
		}
	</script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
BoardDAO dao = BoardDAO.getInstance();
int idx = Integer.parseInt(request.getParameter("idx"));
BoardVO vo = dao.getBoardContent(idx);
%>
	<header>
		<h3>커뮤니티 사이트</h3>
	</header>
	<nav>
		
	</nav>
	<section>
		<h2>게시물 수정</h2>
		<form action="updateContentPro.jsp" method="post" onsubmit="return check()" name="writeContent">
			<table border="1">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" value="<%=vo.getWriter()%>"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" value="<%=vo.getSubject()%>"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="50" style="resize: none" name="content"><%=vo.getSubject()%></textarea>
					</td>
				</tr>
			</table>
			<input type="button" value="목록" onclick="location.href='index.jsp'">&nbsp;
			<input type="submit" value="완료">
			<input type="hidden" name="idx" value="<%=vo.getIdx() %>">
		</form>
	</section>
	<footer>
		<h4>Copyright &copy; 2018 정보처리산업기가 All Right Reserved</h4>
	</footer>
</body>
</html>