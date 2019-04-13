<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon shortcut" href="${pageContext.request.contextPath }/icon/logo.png">
<title>Bán bảo hiểm trực tuyến</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="Groovy Apparel a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Meta-Tags -->
    <style> 
         body::-webkit-scrollbar {
            width: 6px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        }
         body::-webkit-scrollbar-thumb {
          background-color: #C41228;
        }
    </style>
<!-- Custom-StyleSheet-Links -->
<!-- Bootstrap-CSS -->     <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css"                  type="text/css" media="all">
<!-- Index-Page-CSS -->    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css"                      type="text/css" media="all">
<!-- Header-Slider-CSS --> <link rel="stylesheet" href="${pageContext.request.contextPath }/css/fluid_dg.css" id="fluid_dg-css" type="text/css" media="all">
<!-- //Custom-StyleSheet-Links -->

<!-- Fonts -->
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Noto+Serif:400,700"     type="text/css" media="all">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Montserrat:400,700"     type="text/css" media="all">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Roboto:100,300,400,500" type="text/css" media="all">
<!-- //Fonts -->

<!-- Font-Awesome-File-Links -->
<!-- CSS --> <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.css"          type="text/css" media="all">
<!-- TTF --> <link rel="stylesheet" href="${pageContext.request.contextPath }/fonts/fontawesome-webfont.ttf" type="text/css" media="all">
<!-- //Font-Awesome-File-Links -->

<!-- Supportive-Modernizr-JavaScript --><script src="${pageContext.request.contextPath }/js/modernizr-2.6.2-respond-1.1.0.min.js"></script>

<!-- Default-JavaScript --><script src="${pageContext.request.contextPath }/js/jquery-2.2.3.js"></script>

<script>
	
	function validateNameProfile() {
	    var a = document.getElementById("hoten2").value;
	    if (a != '') {
	        document.getElementById("errorhoten2").innerHTML="";
	        return true;
	    }
	    else {
	        document.getElementById("errorhoten2").innerHTML="Vui lòng nhập họ tên !";
	        return false;
	    }
	}
	
	function validatePhoneProfile() {
	    var flag = false;
	    var phone = $('#sodienthoai2').val().trim(); // ID của trường Số điện thoại
	    var a = document.getElementById("sodienthoai2").value;
	    if (a != '') {
	        document.getElementById("errorsodienthoai2").innerHTML="";
	        flag = true;
	    }else {
	        document.getElementById("errorsodienthoai2").innerHTML="Vui lòng nhập số điện thoại !";
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
	                document.getElementById("errorsodienthoai2").innerHTML="";
	                flag = true;
	            } else {
	                document.getElementById("errorsodienthoai2").innerHTML="Số điện thoại không hợp lệ !";
	                flag = false;
	            }
	        } else if (firstNumber == '01' && phone.length == 11) {
	            if (phone.match(/^\d{11}/)) {
	                document.getElementById("errorsodienthoai2").innerHTML="";
	                flag = true;
	            } else {
	                document.getElementById("errorsodienthoai2").innerHTML="Số điện thoại không hợp lệ !";
	                flag = false;
	            }
	        } else {
	                document.getElementById("errorsodienthoai2").innerHTML="Số điện thoại không hợp lệ !";
	                flag = false;
	            }
	    }   
	    return flag;
	}
	
	 function CheckValidateChangeProfile(){
      /*   if(!validateNameProfile() && !validatePhoneProfile()){
            return false;
        }
   	 	if(!validatePhoneProfile()){
            return false;
        } */
   	 	if(!validateNameProfile()){
            return false;
        }
    }

    $(document).ready(function(){
    	$("#id").prop("readonly", true);
    	$("#tendangnhap2").prop("readonly", true);
    	
    });
    
</script>

</head>
<body style="background: #F5F5F5">
<%-- 	<c:if test="${sessionScope.tendangnhap == null}">
		<jsp:forward page="${pageContext.request.contextPath }/baohiem/index.html"></jsp:forward>
	</c:if> --%>

	<jsp:include page="header.jsp"></jsp:include>
	
	<h2 style="font-weight: bold; margin: auto; font-family: inherit; margin-bottom: -80px">THÔNG TIN CÁ NHÂN</h2>    
	
	<div class="wthreeaddressaits">
        <div class="container">
            <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid1">
            </div> 

            <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid2">
                <s:form method="post" commandName="taikhoancanhan" action="${pageContext.request.contextPath }/baohiem/changeprofile.html">
                   		<s:input path="id" id="id" type="hidden" placeholder=""/>
	                   	<p style="color: #000; display: inline;">Email</p><span style="color: red; float: right;" id="errortendangnhap2"></span> 
						<s:input path="tendangnhap" id="tendangnhap2" placeholder="Email"/>
						<p style="color: #000; display: inline;">Mật khẩu mới</p><span style="color: red; float: right;" id="errormatkhau"></span> 
						<s:password path="matkhau" id="matkhau" placeholder="Mật khẩu mới"/> 
	                  	<p style="color: #000; display: inline;">Họ tên</p><span style="color: red; float: right;" id="errorhoten2"></span>
						<s:input path="hoten" id="hoten2" placeholder="Họ tên" required=""/>
						<p style="color: #000; display: inline;">Địa chỉ</p><span style="color: red; float: right; " id="errordiachi"></span>
						<s:input path="diachi" id="diachi" placeholder="Địa chỉ"/>
						<p style="color: #000; display: inline;">Số điện thoại</p><span style="color: red; float: right;" id="errorsodienthoai2"></span>
						<s:input path="sodienthoai" id="sodienthoai2" placeholder="Số điện thoại"/>
						
						<div class="send-button wthree agileits">
							<input type="submit" value="XÁC NHẬN THAY ĐỔI" onclick="return CheckValidateChangeProfile();">
						</div>
                </s:form>
            </div>
             <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid1" style="width: 260px; float: right; margin-top: 150px; text-align: right;">

            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //Contact -->
	
	

    <jsp:include page="subcribe.jsp"></jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>
</body>

  <jsp:include page="script.jsp"></jsp:include>
  
</html>