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
	<link rel='stylesheet prefetch' type="text/css" href="bootstrap/css/myPage.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#updateMember").click(function(){
			  var upEmail = $("#upEmail").val();
			  upEmail = $.trim(upEmail);
			  if(upEmail==""){
			   alert("メールアドレスを入力してください");
			   return;
			  }
			  var i = upEmail.indexOf("@");
			  if(i<0){
			   alert("メールアドレスの形式を守ってください");
			   return;
			  }
			  i = upEmail.indexOf(".");
			  if(i<0){
			   alert("メールアドレスの形式を守ってください");
			   return;
			  }
			  var upPwd = $("#upPwd").val();
				upPwd = $.trim(upPwd);
				  if(upPwd==""){
				   alert("パスワードを入力してください");
				   return;
				  }
			  $("#upForm").attr("action", "update.member").submit();
		});
		
		$("#joinVideo").click(function(){
			  var vidAddr = $("#vidAddr").val();
			  vidAddr = $.trim(vidAddr);
			  if(vidAddr==""){
			   alert("動画のアドレスを入力してください。");
			   return;
			  }
			  var vidSub = $("#vidSub").val();
			  vidSub = $.trim(vidSub);
			  if(vidSub==""){
			   alert("動画名を入力してください");
			   return;
			  }
			  var vidContent = $("#vidContent").val();
			  vidContent = $.trim(vidContent);
			  if(vidContent==""){
			   alert("動画の説明を入力してください");
			   return;
			  }
			  $("#joinVidForm").attr("action", "join.video").submit();
			});	
	});
	</script>
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
 	<div class="mail-box">
                  <aside class="sm-side">
                      <div class="user-head">
                          <a class="inbox-avatar" href="javascript:;">
                              <img  width="64" hieght="60" src="https://search.pstatic.net/common?type=o&size=120x150&quality=95&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201705%2F20170507022110537-9337672.jpg">
                          </a>
                          <div class="user-name">
                              <h5><a href="#">${user.getMemName() }</a></h5>
                              <span><a href="#">${user.getMemEmail() }</a></span>
                          </div>
                          <a class="mail-dropdown pull-right" href="javascript:;">
                              <i class="fa fa-chevron-down"></i>
                          </a>
                      </div>
                      <div class="inbox-body">
                          <a href="list.video" title="Compose" class="btn btn-compose">
                              	全ての動画を見る
                          </a>
                      </div>
                      <ul class="inbox-nav inbox-divider">
                          <li>
                              <a href="#"><i class="fa fa-inbox"></i> 会員ID ：　${user.getMemId() }</a>
                          </li>
                          <li>
                              <a href="#"><i class="fa fa-bookmark-o"></i> 会員名　：　${user.getMemName() }</a>
                          </li>
                          <li>
                              <a href="#"><i class="fa fa-envelope-o"></i> 会員 Mail　：　${user.getMemEmail() }</a>
                          </li>
                      </ul>
                  </aside>
                  <aside class="lg-side">
                      <div class="inbox-head">
                          <h3>動画リスト</h3>
                      </div>
                      <div class="inbox-body">
                          <table class="table table-inbox table-hover">
                            <tbody>
                              <c:choose>
                              <c:when test="${empty vlist }">
                              <tr class="unread">
                              	<td class="view-message"><a href="" data-toggle="modal" data-target="#videoJoin" class="btn btn-primary center-block">登録された動画がありません。</a></td>
                              </tr>	
                              </c:when>
                              <c:otherwise>
                              	<c:forEach var="dto" items="${vlist }">
                              <tr class="unread">
                                  <td class="inbox-small-cells">${dto.getVidNo() }　　　</td>
                                  <td class="view-message"><a href="read.video?vidNo=${dto.getVidNo() }">${dto.getVidSub() }　　</a></td>
                                  <td class="view-message text-right">${dto.getVidDate() }　</td>
                              </tr>
                              	</c:forEach>
                              </c:otherwise>
                             </c:choose> 
                          </tbody>
                          </table>
                      </div>
                  </aside>
              </div>
	</div>
	
<!-- line modal for updateMember-->
<div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h3 class="modal-title" id="lineModalLabel">情報変更</h3>
		</div>
		<div class="modal-body">
            <!-- content goes here -->
			<form action="update.member" id="upForm">
			<input type="hidden" value="${user.getMemNo() }" name="memNo">
              <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <input name="memEmail" value="${user.getMemEmail() }" type="email" class="form-control" id="upEmail" placeholder="Enter email">
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input name="memPw" value="${user.getMemPw() }" type="text" class="form-control" id="upPwd" placeholder="Password">
              </div>
              <div class="btn-group btn-group-default" role="group" aria-label="group button">
              <input type="button" class="btn btn-default" id="updateMember" value="Submit">
              <button type="button" class="btn btn-default" data-dismiss="modal"  role="button">Close</button>
              </div>
              </div>
            </form>
		</div>
	</div>
</div>
<!-- line modal for VideoJoin-->
<div class="modal fade" id="videoJoin" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h3 class="modal-title" id="lineModalLabel">情報変更</h3>
		</div>
		<div class="modal-body">
            <!-- content goes here -->
			<form action="join.video" id="joinVidForm">
			<input type="hidden" value="${user.getMemNo() }" name="memNo">
              <div class="form-group">
                <label for="exampleInputEmail1">動画の住所</label>
                <input name="vidAddr" type="text" class="form-control" id="vidAddr" >
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">動画の名</label>
                <input name="vidSub" type="text" class="form-control" id="vidSub" >
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">動画の名</label>
                <textarea class="form-control" rows="5" cols="4" id="vidContent" name="vidContent"></textarea>
              </div>
              <div class="btn-group btn-group-default" role="group" aria-label="group button">
              <input type="button" class="btn btn-default" id="joinVideo" value="Submit">
              <button type="button" class="btn btn-default" data-dismiss="modal" role="button">Close</button>
              </div>
              </div>
            </form>
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
	
	<script src="bootstrap/js/bootstrap.js"></script>
	</body>
</html>