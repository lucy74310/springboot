<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/guestbook.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
#guestbook-timeline { margin: 15px 0 0 15px; position:relative; }
#guestbook-timeline .title { margin-bottom: 15px; }
#guestbook-timeline .title img {
	width:30px; 
	height:30px;
	vertical-align: bottom;
}

#guestbook-timeline #input-name, #guestbook-timeline #input-password, #guestbook-timeline #tx-content {
	display: block;
	width: 533px;
	border: 1px solid #CFCFCF;
	margin-bottom: 10px;
	padding-left : 5px;
}

#input-name, #input-password{
	height: 30px;
	line-height: 30px;
}
#tx-send-btn{
	width: 540px;
	height:35px;
	border: 1px solid #E4E4E4;

	background-color: #E4E4E4;
	
}
#guestbook-timeline #tx-content{ height: 100px; padding-top:5px; }

#guestbook-timeline ul#list {
	width: 540px;
	border-top: 1px solid #999;
	margin: 30px 0 40px 0 ;
}

#guestbook-timeline ul#list li {	
	position: relative;
	margin: 25px 0;
	background: url('${pageContext.request.contextPath }/assets/images/user.png') no-repeat 0 15px;
	z-index:5;
}

#guestbook-timeline ul#list li p, #guestbook-timeline ul#list li strong.userid  {
	margin-left: 45px;
}
#guestbook-timeline ul#list li p{ font-size:12px;}
#guestbook-timeline ul#list li strong.userid { color:#969696; font-size:14px;}
#guestbook-timeline ul#list li strong.del {
	position:absolute;
	top: 40px;
	left: 17px;
	width: 20px;
	height: 20px;
	background: url('${pageContext.request.contextPath }/assets/images/delete.png') no-repeat;
	z-index: 10;
}


#guestbook-timeline ul#list li p {
	margin-top: 5px;
	padding: 10px;
	background-color: #E0F0FF;
	border-radius: 5px;
	border: 1px solid #E3E3E3;
}

</style>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="content">
			<div id="guestbook-timeline">
				<h1 class="title">
					<img src="${pageContext.request.contextPath }/assets/images/guestbook.png">방명록</h1>
				<form id="add-form" action="javascript:sendmessage()" method="post">
					<input type="text" id="input-name" placeholder="이름">
					<input type="password" id="input-password" placeholder="비밀번호">
					<textarea id="tx-content" placeholder="내용을 입력해 주세요."></textarea>
					<input id="tx-send-btn" type="submit" value="보내기" />
				</form>
				
				<ul id="list">
					<c:forEach items='${list}' var='vo'>
						<li data-no=vo.no>
							<strong class="userid">${vo.name}</strong>
							<p>
								${fn:replace(vo.message, newline,"<br>") }
							</p>
							<strong class='del'></strong>
						</li>
					</c:forEach>	
						<li data-no=''>
							<strong class="userid">둘리</strong>
							<p>
								안녕하세요<br>
								홈페이지가 개 굿 입니다.
							</p>
							<strong class='del'></strong>
							
						</li>
					

					<li data-no=''>
						<strong class="userid">주인</strong>
						<p>
							아작스 방명록 입니다.<br>
							테스트~
							아작스 방명록 입니다.<br>
							테스트~
							아작스 방명록 입니다.<br>
							테스트~
							아작스 방명록 입니다.<br>
							테스트~
							아작스 방명록 입니다.<br>
							테스트~
							아작스 방명록 입니다.<br>
							테스트~
						</p>
						<strong class='del'></strong>
					</li>
					
									
				</ul>
			</div>
			<div id="dialog-delete-form" title="메세지 삭제" style="display:none">
  				<p class="validateTips normal">작성시 입력했던 비밀번호를 입력하세요.</p>
  				<p class="validateTips error" style="display:none">비밀번호가 틀립니다.</p>
  				<form>
 					<input type="password" id="password-delete" value="" class="text ui-widget-content ui-corner-all">
					<input type="hidden" id="hidden-no" value="">
					<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
  				</form>
			</div>
			<div id="dialog-message" title="" style="display:none">
  				<p></p>
			</div>						
		</div>
		<c:import url="/WEB-INF/views/includes/navigation.jsp">
			<c:param name="menu" value="guestbook-timeline"/>
		</c:import>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
	
<script>

$(function(){
	console.log('load');
	
})
function sendmessage() {
	console.log($('#add-form'));
	add = $('#add-form').serialize();
	console.log(add);
	$.ajax({
		url: "${pageContext.request.contextPath}/guestbook/timeline/add", 
		type: "POST",
		dataType: "json",
		data: add,
		success : function(res) {
			console.log(res);
		},
		error : function(xhr, error) {
			console.error("error : " + error);
		}
	});
}
function listrender() {
	
}
</script>
</body>
</html>