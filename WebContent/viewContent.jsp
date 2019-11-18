<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.board.*"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 조회</title>
	<link rel="stylesheet" href="style.css" type="text/css">
	<style type="text/css">
		section table {
			margin: 0px;
			width: 500px;
		}
		section td, th {
			text-align: left;
		}
	</style>
	<script type="text/javascript">
		function deleteComment(idx, bidx) {
			document.idx_bidx.idx.value = idx;
			document.idx_bidx.bidx.value = bidx;
			document.idx_bidx.action = "deleteCommentPro.jsp";
			document.idx_bidx.submit();
		}
		function updateContent(idx) {
			document.idx.idx.value = idx;
			document.idx.action = "updateContent.jsp";
			document.idx.submit();
		}
		function deleteContent(idx) {
			document.idx.idx.value = idx;
			document.idx.action = "deleteContentPro.jsp";
			document.idx.submit();
		}
		function check() {
			if(insertComment.writer.value=="") {
				alert("작성자가 입력되지 않았습니다!");
				insertComment.writer.focus();
				return false;
			} else if(insertComment.content.value=="") {
				alert("내용이 입력되지 않았습니다!");
				insertComment.content.focus();
				return false;
			} else
				return true;
		}
	</script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
int idx = Integer.parseInt(request.getParameter("idx"));
BoardDAO dao = BoardDAO.getInstance();
BoardVO content = dao.getBoardContent(idx);
ArrayList<CommentVO> commentList = dao.getComment(idx);
%>
	<header>
		<h3>커뮤니티 사이트</h3>
	</header>
	<nav>
		
	</nav>
	<section>
		<div>
			<h2>게시물 조회</h2>
			<table>
				<tr>
					<td colspan="2">
						제목 : <%=content.getSubject() %>
					</td>
				</tr>
				<tr>
					<td>작성자 : <%=content.getWriter() %></td>
					<td>작성일 : <%=content.getWdate() %></td>
				</tr>
				<tr>
					<td colspan="2">
						<%=content.getContent() %>
					</td>
				</tr>
			</table>
		</div>
		<div>
			<p>댓글 조회</p>
			<%for(CommentVO e : commentList) { %>
			<%=e.getWriter() %> / <%=e.getContent() %> / <%=e.getWdate() %> / <a href="javascript:deleteComment(<%=e.getIdx()%>, <%=e.getBidx()%>)">삭제</a><br/>
			<%} %>
		</div>
		<div>
			<p>댓글 작성</p>
			<form action="insertCommentPro.jsp" method="post" onsubmit="return check()" name="insertComment">
				이름 : <input type="text" name="writer"><br/>
				내용 : <input type="text" name="content">
				<input type="submit" value="작성완료">
				<input type="hidden" name="bidx" value="<%=idx %>">
			</form>
		</div>
		<div>
			<input type="button" value="목록" onclick="location.href='index.jsp'">&nbsp;
			<input type="button" value="수정" onclick="javascript:updateContent(<%=idx %>)">&nbsp;
			<input type="button" value="삭제" onclick="javascript:deleteContent(<%=idx %>)">
		</div>
	</section>
	<footer>
		<h4>Copyright &copy; 2018 정보처리산업기가 All Right Reserved</h4>
	</footer>
	<form name="idx_bidx" method="get">
		<input type="hidden" name="idx">
		<input type="hidden" name="bidx">
	</form>
	<form name="idx" method="get">
		<input type="hidden" name="idx">
	</form>
</body>
</html>