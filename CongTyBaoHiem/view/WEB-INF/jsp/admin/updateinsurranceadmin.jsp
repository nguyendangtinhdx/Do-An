<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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

	function validateTypeInsurrance() {
	    var a = document.getElementById("loaibaohiem").value;
	    if (a != '') {
	        document.getElementById("errorloaibaohiem").innerHTML="";
	        return true;
	    }
	    else {
	        document.getElementById("errorloaibaohiem").innerHTML="Vui lòng nhập loại bảo hiểm !";
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
	
	function validateDescribe() {
	    var a = document.getElementById("mota").value;
	    if (a != '') {
	        document.getElementById("errormota").innerHTML="";
	        return true;
	    }
	    else {
	        document.getElementById("errormota").innerHTML="Vui lòng nhập mô tả !";
	        return false;
	    }
	}
	
	function CheckValidateUpdateInsurrance(){
	    if(!validateTypeInsurrance() /* && !validateImage() */ && !validateDescribe()){
	        return false;
	    }
	 	if(!validateTypeInsurrance()){
       		return false;
	    }
	/*    	if(!validateImage()){
	        return false;
	    } */
	  	if(!validateDescribe()){
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
				<a href="${pageContext.request.contextPath }/baohiem/listinsurranceadmin.html" class="current">Bảo hiểm</a>
				<a href="#" class="current">Cập nhật bảo hiểm</a>
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
							<h5>Cập nhật bảo hiểm</h5>
						</div>
						<div class="widget-content nopadding">
							<s:form method="post" commandName="baohiem" action="${pageContext.request.contextPath }/baohiem/updateinsurranceadmin.html" class="form-horizontal">
								<s:input path="id" id="id" type="hidden" placeholder=""/>
								<div class="control-group">
									<label class="control-label">Loại bảo hiểm</label>
									<div class="controls">
										<s:input path="loaibaohiem" id="loaibaohiem" name="loaibaohiem" type="text" class="span11" placeholder="Loại bảo hiểm" />
										<br>
										<span style="color: red;" id="errorloaibaohiem"></span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Đơn giá</label>
									<div class="controls">
										<s:input path="dongia" id="dongia" name="dongia" type="number" step="100000" min="100000" max="1000000000" class="span11" />
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
									<label class="control-label">Mô tả</label>
									<div class="controls">
										<s:textarea path="mota" id="mota" name="mota" class="textarea_editor span11" style="height: 100px" />
										<br>
										<span style="color: red;" id="errormota"></span>
									</div>
								</div>
								<div class="form-actions" style="text-align: center;">
									<a href="${pageContext.request.contextPath }/baohiem/listinsurranceadmin.html" class="btn btn-info">Quay lại</a>
									<button type="submit" class="btn btn-success" onclick="return CheckValidateUpdateInsurrance();">Cập nhật</button>
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