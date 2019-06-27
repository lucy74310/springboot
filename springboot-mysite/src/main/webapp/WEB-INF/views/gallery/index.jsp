<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page contentType="text/html;charset=UTF-8" %>
<%pageContext.setAttribute( "newLine", "\n" );%>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath }/assets/css/gallery.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/lightbox.css" rel="stylesheet" type="text/css">
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/lightbox.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>

#gallery .gallery-title {
	position: relative;
	margin: 30px 0;
}
.wrapdiv {
	margin-bottom:20px;
	overflow:hidden;
}
#gallery  h1 {
	display:block;
	width: 300px;
	text-align: left;
	float:left;
	margin-bottom:20px;
	padding-left:45px;
	background: url('${pageContext.request.contextPath }/assets/images/gallery.png') no-repeat 0 0 ;
	background-size:40px;
	
}
#gallery #upload-image {
	display:block;
	width: 90px;
	height:30px;
	line-height:30px;
	float:right;
	text-align:center;
	border: 1px solid #2080D0;
	background-color:#EFEFFF;
	text-decoration:none;
	color: #000;
	border-radius:2px;
}
#gallery ul {
	clear:both;
	margin:20px 0;
}
#gallery ul li {
	position:relative;
	float:left;
	overflow-y:hidden;
	width:114px;
	height: 114px;
	padding:1px;
	margin:4px;
	border-radius:1px;
	border:2px solid #CFCFCF;
}
#gallery ul li a.image {
	display:block;
	width:114px;
	height:114px;
	background-size: 114px;
	background-repeat: no-repeat;
	background-position: center center;
	text-decoration:none;
	color: transparent;
}

#gallery ul li:hover{
	border: 2px solid #f00;
	border-radius:3px;
}

#gallery ul li:hover a.del-button {
	position:absolute;
	right:2px;
	top:2px;
	display:block;
	background-image: url('${pageContext.request.contextPath }/assets/images/delete-imge.png');
	background-repeat:no-repeat;
	background-position: center center;
	background-size: 15px;
	color: transparent;
	height:20px;
	width:20px;
	font-size:0;
}

