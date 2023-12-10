<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ include file="DBconn.jsp"%>

<html>
<head>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<title>Board</title>

<%
request.setCharacterEncoding("utf-8");

String smartphone_search = request.getParameter("smartphone_search4");
if (request.getParameter("phone_name") != null) {
	smartphone_search = request.getParameter("phone_name");
}
if (request.getParameter("smartphone_search") != null) {
	smartphone_search = request.getParameter("smartphone_search");
}

String sessionId = (String) session.getAttribute("sessionId");
%>
<script type="text/javascript">
	function checkForm() {	
		if (${sessionId == null}) {
			alert("로그인 해주세요.");
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<div style="width: 77%; height: 110px; float: left;">
			<h1 class="display-3">게시판</h1>
		</div>
		<div align="center"
			style="width: 23%; height: 110px; border: 1px solid gray; float: right;">
			<%
			String loginId = (String) session.getAttribute("sessionId");
			if (loginId != null) {
			%>

			<form action="Login.jsp">
				<h4 style="color: blue;"><%=loginId%></h4>
				<h4>로그인 중</h4>

				<button type="submit">로그아웃</button>
			</form>

			<%
			} else {
			%>
			<form action="Login.jsp">
				<h4>로그인 안됨</h4>
				<button type="submit">로그인</button>
			</form>
			<%
			}
			%>
		</div>
	</div>
	<div class="container">
		<div align="right">
			<div>
				<div class="text-right">
					<%
					PreparedStatement pstmt = null;
					ResultSet rs = null;

					List<Map<String, Object>> reviews = new ArrayList<>();
					try {

						String query = "SELECT * FROM board WHERE smartphone = ? ORDER BY num";
						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, smartphone_search);
						rs = pstmt.executeQuery();

						while (rs.next()) {
							Map<String, Object> review = new HashMap<>();
							review.put("num", rs.getInt("num"));
							review.put("hjp", rs.getString("hjp"));
							review.put("score", rs.getString("score"));
							review.put("id", rs.getString("id"));
							review.put("regist_day", rs.getString("regist_day"));
							reviews.add(review);
						}
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						//... (close resources)
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
					}

					request.setAttribute("reviews", reviews);

					int itemsPerPage = 10;
					int totalReviews = reviews.size();
					int totalPages = (int) Math.ceil((double) totalReviews / itemsPerPage);

					String pageParam = request.getParameter("page");
					int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;

					int startIndex = (currentPage - 1) * itemsPerPage;
					int endIndex = Math.min(startIndex + itemsPerPage, totalReviews);

					List<Map<String, Object>> displayedReviews = reviews.subList(startIndex, endIndex);

					request.setAttribute("currentPage", currentPage);
					request.setAttribute("totalPages", totalPages);
					request.setAttribute("displayedReviews", displayedReviews);
					%>
					<div>
						전체
						<%=totalPages%>건
					</div>
				</div>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th width="30%">
							<table class="table table-hover">
								<tr>
									<th>
										<form action="list.jsp" method="post">
											<select id="smartphone_search" name="smartphone_search">
												<%
												PreparedStatement pstmt3 = null;
												ResultSet rs3 = null;
												String sql3 = "select * from smartphone order by p_id";
												pstmt3 = conn.prepareStatement(sql3);
												rs3 = pstmt3.executeQuery();
												while (rs3.next()) {
												%>
												<option value="<%=rs3.getString("p_name")%>"><%=rs3.getString("p_name")%></option>
												<%
												}
												%>
												<%
												if (rs3 != null)
													rs3.close();
												if (pstmt3 != null)
													pstmt3.close();
												%>
											</select> <input type="hidden" id="smartphone_search1"
												name="smartphone_search1" value="<%=smartphone_search%>" />
											<script>
												var smartphone_search = document
														.getElementById("smartphone_search1").value;
												document
														.getElementById("smartphone_search").value = smartphone_search;
											</script>
											<button type="submit">검색</button>
										</form>
									</th>
								</tr>
								<tr style="height: 400px">
									<td colspan="2">
										<%
										try {
											String query = "SELECT * FROM smartphone where p_name = ?";
											pstmt = conn.prepareStatement(query);
											pstmt.setString(1, smartphone_search);
											rs = pstmt.executeQuery();
											while (rs.next()) {
										%> <img alt="smartphone"
										src="./upload/<%=rs.getString("P_FILENAME")%>"
										style="height: 400px;"> <%
 }
 rs.close();
 pstmt.close();
 } catch (SQLException e) {
 e.printStackTrace();
 }
 %>
 
									</td>
								</tr>
							</table>
						</th>
						<th>
							<div align="center">
								<table class="table table-hover">
									<tr>
										<th>번호</th>
										<th>한 줄 평</th>
										<th>별점</th>
										<th>작성자</th>
										<th>작성일자</th>
									</tr>

									<c:forEach var="review" items="${displayedReviews}">
									
									
									
									
									
									
									
<!-- 										<form action="processHJP_UpdateOrDelete.jsp" method="post"> -->
											<tr>
												<td><c:out value="${review.num}" /></td>
												<td><c:out value="${review.hjp}" /></td>
												<td><c:out value="${review.score}" /></td>
												<td><c:out value="${review.id}" /></td>
												<td><c:out value="${review.regist_day}" /></td>

												<c:choose>
													<c:when test="${review.id eq sessionId}">


														<input type="hidden" id="smartphone_search4"
															name="smartphone_search4" value="<%=smartphone_search%>" />


														<td><button name="update_hjp">수정</button></td>
														<td><button name="delete_hjp">삭제</button></td>



													</c:when>
													<c:otherwise>
														<td></td>
														<td></td>
													</c:otherwise>
												</c:choose>
											</tr>
<!-- 										</form> -->













									</c:forEach>

									<tr>
										<td colspan="5">
											<div align="center">
												<c:forEach begin="1" end="${totalPages}" var="pageNum">
													<c:url value="list.jsp" var="pageUrl">
														<c:param name="page" value="${pageNum}" />

														<c:param name="smartphone_search4"
															value="<%=smartphone_search%>" />
													</c:url>
													<a href="${pageUrl}"
														class="${(pageNum == currentPage) ? 'active' : ''}">${pageNum}</a>
												</c:forEach>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<div align="right">
								<table>
									<tr>
										<td>
											<form id="Write_HJP" action="Write_HJP.jsp" method="post">
												<div style="float: left; padding: 5px;">
													<button class="w-100 btn btn-secondary" type="submit"
														id="goWrite_HJP" onclick="checkForm()">글쓰기</button>


													<input type="hidden" id="smartphone_search2"
														name="smartphone_search2" value="<%=smartphone_search%>" />
												</div>
												<div style="float: left; padding: 5px;">
													<button class="w-100 btn btn-secondary" type="button"
														id="redirectButton">비교</button>
													<script>
								document.getElementById("redirectButton").addEventListener("click", function() {
											location.href = "Compare.jsp";								
					
										});
							</script>
												</div>
											</form>
										</td>
									</tr>
								</table>
							</div>
						</th>
					</tr>
				</table>
			</div>
		</div>
		<hr>
	</div>
</body>
</html>