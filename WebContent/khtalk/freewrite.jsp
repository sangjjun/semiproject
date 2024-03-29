<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판_글쓰기</title>
<style type="text/css">
#userId {
	border: none;
}

#navbar, #btn-primary {
	background-color: #142F62;
}

#active, #btn-primary:hover {
	background-color: #385DA1;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {

				$('#cancel').on('click', function() {
					var chk = confirm("글 작성을 취소하시겠습니까?");
					if (chk) {
						$('form').attr('action', 'freelist.do');
						$('form').submit(); //submit 이벤트 강제 발생
					} else
						return false;
				});

				//공백 대소문자 상관없이(i) 여러개(g)를 줄바꿈태그 <br/>로 변경 
				$('form').on(
						'submit',
						function() {
							$('[name=content]').val(
									$('[name=content]').val().replace(/\n/gi,
											'<br/>'));
						});
			});
</script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Dobble Social Network: Group Page</title>

<!-- Bootstrap core CSS -->
<link href="/semiProject//khtalk/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/semiProject//khtalk/css/style.css" rel="stylesheet">
<link href="/semiProject//khtalk/css/font-awesome.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>

	<nav class="navbar navbar-default" id="navbar">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="index" style="color: white">메&nbsp;&nbsp;&nbsp;&nbsp;인</a></li>
					<li><a href="notice.do" style="color: white">공지사항</a></li>
					<li id="active"><a href="freeboard" style="color: white">자유&nbsp;게시판</a></li>
					<li><a href="studyList" style="color: white">스터디</a></li>
					<c:choose>
						<c:when test="${not empty sessionScope.userId}">
							<li><a href="profile" style="color: white">프로필</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="groups">
						<h1 class="page-header">자유게시판</h1>
						<form name="frm" method="post" enctype="multipart/form-data"
							action="freewrite.do">
							<!-- 답변글일 경우 파라미터값 받기 -->
							<c:if test="${!empty param.num}">
								<input type="hidden" name="pageNum" value="${param.pageNum}" />
								<input type="hidden" name="num" value="${param.num}" />
								<input type="hidden" name="ref" value="${param.ref}" />
								<input type="hidden" name="re_step" value="${param.re_step}" />
								<input type="hidden" name="re_level" value="${param.re_level}" />
								<input type="hidden" name="searchKey" value="${param.searchKey}" />
								<input type="hidden" name="searchWord"
									value="${param.searchWord}" />


							</c:if>
							<div class="group-item">
								<table>

									<tr>
										<td width="20%">글쓴이</td>
										<td width="80%"><input type="text" name="userId"
											id="userId" value="${sessionScope.userId}"
											readonly="readonly" /></td>
									</tr>

									<tr>
										<td width="20%">제목</td>
										<td width="80%">
											<!-- 답변글 구분 --> <c:if test="${!empty param.num}">
												<span>[답변]</span>
											</c:if> <input type="text" name="subject" required="required" />
										</td>
									</tr>

									<tr>
										<td width="20%">내용</td>
										<td width="80%"><textarea name="content" rows="15"
												cols="80" required="required"></textarea></td>
									</tr>

									<tr>
										<td width="20%">파일첨부</td>
										<td width="80%" id="fileDiv"><input type="file"
											name="upload" /></td>
									</tr>

								</table>
							</div>
							<input type="submit" value="등록" class="btn btn-default" /> <input
								type="button" value="취소" class="btn btn-default" id="cancel" />
						</form>
					</div>
				</div>
				<div class="col-md-4">
					<jsp:include page="include/Profile.jsp"></jsp:include>
					<div class="panel panel-default groups">
						<c:choose>
							<c:when test="${not empty sessionScope.userId }">
								<jsp:include page="include/userGroupList.jsp"></jsp:include>
							</c:when>
							<c:otherwise>
								<jsp:include page="include/groupList.jsp"></jsp:include>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<div class="container">
			<p>Dobble Copyright &copy, 2015</p>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- 	<script src="/semiProject//khtalk/js/bootstrap.js"></script> -->
	<!-- 	<script src="/semiProject//khtalk/js/ekko-lightbox.js"></script> -->
</body>
</html>