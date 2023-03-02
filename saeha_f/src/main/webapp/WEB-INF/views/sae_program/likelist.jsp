<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
      <!-- 최소화된 최신 CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>관람 목록</title>
</head>
<body>
<%@include file="../include/nav.jsp" %>
<div class="page-content">
<div style="width:90%">
<div style="padding:60px 0; height: 100%;">
<div class="container">
<div class="section-heading">
				<h1>
관람목록</h1>

<hr />
</div>

<section id="container">
<form role="form" method="post">
<table class="table table-hover">
<thead>
<tr><th>번호</th><th>제목</th><th>이미지</th><th>수용인원</th><th>프로그램기간</th><th>예약기간</th><th>분류</th><th>예약</th></tr>
</thead>

<c:forEach items="${likelist}" var = "likelist">
<tr>
<td><c:out value="${likelist.pg_bno}"/><a href = "/sae_book/bookview/likelist?lk_id=${likelist.lk_id}"></a></td>
<td><c:out value="${likelist.pg_name}" /></td>
<td><c:out value="${likelist.pg_file}" /></td>
<td><c:out value="${likelist.pg_stock}" /></td>
<td><c:out value="${likelist.pg_startdate}~${likelist.pg_enddate}" /></td>
<td><c:out value="${likelist.pg_bstartdate}~${likelist.pg_benddate}" /></td>
<td><c:out value="${likelist.pg_type}" /></td>
<td><input type="button" value="예약하기" onclick="location.href='/sae_book/bookview?pg_bno=${likelist.pg_bno}'" /></td>


</tr>
</c:forEach>
</table>


<div class="col-md-offset-3">
<ul class="pagination">
<c:if test="${pageMaker.prev}">
<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
</c:if>

<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''} " />>
<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
</c:forEach>

<c:if test="${pageMaker.next && pageMakerendPage > 0}">
<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
</li>
</c:if>

</ul>
</div>
</form>
<div style="float: right;">
<c:if test="${member.userId != null}">
  <button type="button">
    <a href="/sae_book/book">예약하기</a>
  </button>
</c:if>
</div>
</section></div></div></div>
</div>

	<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>