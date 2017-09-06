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
</head>
	<body>
	<style type="text/css">
						body {
			    padding-top: 90px;
			}
			.panel-login {
				border-color: #ccc;
				-webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
				-moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
				box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
			}
			.panel-login>.panel-heading {
				color: #00415d;
				background-color: #fff;
				border-color: #fff;
				text-align:center;
			}
			.panel-login>.panel-heading a{
				text-decoration: none;
				color: #666;
				font-weight: bold;
				font-size: 15px;
				-webkit-transition: all 0.1s linear;
				-moz-transition: all 0.1s linear;
				transition: all 0.1s linear;
			}
			.panel-login>.panel-heading a.active{
				color: #029f5b;
				font-size: 18px;
			}
			.panel-login>.panel-heading hr{
				margin-top: 10px;
				margin-bottom: 0px;
				clear: both;
				border: 0;
				height: 1px;
				background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
				background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
				background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
				background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
			}
			.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
				height: 45px;
				border: 1px solid #ddd;
				font-size: 16px;
				-webkit-transition: all 0.1s linear;
				-moz-transition: all 0.1s linear;
				transition: all 0.1s linear;
			}
			.panel-login input:hover,
			.panel-login input:focus {
				outline:none;
				-webkit-box-shadow: none;
				-moz-box-shadow: none;
				box-shadow: none;
				border-color: #ccc;
			}
			.btn-login {
				background-color: #59B2E0;
				outline: none;
				color: #fff;
				font-size: 14px;
				height: auto;
				font-weight: normal;
				padding: 14px 0;
				text-transform: uppercase;
				border-color: #59B2E6;
			}
			.btn-login:hover,
			.btn-login:focus {
				color: #fff;
				background-color: #53A3CD;
				border-color: #53A3CD;
			}
			.forgot-password {
				text-decoration: underline;
				color: #888;
			}
			.forgot-password:hover,
			.forgot-password:focus {
				text-decoration: underline;
				color: #666;
			}

			.btn-register {
				background-color: #1CB94E;
				outline: none;
				color: #fff;
				font-size: 14px;
				height: auto;
				font-weight: normal;
				padding: 14px 0;
				text-transform: uppercase;
				border-color: #1CB94A;
			}
			.btn-register:hover,
			.btn-register:focus {
				color: #fff;
				background-color: #1CA347;
				border-color: #1CA347;
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
				<a class="navbar-brand" href="#">E-ランニング</a>
			</div>
			<div class="collapsed nabvar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
				<a href="list.video" title="Compose" class="btn btn-compose">全ての動画を見る</a>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">LOGIN</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">JOIN</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="login.member" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="memId" id="memId" tabindex="1" class="form-control" placeholder="ID" value="">
									</div>
									<div class="form-group">
										<input type="password" name="memPw" id="memPw" tabindex="2" class="form-control" placeholder="PW">
									</div>
									<div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
										<label for="remember"> ID を記憶する</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="https://phpoll.com/recover" tabindex="5" class="forgot-password">秘密番号を忘れましたか?</a>
												</div>
											</div>
										</div>
									</div>
								</form>
								<!-- ここからJOIN-->
								<form id="register-form" action="join.member" method="post" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="memId" id="memId" tabindex="1" class="form-control" placeholder="ID" value="">
									</div>
									<div class="form-group">
										<input type="password" name="memPw" id="memPw" tabindex="1" class="form-control" placeholder="PWD" value="">
									</div>
									<div class="form-group">
										<input type="text" name="memName" id="memName" tabindex="2" class="form-control" placeholder="氏名">
									</div>
									<div class="form-group">
										<input type="email" name="memEmail" id="memEmail" tabindex="1" class="form-control" placeholder="メール アドレス" value="">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="会員登録する">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
	<script type="text/javascript">
		$(function() {
    $('#login-form-link').click(function(e) {
		$("#login-form").delay(100).fadeIn(100);
 		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#login-form").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});

});
	</script>
</html>