<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<script type="text/javascript">
	//check payment
	
	$(document).ready(function(){
		$("#nganhang").hide();
	    $("#sotaikhoan").hide();
	    $("#labelnganhang").hide();
	    $("#labelsotaikhoan").hide();
	    $('#phuongthucthanhtoan2').on('change', function() {
	        if (this.value == 'Chuyển khoản' )
	        {
	            $("#nganhang").show();
	            $("#sotaikhoan").show();
	            $("#labelnganhang").show();
	            $("#labelsotaikhoan").show();
	        }
	        else
	        {
	            $("#nganhang").hide();
	            $("#sotaikhoan").hide();
	            $("#labelnganhang").hide();
	            $("#labelsotaikhoan").hide();
	        }
	    });
	});
	
	 function validateTransfer() {
	    var a = document.getElementById("phuongthucthanhtoan").value;
	    var b = document.getElementById("nganhang").value;
	    var c = document.getElementById("sotaikhoan").value;
	    if (a == 'Chuyển khoản') {
	    	if(b == '' && c == ''){
	    	    document.getElementById("errornganhang").innerHTML="Vui lòng nhập tên ngân hàng !";
	    	    document.getElementById("errorsotaikhoan").innerHTML="Vui lòng nhập số tài khoản !";
	            return false;
	    	}
	    	if(b ==''){
	    	    document.getElementById("errornganhang").innerHTML="Vui lòng nhập tên ngân hàng !";
	            return false;
	    	} else {
	           document.getElementById("errornganhang").innerHTML="";
	       	   if(c != ''){
	                document.getElementById("errorsotaikhoan").innerHTML="";
	                return true;
	           } else {
	               document.getElementById("errorsotaikhoan").innerHTML="Vui lòng nhập số tài khoản !";
	               return false;
	           }
	           return true;
	        }
	    }else{
	    	 document.getElementById("errorsotaikhoan").innerHTML="";
	    	 document.getElementById("errornganhang").innerHTML="";
	    	 return true;
	    }
	}
	 
	function CheckValidatePaymentPage(){
	    if(!validateTransfer()){
	        return false;
	    }
	}

    
</script>
</head>


<body style="background: #F5F5F5">
    <jsp:include page="header.jsp"></jsp:include>

	<h2 style="font-weight: bold; margin: auto; font-family: inherit; margin-bottom: -50px">THÔNG TIN THANH TOÁN
	<br>
		<span style="color: red; font-size: 20px">${errorPayment }</span>
	</h2>  
	
    
    <div class="clearfix"></div>
    
    <div class="wthreeaddressaits">
        <div class="container">
            <h4 style="color: red; margin-top: 20px"></h4> 
            <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid1">
            </div>

            <div class="col-md-4">
                <s:form method="post" commandName="taikhoan" action="${pageContext.request.contextPath }/baohiem/payment.html">
						<p style="color: #000; display: inline;">Chọn phương thức thanh toán</p>
						<select id="phuongthucthanhtoan" name="phuongthucthanhtoan" class="form-control selectpicker" style="background: #000; color: #fff;border-radius: 0px ; height: 45px;margin-bottom:20px ; font-size: 12px; border: 1px solid #000;">
       		  				<option value="Thanh toán khi mua bảo hiểm">Thanh toán khi mua bảo hiểm</option>
              				<option value="Chuyển khoản" >Chuyển khoản</option>
     		  			</select>
						<p id="labelnganhang" style="color: #000; display: inline;">Ngân hàng</p><span style="color: red; float: right;" id="errornganhang"></span>
						<s:input path="nganhang" id="nganhang" name="nganhang" placeholder="Ngân hàng"/> 
						<p id="labelsotaikhoan" style="color: #000; display: inline;">Số tài khoản</p><span style="color: red; float: right; " id="errorsotaikhoan"></span>
						<s:input path="sotaikhoan" id="sotaikhoan" name="sotaikhoan" placeholder="Số tài khoản"/>
						<input type="hidden" id="sotienthanhtoan" name="sotienthanhtoan" value="${money }" readonly="readonly">
					<div class="send-button wthree agileits">
						<input type="submit" value="XÁC NHẬN THANH TOÁN" onclick="return CheckValidatePaymentPage();">
					</div>
				</s:form>
            </div>
             <div class="col-md-4s wthreeaddressaits-grid wthreeaddressaits-grid1" style="width: 260px; float: right; margin-top: 230px; text-align: right;">
                 <h4 style="float: right; font-weight: bold;">TỔNG TIỀN THANH TOÁN</h4>
                 <br>
                 <p style="font-weight: bold;float: right; font-size: 20px"><fmt:formatNumber pattern="#,##0" value="${money }" /> VND</p>
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