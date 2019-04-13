<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="icon shortcut" href="${pageContext.request.contextPath }/icon/logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/uniform.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/select2.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/matrix-style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/matrix-media.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/bootstrap-wysihtml5.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/font-awesome/css/font-awesome.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<title>Bán bảo hiểm trực tuyến</title>

<script type="text/javascript">

	function validateTitle() {
	    var a = document.getElementById("tieude").value;
	    if (a != '') {
	        document.getElementById("errortieude").innerHTML="";
	        return true;
	    }
	    else {
	        document.getElementById("errortieude").innerHTML="Vui lòng nhập tiêu đề !";
	        return false;
	    }
	}
	
	
	function validateContent() {
	    var a = document.getElementById("noidung").value;
	    if (a != '') {
	        document.getElementById("errornoidung").innerHTML="";
	        return true;
	    }
	    else {
	        document.getElementById("errornoidung").innerHTML="Vui lòng nhập nội dung !";
	        return false;
	    }
	}
	
	function validateImage() {
	    var a = document.getElementById("anh").value;
	    if (a != '') {
	        document.getElementById("erroranh").innerHTML="";
	        return true;
	    }
	    else {
	        document.getElementById("erroranh").innerHTML="Vui lòng chọn ảnh !";
	        return false;
	    }
	}
	
	function CheckValidateAddNews(){
	    if(!validateTitle() && !validateContent() && !validateImage()){
	        return false;
	    }
	 	if(!validateTitle()){
       		return false;
	    }
	   	if(!validateContent()){
	        return false;
	    }
	  	if(!validateImage()){
	        return false;
	    } 
	}

</script>

</head>

<body>

 	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${pageContext.request.contextPath }/baohiem/admin.html" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i> Trang chủ</a> 
				<a href="${pageContext.request.contextPath }/baohiem/listnewsadmin.html" class="current">Tin tức</a>
				<a href="${pageContext.request.contextPath }/baohiem/addnewsadmin.html" class="current">Thêm mới tin tức</a>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span3">
				</div>
				<div class="span6">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-align-justify"></i>
							</span>
							<h5>Thêm mới tin tức</h5>
						</div>
						<div class="widget-content nopadding">
							<s:form method="post" commandName="tintuc" action="${pageContext.request.contextPath }/baohiem/addnewsadmin.html" class="form-horizontal">
								<div class="control-group">
									<label class="control-label">Loại tin tức</label>
									<div class="controls">
										<s:select path="loaitintuc">
											<s:option value="Hướng dẫn">Hướng dẫn</s:option>
											<s:option value="Khuyến mãi">Khuyến mãi</s:option>
											<s:option value="Hỗ trợ">Hỗ trợ</s:option>
											<s:option value="slide">slide</s:option>
											<s:option value="Giới thiệu">Giới thiệu</s:option>
											<s:option value="Khác">Khác</s:option>
										</s:select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Tiêu đề</label>
									<div class="controls">
										<s:input path="tieude" id="tieude" name="tieude" type="text" class="span11" placeholder="Tiêu đề" />
										<br>
										<span style="color: red;" id="errortieude"></span>
									</div>
								</div>
						       	<div class="control-group">
						       		<label class="control-label">Nội dung</label>
						           	<div class="controls">
						             	<s:textarea path="noidung" id="noidung" class="textarea_editor span11" rows="6" placeholder="Nhập nội dung..."/>
						           		<br>
										<span style="color: red;" id="errornoidung"></span>
						           	</div>
						       </div>
								<div class="control-group">
						             <label class="control-label">Ảnh</label>
						             <div class="controls">
						                 <s:input path="anh" type="file" id="anh" name="anh" />
						                 <br>
										 <span style="color: red;" id="erroranh"></span>
						             </div>
					            </div>
								<div class="control-group">
									<label class="control-label">Đường dẫn</label>
									<div class="controls">
										<s:input path="duongdan" id="duongdan" name="duongdan" type="text" class="span11" placeholder="Đường dẫn" />
									</div>
								</div>
								<div class="form-actions" style="text-align: center;">
									<a href="${pageContext.request.contextPath }/baohiem/listnewsadmin.html" class="btn btn-info">Quay lại</a>
									<button type="submit" class="btn btn-success" onclick="return CheckValidateAddNews();">Thêm mới</button>
								</div>
							</s:form>
						</div>
					</div>
				</div>
				<div class="span3">
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
    
</body>

<script src="${pageContext.request.contextPath }/admin/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/jquery.ui.custom.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/bootstrap-colorpicker.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/bootstrap-datepicker.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/jquery.toggle.buttons.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/masked.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/jquery.uniform.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/select2.min.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/matrix.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/matrix.form_common.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/wysihtml5-0.3.0.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/jquery.peity.min.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/bootstrap-wysihtml5.js"></script> 
<script>
	$('.textarea_editor').wysihtml5();
</script>
<jsp:include page="script.jsp"></jsp:include>
    
</html>