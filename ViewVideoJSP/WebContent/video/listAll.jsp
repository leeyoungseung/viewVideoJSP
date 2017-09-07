<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width" ,initial-scale="1">
	<title>E-learning</title>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css"><!-- 외부적으로 만들어진 css파일의 디자인을 사용하겠다고 선언하는 코드  -->
	<link rel="stylesheet" type="text/css" href="bootstrap/css/codingBooster.css">
	<link rel='stylesheet prefetch' type="text/css"  href="../bootstrap/css/myPage.css">
</head>
	<body>
	<style>
		body {
  	background-color: #222;
  	color: #ccc;
		}
	/* remove defaults from responsive cols */

	.nopadding {
 	 padding: 2px !important;
 	 margin: 0 !important;
 	 outline: 2px solid #333;
 	 background: #333;
	}
	</style>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
				 data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<c:choose>
				<c:when test="${empty user }">
				<a class="navbar-brand" href="login.jsp">E-ランニング</a>
				</c:when>
				<c:otherwise>
				<a class="navbar-brand" href="myPage.member?memNo=${user.getMemNo() }">E-ランニング</a>
				</c:otherwise>
				</c:choose>
			</div>
			<div class="collapsed nabvar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><button data-toggle="modal" data-target="#squarespaceModal" class="btn btn-primary center-block">個人情報修正</button><span class="sr-only"></span></li>
				</ul>
				<ul class="nav navbar-nav">
					<li><button data-toggle="modal" data-target="#videoJoin" class="btn btn-primary center-block">新たな動画登録</button><span class="sr-only"></span></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">LOGOUT<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logout.member">Logout</a></li>
						</ul>
					</li>
				</ul>
		</div>
	</div>
</nav>
<div class="container">
    <div class="row">
    <c:choose>
    <c:when test="${empty allList }">
    <div class="col-sm-3 nopadding">
    	<h1>登録された動画がありません</h1>
    </div>
    </div>
    </c:when>
    <c:otherwise>
    <c:forEach var="aDto" items="${allList }" varStatus="su">   
      <div class="col-sm-3 nopadding">
      	<a href="read.video?vidNo=${aDto.getVidNo() }"><h3 style="color: white;">${aDto.getVidSub() }</h3></a>
        <div class="embed-responsive embed-responsive-16by9">
          <iframe width="560" height="315" src="${aDto.getVidAddr() }" allowfullscreen></iframe>
        </div>
      </div>
      <c:if test="${su.count/4==0 }">
      </div>
      <div class="row">
      </c:if>
	</c:forEach>
	</c:otherwise>
	</c:choose>
    </div>

<footer style="background-color: #000000; color: #ffffff">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-2" style="text-align: center;"><h5>Copyright &copy; 2017</h5><h5>E-net株式会社　技術部　：　David</h5></div>
				<div class="col-sm-4"><h4>代表</h4><p>受田</p></div>
				<div class="col-sm-2"><h4 style="text-align: center;">詳細</h4>
					<div class="list-group">
						<a href="#" class="list-group-item">会社紹介</a>
						<a href="#" class="list-group-item">部署</a>
						<a href="#" class="list-group-item">連絡先</a>
					</div>
				</div>
				<div class="col-sm-2"><h4 style="text-align: center;">SNS</h4>
					<div class="list-group">
						<a href="#" class="list-group-item">Facebook</a>
						<a href="#" class="list-group-item">YouTube</a>
						<a href="http://blog.naver.com/rudnfskf2" class="list-group-item">Naver Blog</a>
					</div>
				</div>
				<div class="col-sm-2"><h4 style="text-align: center;"><span class="glyphicon glyphicon-ok"></span>&nbsp;by E-net株式会社　技術部　：　David</h4></div>
			</div>
		</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.js"></script>
	</body>
</html>