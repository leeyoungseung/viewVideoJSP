<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"><!-- utf-8로 테스트인코딩을 기본으로 하겠다  -->
	<meta name="viewport" content="width=device-width", initial-scale="1">
	<!-- 화면 설정 : initial-scale : 기본화면을 1로 설정, content : 화면크기는 기계화면의 크기와 일치하게 설정  -->
	<title>E-learning</title>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css"><!-- 외부적으로 만들어진 css파일의 디자인을 사용하겠다고 선언하는 코드  -->
	<link rel="stylesheet" type="text/css" href="bootstrap/css/codingBooster.css">
</head>
	<body>
	<nav class="navbar navbar-default"><!-- 네비게이션바의 시작 -->
		<div class="container-fluid"><!-- 네비게이션바의 부트스트랩 컨테이너 -->
			<div class="navbar-header"><!-- 네비게이션바의 header부분 -->
				<!-- (1)네비게이션바의 header버튼 -->
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
				 data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only"></span>
				<span class="icon-bar"></span><!-- 네비게이션바의 header버튼의 줄 수를 늘린다 -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">E-ランニング</a><!-- (2)header부분의 태그 -->
			</div>
			<div class="collapsed nabvar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.html">소개<span class="sr-only"></span></a></li><!-- (3)두 번째 버튼으로 li태그의 active클래스 속성을 사용하여 선택되어져 있듯이 보이게함. -->
				</ul>
				<form class="navbar-form navbar-left"><!-- (6)네비게이션바의 form태그를 사용하여 검색창 생성 -->
					<div class="form-group">
						<input type="text" class="form-control" placeholder="내용을 입력하세요">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form>
				<ul class="nav navbar-nav navbar-right"><!-- (7)dropdown클래스 속성을 이용하여 토글 버튼생성 -->
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="loginForm.html">로그인</a></li>
							<li><a href="logout.member">로그아웃</a></li>
						</ul>
					</li>

				</ul>
			</div>
		</div>
	</nav>	
	<footer style="background-color: #000000; color: #ffffff"><!-- footer를 선언하는 태그  -->
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-2" style="text-align: center;"><h5>Copyright &copy; 2017</h5><h5>David</h5></div>
				<div class="col-sm-4"><h4>대표자 소개</h4><p>저는 트와이스를 프로듀싱한 JYP입니다</p></div>
				<div class="col-sm-2"><h4 style="text-align: center;">내비게이션</h4>
					<div class="list-group">
						<a href="index.html" class="list-group-item">소개</a>
						<a href="instructor.html" class="list-group-item">강사진</a>
						<a href="lecture.html" class="list-group-item">콘서트</a>
					</div>
				</div>
				<div class="col-sm-2"><h4 style="text-align: center;">SNS</h4>
					<div class="list-group">
						<a href="#" class="list-group-item">페이스북</a>
						<a href="#" class="list-group-item">유튜브</a>
						<a href="http://blog.naver.com/rudnfskf2" class="list-group-item">네이버</a>
					</div>
				</div>
				<div class="col-sm-2"><h4 style="text-align: center;"><span class="glyphicon glyphicon-ok"></span>&nbsp;by David</h4></div>
			</div>
		</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script><!-- 부트스트랩의 동적기능을 이용하기 위해선 제이쿼리 플러그인이나 외부소스가 필요하다. 이 코드는 외부에서 제이쿼리 소스를 가져오는 코드이다. -->
	<script src="bootstrap/js/bootstrap.js"></script><!-- 부트스트랩의 동적기능을 활용하기위해 작성한 코드 -->
	</body>
</html>