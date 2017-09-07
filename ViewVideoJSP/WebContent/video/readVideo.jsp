<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width" ,initial-scale="1">
	<title>E-learning</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css"><!-- 외부적으로 만들어진 css파일의 디자인을 사용하겠다고 선언하는 코드  -->
	<link rel="stylesheet" type="text/css" href="bootstrap/css/codingBooster.css">
	<link rel='stylesheet prefetch' type="text/css"  href="bootstrap/css/myPage.css">
<script type="text/javascript">
	$(function(){
		loadReplyList();
		
		$("#btnjoin").click(function(){
		 var memNo = $("#reMemNo").val();
		 var vidNo = $("#reVidNo").val();
		 var writer = $("#reWriter").val();
		 var content = $("#reContent").val();
		 $.ajax({
			type: "post",
			url: "./join.reply",
			data: {
				memNo: memNo,
				vidNo: vidNo,
				writer: writer,
				content: content
			},
			success: function(result){
				if(result==1){
					autoClosingAlert('#successMessage', 2000);
					$("#replyList").empty();
					loadReplyList();
				}else if(result==0){
					autoClosingAlert('#dangerMessage', 2000);
				}else{
					autoClosingAlert('#warningMessage', 2000);
				}
				$("#reContent").val('');
			}
		 });	 
	});
		
	function autoClosingAlert(selector, delay){//메시지 등록 함수의 결과를 표시해주는 함수
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function(){alert.hide()}, delay);
	}
	//replyを自動的に表示する
	function loadReplyList(){
	
		var vidNo=$("#reVidNo").val();
		$.ajax({
			type: "post",
			url: "./list.reply",
			data:{
				vidNo: vidNo
			},
			success: function(data){
				if(data == "") return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for(var i=0; i<result.length; i++){
					addRe(result[i][0].value, result[i][1].value, result[i][2].value, result[i][3].value);
				}
			}
		});

	}
	
	function addRe(reNo, writer, content, reDate){
		$("#replyList").append(
				'<div class="row">'+
				'<div>'+reNo+'</div>'+
				'<div>'+writer+'</div>'+
				'<div>'+content+'</div>'+
				'<div>'+reDate+'</div>'+
				'</div>'
		);
	}
});
</script>
</head>
	<body>
	<style>
		body {
  	background-color: #222;
  	color: #ccc;
		}
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
							aria-haspopup="true" aria-expanded="false">LOGIN & LOGOUT<span class="caret"></span></a>
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
			<ul class="list-group">
				<a href="#" class="list-group-item active">${dto.getVidSub() }</a>
			</ul>
		</div>
		<div class="row">
			<div class="embed-responsive embed-responsive-16by9">
				<iframe class="embed-responsive-item" src="${dto.getVidAddr() }"></iframe>
			</div>
		</div>
	</div>
	<div class="container">
			<hr>
				<div class="form-group">
						<label> <h3>動画の説明</h3> </label>
						<textarea readonly="readonly" class="form-control" rows="5" id="commentContent" name="vidContent">${dto.getVidContent() }</textarea>
						<br>
						<div class="btn-group btn-group-default" role="group" >
              				<button type="button" class="btn btn-default" role="button" onclick="location.href='list.video'">戻る</button>
              			<c:if test="${dto.getMemNo() == user.getMemNo() }">
              				<button type="button" class="btn btn-default" role="button" onclick="location.href='delete.video?memNo=${user.getMemNo()}&vidNo=${dto.getVidNo() }'">削除</button>
              			</c:if>
              			</div>
				</div>
			<hr>
	</div>
  	<div class="container">
			<hr>
				<div class="form-group">
						<input type="hidden" name="memNo" id="reMemNo" value="${user.getMemNo() }">
						<input type="hidden" name="vidNo" id="reVidNo" value="${dto.getVidNo() }">
						
						<label> <h3>Reply登録</h3> </label>
						<input id="reWriter" name="writer" type="text" value="${user.getMemName() }">
						<br>
						<textarea class="form-control" rows="5" id="reContent" name="content"></textarea>
						<br>
						<div class="btn-group btn-group-default" role="group" >
              			<button type="button" id="btnjoin" class="btn btn-default" role="button" >登録</button>
              			<c:if test="${dto.getMemNo() == user.getMemNo() }">
              			<button type="button" class="btn btn-default" role="button" onclick="">削除</button>
              			</c:if>
              			</div>
              			<div class="btn-group btn-group-default" role="group" >
              			<button type="button" class="btn btn-default" role="button" id="seeReply">Replyを見る</button>
						</div>
				</div>
			<hr>
			<div id="replyList">
	
			</div>
	</div>
	
	<div class="alert alert-success" id="successMessage" style="display: none;">
			<strong>메시지 전송에 성공하였습니다</strong>
		</div>
		<div class="alert alert-danger" id="dangerMessage" style="display: none;">
			<strong>이름과 내용을 모두 입력해주세요</strong>
		</div>
		<div class="alert alert-warning" id="warningMessage" style="display: none;">
			<strong>데이터베이스 오류가 발생했습니다</strong>
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
	<script src="bootstrap/js/bootstrap.js"></script>
	</body>
</html>