#gallery ul li a.del-button{
	display:none;
}
</style>
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="content">
			<div class="wrapdiv">
				<div id="gallery">
					<div class="gallery-title">
						<h1>갤러리</h1>
						<a href="" id="upload-image">이미지 올리기</a>
					</div>
					<ul>
							<li>
								<a	href="${pageContext.request.contextPath }/assets/gallery-examples/im1.jpg"
									data-lightbox="gallery"
									class="image"
									style="background-image:url('${pageContext.request.contextPath }/assets/gallery-examples/im1.jpg')"></a>
									
								<a	href="${pageContext.request.contextPath }/gallery/delete/1"
									class="del-button"
									title="삭제"></a>
							</li>
							
							
							<li>
								<a	href="${pageContext.request.contextPath }/assets/gallery-examples/im2.jpg'"
									data-lightbox="gallery"
									class="image"
									style="background-image:url('${pageContext.request.contextPath }/assets/gallery-examples/im2.jpg')"></a>
									
								<a	href="${pageContext.request.contextPath }/gallery/delete/2"
									class="del-button"
									title="삭제">삭제</a>
							</li>
							
							<li>
								<a	href="${pageContext.request.contextPath }/assets/gallery-examples/im3.jpg"
									data-lightbox="gallery"
									class="image"
									style="background-image:url('${pageContext.request.contextPath }/assets/gallery-examples/im3.jpg')">&nbsp;</a>
									
								<a	href="${pageContext.request.contextPath }/gallery/delete/3"
									class="del-button"
									title="삭제">삭제</a>
							</li>
							
							<li>
								<a	href="${pageContext.request.contextPath }/assets/gallery-examples/im4.jpg"
									data-lightbox="gallery"
									class="image"
									style="background-image:url('${pageContext.request.contextPath }/assets/gallery-examples/im4.jpg')">&nbsp;</a>
									
								<a	href="${pageContext.request.contextPath }/gallery/delete/4"
									class="del-button"
									title="삭제">삭제</a>
							</li>
							
		
							<li>
								<a	href="${pageContext.request.contextPath }/assets/gallery-examples/im5.jpg"
									data-lightbox="gallery"
									class="image"
									style="background-image:url('${pageContext.request.contextPath }/assets/gallery-examples/im5.jpg')">&nbsp;</a>
									
								<a	href="${pageContext.request.contextPath }/gallery/delete/5"
									class="del-button"
									title="삭제">삭제</a>
							</li>
							
							<li>
								<a	href="${pageContext.request.contextPath }/assets/gallery-examples/im6.jpg"
									data-lightbox="gallery"
									class="image"
									style="background-image:url('${pageContext.request.contextPath }/assets/gallery-examples/im6.jpg')">&nbsp;</a>
									
								<a	href="${pageContext.request.contextPath }/gallery/delete/6"
									class="del-button"
									title="삭제">삭제</a>
							</li>
							
							<li>
								<a	href="${pageContext.request.contextPath }/assets/gallery-examples/im7.jpg"
									data-lightbox="gallery"
									class="image"
									style="background-image:url('${pageContext.request.contextPath }/assets/gallery-examples/im7.jpg')">&nbsp;</a>
									
								<a	href="${pageContext.request.contextPath }/gallery/delete/7"
									class="del-button"
									title="삭제">삭제</a>
							</li>
							
							<li>
								<a	href="${pageContext.request.contextPath }/assets/gallery-examples/im8.jpg"
									data-lightbox="gallery"
									class="image"
									style="background-image:url('${pageContext.request.contextPath }/assets/gallery-examples/im8.jpg')">&nbsp;</a>
									
								<a	href="${pageContext.request.contextPath }/gallery/delete/8"
									class="del-button"
									title="삭제">삭제</a>
							</li>
							
							<li>
								<a	href="${pageContext.request.contextPath }/assets/gallery-examples/im9.jpg"
									data-lightbox="gallery"
									class="image"
									style="background-image:url('${pageContext.request.contextPath }/assets/gallery-examples/im9.jpg')">&nbsp;</a>
									
								<a	href="${pageContext.request.contextPath }/gallery/delete/9"
									class="del-button"
									title="삭제">삭제</a>
							</li>
							
							<li>
								<a	href="${pageContext.request.contextPath }/assets/gallery-examples/im10.jpg"
									data-lightbox="gallery"
									class="image"
									style="background-image:url('${pageContext.request.contextPath }/assets/gallery-examples/im10.jpg')">&nbsp;</a>
									
								<a	href="${pageContext.request.contextPath }/gallery/delete/10"
									class="del-button"
									title="삭제">삭제</a>
							</li>
							
							<li>
								<a	href="${pageContext.request.contextPath }/assets/gallery-examples/im11.jpg"
									data-lightbox="gallery"
									class="image"
									style="background-image:url('${pageContext.request.contextPath }/assets/gallery-examples/im11.jpg')">&nbsp;</a>
									
								<a	href="${pageContext.request.contextPath }/gallery/delete/11"
									class="del-button"
									title="삭제">삭제</a>
							</li>
							
							<li>
								<a	href="${pageContext.request.contextPath }/assets/gallery-examples/im12.jpg"
									data-lightbox="gallery"
									class="image"
									style="background-image:url('${pageContext.request.contextPath }/assets/gallery-examples/im12.jpg')">&nbsp;</a>
									
								<a	href="${pageContext.request.contextPath }/gallery/delete/12"
									class="del-button"
									title="삭제">삭제</a>
							</li>																														
			
							<li>
								<a	href="${pageContext.request.contextPath }/assets/gallery-examples/im13.jpg"
									data-lightbox="gallery"
									class="image"
									style="background-image:url('${pageContext.request.contextPath }/assets/gallery-examples/im13.jpg')">&nbsp;</a>
									
								<a	href="${pageContext.request.contextPath }/gallery/delete/13"
									class="del-button"
									title="삭제">삭제</a>
							</li>
							
							<li>
								<a	href="${pageContext.request.contextPath }/assets/gallery-examples/im14.jpg"
									data-lightbox="gallery"
									class="image"
									style="background-image:url('${pageContext.request.contextPath }/assets/gallery-examples/im14.jpg')">&nbsp;</a>
									
								<a	href="${pageContext.request.contextPath }/gallery/delete/14"
									class="del-button"
									title="삭제">삭제</a>
							</li>
							
							<li>
								<a	href="${pageContext.request.contextPath }/assets/gallery-examples/im15.jpg"
									data-lightbox="gallery"
									class="image"
									style="background-image:url('${pageContext.request.contextPath }/assets/gallery-examples/im15.jpg')">&nbsp;</a>
									
								<a	href="${pageContext.request.contextPath }/gallery/delete/15"
									class="del-button"
									title="삭제">삭제</a>
							</li>																																				
					</ul>	
				</div>
			</div>
			<div id="dialog-upload-form" title="이미지 업로드" style="display:none">
  				<p class="validateTips normal">이미지와 간단한 코멘트를 입력해 주세요.</p>
  				<form action="${pageContext.request.contextPath }/gallery/upload" 
  					  method="post"
  					  enctype="multipart/form-data">
					<label>코멘트</label>
					<input type="text" id="input-comments" name="comments" value="">
					<label>이미지</label>
					<input type="file" id="input-file" name="file">
					<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
  				</form>
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/navigation.jsp">
			<c:param name="menu" value="gallery"/>
		</c:import>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
<script type="text/javascript">
$(function(){
	// 업로드 다이알로그
	var dialogUpload = $( "#dialog-upload-form" ).dialog({
		autoOpen: false,
		height: 280,
		width: 300,
		modal: true,
		buttons: {
			"업로드": function() {
				$( "#dialog-upload-form form" ).submit();
				$( this ).dialog( "close" );
			},
			"취소" : function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			$( "#dialog-upload-form form" ).get(0).reset();	
		}
	});
		
	$("#upload-image").click( function(event) {
		event.preventDefault();
		dialogUpload.dialog( "open" );
	});
});	
</script>
</body>
</html>