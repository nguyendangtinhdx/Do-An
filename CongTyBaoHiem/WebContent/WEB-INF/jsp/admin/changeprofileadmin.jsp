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
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/font-awesome/css/font-awesome.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<title>Bán bảo hiểm trực tuyến</title>

<script type="text/javascript">

	function validateNameProfile() {
	    var a = document.getElementById("hoten").value;
	    if (a != '') {
	        document.getElementById("errorhoten").innerHTML="";
	        return true;
	    }
	    else {
	        document.getElementById("errorhoten").innerHTML="Vui lòng nhập họ tên !";
	        return false;
	    }
	}
	
	 function CheckValidateChangeProfileAdmin(){
	 	if(!validateNameProfile()){
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
				<a href="${pageContext.request.contextPath }/baohiem/changeprofileadmin.html" class="current">Thông tin cá nhân</a>
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
							<h5>Thay đổi thông tin các nhân</h5>
						</div>
						<div class="widget-content nopadding">
							<s:form method="post" commandName="taikhoan" action="${pageContext.request.contextPath }/baohiem/changeprofileadmin.html" class="form-horizontal">
								<s:input path="id" id="id" type="hidden" placeholder=""/>
								<div class="control-group">
									<label class="control-label">Email</label>
									<div class="controls"> 
										<s:input path="tendangnhap" id="tendangnhap" name="tendangnhap" type="email" class="span11" placeholder="Email" readonly="true" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Mật khẩu</label>
									<div class="controls">
										<s:password path="matkhau" id="matkhau" name="matkhau" class="span11" placeholder="Mật khẩu" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Loại tài khoản</label>
									<div class="controls">
										<s:select path="loaitaikhoan">
											<s:option value="admin">Quản lý</s:option>
											<s:option value="staff">Nhân viên</s:option>
											<s:option value="customer">Khách hàng</s:option>
										</s:select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Họ tên</label>
									<div class="controls">
										<s:input path="hoten" id="hoten" name="hoten" type="text" class="span11" placeholder="Họ tên" />
										<br>
										<span style="color: red;" id="errorhoten"></span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Địa chỉ</label>
									<div class="controls">
										<s:input path="diachi" id="diachi" name="diachi" type="text" class="span11" placeholder="Địa chỉ" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Số điện thoại</label>
									<div class="controls">
										<s:input path="sodienthoai" id="sodienthoai" name="sodienthoai" type="text" class="span11" placeholder="Số điện thoại" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Ngân hàng</label>
									<div class="controls">
										<s:input path="nganhang" id="nganhang" name="nganhang" type="text" class="span11" placeholder="Ngân hàng" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Số tài khoản</label>
									<div class="controls">
										<s:input path="sotaikhoan" id="sotaikhoan" name="sotaikhoan" type="text" class="span11" placeholder="Số tài khoản" />
									</div>
								</div>
								<div class="form-actions" style="text-align: center;">
									<button type="submit" class="btn btn-success" onclick="return CheckValidateChangeProfileAdmin();">Xác nhận thay đổi</button>
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
<script src="${pageContext.request.contextPath }/admin/js/jquery.uniform.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/select2.min.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/jquery.dataTables.min.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/matrix.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/matrix.tables.js"></script> 

<jsp:include page="script.jsp"></jsp:include>
    
</html>