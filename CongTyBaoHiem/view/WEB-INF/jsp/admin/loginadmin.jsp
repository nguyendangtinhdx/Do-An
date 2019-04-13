<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon shortcut" href="${pageContext.request.contextPath }/icon/logo.png">
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/matrix-login.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/font-awesome/css/font-awesome.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<title>Bán bảo hiểm trực tuyến</title>
<script type="text/javascript">

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
	
	function CheckValidateLogin(){
	    if(!validateEmail() && !validatePassword()){
	        return false;
	    }
	 	if(!validateEmail()){
	        return false;
	    }
	 	if(!validatePassword()){
	        return false;
	    }
}

</script>
</head>
<body>
	
	 <div id="loginbox">            
            <s:form id="loginform" class="form-vertical" method="post" commandName="taikhoan" action="${pageContext.request.contextPath }/baohiem/loginadmin.html">
				<div class="control-group normal_text"> <h3 style="color: #FFF; font-size: 30px; font-family: inherit;">ĐĂNG NHẬP HỆ THỐNG</h3></div>
                	<span style="color: red; font-size: 20px; font-family: arial; margin-left: 60px;">${erroradmin }</span>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-user"> </i></span><s:input path="tendangnhap" id="tendangnhap" placeholder="Email" />
                        	<br>
                        	<span style="color: red;" id="errortendangnhap"></span>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-lock"></i></span><s:password path="matkhau" id="matkhau" placeholder="Mật khẩu" />
                        	<br>
                        	<span style="color: red;" id="errormatkhau"></span>
                        </div>
                    </div>
                </div>
               <label for="brand1" style="margin: 0 0px 20px 37px"> <input type="checkbox" id="brand1" name="remember" value="1"><span style="color: #FFF;"> Nhớ đăng nhập</span> </label>
                <div class="g-recaptcha" data-sitekey="6LeM0zgUAAAAAMkX0zN3Jw7kX93jogJexlGHJpuz" style="margin-left: 60px"></div>
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link btn btn-info" id="to-recover">Quên mật khẩu ?</a></span>
                    <span class="pull-right"><input type="submit" class="btn btn-success" value="ĐĂNG NHẬP" onclick="return CheckValidateLogin();" /></span>
                </div>
            </s:form>
            <s:form id="recoverform" action="#" class="form-vertical">
				<p class="normal_text">Nhập địa chỉ e-mail của bạn dưới đây và chúng tôi sẽ gửi cho bạn các hướng dẫn cách khôi phục mật khẩu.</p>
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lo"><i class="icon-envelope"></i></span><input type="text" placeholder="Email" />
                        </div>
                    </div>
               
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link btn btn-success" id="to-login">&laquo; Trở lại đăng nhập</a></span>
                    <span class="pull-right"><a href="#" class="btn btn-info">Khôi phục</a></span>
                </div>
            </s:form>
        </div>
        
	
</body>

<script src="${pageContext.request.contextPath }/admin/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/matrix.login.js"></script> 
</html>