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


	function validateName() {
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
  
	function validateAddress() {
	     var a = document.getElementById("diachi").value;
	     if (a != '') {
	         document.getElementById("errordiachi").innerHTML="";
	         return true;
	     }
	     else {
	         document.getElementById("errordiachi").innerHTML="Vui lòng nhập địa chỉ !";
	         return false;
	     }
	}
	 
	function validatePhone() {
	     var flag = false;
	     var phone = $('#sodienthoai').val().trim(); // ID của trường Số điện thoại
	     var a = document.getElementById("sodienthoai").value;
	     if (a != '') {
	         document.getElementById("errorsodienthoai").innerHTML="";
	         flag = true;
	     }else {
	         document.getElementById("errorsodienthoai").innerHTML="Vui lòng nhập số điện thoại !";
	         flag = false;
	     }
	     phone = phone.replace('(+84)', '0');
	     phone = phone.replace('+84', '0');
	     phone = phone.replace('0084', '0');
	     phone = phone.replace(/ /g, '');
	     if (phone != '') {
	         var firstNumber = phone.substring(0, 2);
	         if ((firstNumber == '09' || firstNumber == '08') && phone.length == 10) {
	             if (phone.match(/^\d{10}/)) {
	                 document.getElementById("errorsodienthoai").innerHTML="";
	                 flag = true;
	             } else {
	                 document.getElementById("errorsodienthoai").innerHTML="Số điện thoại không hợp lệ !";
	                 flag = false;
	             }
	         } else if (firstNumber == '01' && phone.length == 11) {
	             if (phone.match(/^\d{11}/)) {
	                 document.getElementById("errorsodienthoai").innerHTML="";
	                 flag = true;
	             } else {
	                 document.getElementById("errorsodienthoai").innerHTML="Số điện thoại không hợp lệ !";
	                 flag = false;
	             }
	         } else {
	                 document.getElementById("errorsodienthoai").innerHTML="Số điện thoại không hợp lệ !";
	                 flag = false;
	             }
	     }   
	     return flag;
	}
	
	function validateEmail() {
	     var a = document.getElementById("tendangnhap").value;
	     var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	     if (filter.test(a)) {
	         document.getElementById("errortendangnhap").innerHTML="";
	         return true;
	     }
	     else {
	         document.getElementById("errortendangnhap").innerHTML="Email không hợp lệ !";
	         return false;
	     }
	}
	
	function validatePassword() {
	    var a = document.getElementById("matkhau").value;
	    if (a != '') {
	        document.getElementById("errormatkhau").innerHTML="";
	        return true;
	    }
	    else {
	        document.getElementById("errormatkhau").innerHTML="Vui lòng nhập mật khẩu !";
	        return false;
	    }
	}
	
	function validateConfirmPassword() {
		var a = document.getElementById("matkhau").value;
	    var b = document.getElementById("xacnhanmatkhau").value;
	    if (a == b) {
	    	if(b == ''){
	    		   document.getElementById("errorxacnhanmatkhau").innerHTML="Vui lòng nhập xác nhận mật khẩu !";
	               return false;
	    	}else{
	    	    document.getElementById("errorxacnhanmatkhau").innerHTML="";
	    	    return true;
	    	}
	    }
	    else {
	        document.getElementById("errorxacnhanmatkhau").innerHTML="Xác nhận mật khẩu không chính xác !";
	        return false;
	    }
	}
	
	
	function CheckValidateAddAccount(){
	    if(!validateName() /* && !validateAddress()  && !validatePhone()  */ && !validateEmail() && !validatePassword() && !validateConfirmPassword()){
	        return false;
	    }
	 	if(!validateEmail()){
       		return false;
	    }
	   	if(!validatePassword()){
	        return false;
	    }
		  	if(!validateConfirmPassword()){
	        return false;
	    } 
		 	if(!validateName()){
	        return false;
	    }
	   /*  if(!validateAddress()){
	        return false;
	    }
	    if(!validatePhone()){
	        return false;
	    }  */
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
				<a href="${pageContext.request.contextPath }/baohiem/listaccountadmin.html" class="current">Tài khoản</a>
				<a href="${pageContext.request.contextPath }/baohiem/addaccountadmin.html" class="current">Thêm mới tài khoản</a>
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
							<h5>Thêm mới tài khoản</h5>
						</div>
						<div class="widget-content nopadding">
							<s:form method="post" commandName="taikhoan" action="${pageContext.request.contextPath }/baohiem/addaccountadmin.html" class="form-horizontal">
								<div class="control-group">
									<label class="control-label">Email</label>
									<div class="controls">
										<s:input path="tendangnhap" id="tendangnhap" name="tendangnhap" type="email" class="span11" placeholder="Email" />
										<br>
										<span style="color: red;" id="errortendangnhap"></span> 
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Mật khẩu</label>
									<div class="controls">
										<s:password path="matkhau" id="matkhau" name="matkhau" class="span11" placeholder="Mật khẩu" />
										<br>
										<span style="color: red;" id="errormatkhau"></span> 
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Xác nhận mật khẩu</label>
									<div class="controls">
										<input id="xacnhanmatkhau" name="xacnhanmatkhau" type="password" class="span11" placeholder="Xác nhận mật khẩu" />
										<br>
										<span style="color: red;" id="errorxacnhanmatkhau"></span> 
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
									<a href="${pageContext.request.contextPath }/baohiem/listaccountadmin.html" class="btn btn-info">Quay lại</a>
									<button type="submit" class="btn btn-success" onclick="return CheckValidateAddAccount();">Thêm mới</button>
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