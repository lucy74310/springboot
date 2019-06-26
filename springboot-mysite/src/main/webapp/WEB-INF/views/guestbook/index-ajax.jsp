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

#dialog-delete-form {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 270px;
	height: 130px;
	border: 1px solid #999;
	z-index:100;
	background-color: #fff;
}
#dialog-delete-form .title_msg{
	padding: 5px 20px;
	border-bottom: 1px solid #D7D7D7;
	background: url('${pageContext.request.contextPath }/assets/images/delete-imge.png') no-repeat 97% 4px ;
	background-size: 15px;
	background-color: #D7D7D7;
}
#dialog-delete-form .validateTips {
	padding: 10px 20px;
}
#dialog-delete-form {
	text-align: center;
}
#dialog-delete-form .btn {
	padding: 5px 0 0 150px;
	border-top: 1px solid #D7D7D7;	
	
}
#dialog-delete-form .btn input[type=button] {
	border: none;
	background-color:#D7D7D7;
	border-radius: 3px;
	padding: 2px 4px;
}
#password-delete {
	margin-bottom: 10px;
}

.mask {
	position:absolute;
	top:0;
	left:0;
	background-color: #9A9A9A;
	opacity: 0.3;
	z-index:99;
}
</style>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="content">
			<div id="guestbook-timeline">
				<h1 class="title"><img src="${pageContext.request.contextPath }/assets/images/guestbook.png">방명록</h1>
				<form id="add-form" action="" method="post">
					<input type="text" id="input-name" placeholder="이름" name="name">
					<input type="password" id="input-password" placeholder="비밀번호" name="password">
					<textarea id="tx-content" placeholder="내용을 입력해 주세요." name="message"></textarea>
					<input id="tx-send-btn" type="button" value="보내기" onclick="sendmessage()"/>
				</form>
				
				<ul id="list">
					<c:forEach items='${list}' var='vo'>
						<li data-no='${vo.no }'>
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
				<p class="title_msg" onclick="cancel()">메세지삭제</p>
  				<p class="validateTips normal">작성시 입력했던 비밀번호를 입력하세요.</p>
  				<p class="validateTips error" style="display:none">비밀번호가 틀립니다.</p>
  				<form>
 					<input type="password" id="password-delete" value="" class="text ui-widget-content ui-corner-all">
					<input type="hidden" id="hidden-no" value="">
					<div class="btn">
						<input type="button" style="" value="삭제">
						<!-- <input type="button" style="position:absolute; top:-1000px" value="확인"> -->
						<input type="button" onclick="cancel()" value="취소">
					</div>
  				</form>
			</div>
			<div id="dialog-message" title="" style="display:none">
  				<p></p>
			</div>		
			<div class="mask" style="display:none"></div>				
		</div>
		<c:import url="/WEB-INF/views/includes/navigation.jsp">
			<c:param name="menu" value="guestbook-timeline"/>
		</c:import>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
	
<script>

$(function(){
	console.log('load');
	dels = document.getElementsByClassName('del');
	console.log(dels)
	for(i=0; i<dels.length; i++){
		dels[i].addEventListener('click', delmsg);
	}
})
function sendmessage() {
	data = $('#add-form').serialize();
	litags = $('#list').children();
	clonedata = $(litags[0]).clone();
	
	$.ajax({
		url: "${pageContext.request.contextPath}/guestbook/timeline/add", 
		type: "POST",
		dataType: "text",
		data: data,
		success : function(res) {
			if (res == 'ok') {
				clonedata.children('.userid').html($('#input-name').val());
				clonedata.children('p').html($('#tx-content').val());
				$('#list').prepend(clonedata);
			}
		},
		error : function(xhr, error) {
			console.error("error : " + error);
		}
	});
}

function delmsg(event){
	//화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('.mask').css({'width':maskWidth,'height':maskHeight});  
    $('.mask').css("display", "");    
    $('#dialog-delete-form').css("display", "");
}

function cancel() {
	 $('.mask').css("display", "none");    
     $('#dialog-delete-form').css("display", "none");
}

</script>
</body>
</html>