<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="m" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<title>Bán bảo hiểm trực tuyến</title>

<style>
#key::placeholder {
    color: #000;
}
</style>

<script type="text/javascript">

	var day =["<m:message code='sunday'></m:message>","<m:message code='monday'></m:message>","<m:message code='tuesday'></m:message>","<m:message code='wednesday'></m:message>","<m:message code='thursday'></m:message>","<m:message code='friday'></m:message>","<m:message code='saturday'></m:message>"];
	var x =setInterval(date);
	function date()
	{
	    var d = new Date();
	    document.getElementById('date').innerHTML = day[d.getDay()] + ", <m:message code='day'></m:message> " + d.toLocaleDateString();
	}
	
	
	
	
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
    
    function CheckValidateSignin(){
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
    
    // check declare
    
     function validateNumberVehicle() {
       var a = document.getElementById("bienso").value;
       if (a != '') {
           return true;
       }
       else {
       		alert("Vui lòng mua bảo hiểm trước khi khai báo !");
	       	window.location.replace("${pageContext.request.contextPath }"); // trở về trang chủ
       }
    }
    
    function validateDayAccident() {
        var a = document.getElementById("ngaytainan").value;
        if (a != '') {
            document.getElementById("errorngaytainan").innerHTML="";
            return true;
        }
        else {
            document.getElementById("errorngaytainan").innerHTML="Vui lòng chọn ngày xảy ra tai nạn !";
            return false;
        }
    }
    
   
   function validateNameDriver() {
       var a = document.getElementById("tentaixe").value;
       if (a != '') {
           document.getElementById("errortentaixe").innerHTML="";
           return true;
       }
       else {
           document.getElementById("errortentaixe").innerHTML="Vui lòng nhập tên tài xế !";
           return false;
       }
   }
   
   
   function validateAddressAccident() {
       var a = document.getElementById("diadiemtainan").value;
       if (a != '') {
           document.getElementById("errordiadiemtainan").innerHTML="";
           return true;
       }
       else {
           document.getElementById("errordiadiemtainan").innerHTML="Vui lòng nhập địa chỉ tai nạn !";
           return false;
       }
   }
   
   function validateDescribe() {
       var a = document.getElementById("motathiethai").value;
       if (a != '') {
           document.getElementById("errormotathiethai").innerHTML="";
           return true;
       }
       else {
           document.getElementById("errormotathiethai").innerHTML="Vui lòng nhập mô tả thiệt hại !";
           return false;
       }
   }
   
   function validateDayAccident2() {
       var a = $('#ngaytainan').val();
       //ngày sinh được nhập
       var comp = a.split('-');
       var y = parseInt(comp[0], 10);
       var m = parseInt(comp[1], 10);
       var d = parseInt(comp[2], 10);
       
       //ngày sinh tự có
       var d1 = new Date();
       var year = parseInt(d1.getFullYear());
       var month = d1.getMonth() + 1;  
       var day = d1.getDate();
       
       if (y > 1900) {
       	 if(y <= year){
       		 if(y == year){
       			 if(m <= month){
                        if(m == month){
                            if(d <= day){
                                   document.getElementById("errorngaytainan").innerHTML="";
                                   return true;
                            }else{
                                   document.getElementById("errorngaytainan").innerHTML="Ngày tai nạn không hợp lệ !";
                                   return false;
                            }
                        } else {
                       	 document.getElementById("errorngaytainan").innerHTML="";
                            return true;
                        }
                    } else{
                        document.getElementById("errorngaytainan").innerHTML="Ngày tai nạn không hợp lệ !";
                        return false;
                    }
       		 } else {
                    document.getElementById("errorngaytainan").innerHTML="";
                    return true;
                }
       	}else{
       		document.getElementById("errorngaytainan").innerHTML="Ngày tai nạn không hợp lệ !";
               return false;
       	} 
       } else {
           document.getElementById("errorngaytainan").innerHTML="Ngày tai nạn không hợp lệ !";
           return false;
       }
   }

    
   function CheckValidateDeclare(){
	   if(!validateNumberVehicle()){
           return false;
       }
  	   if(!validateDayAccident() && !validateDayAccident2() && !validateNameDriver() && !validateAddressAccident() && !validateDescribe()){
  		 	return false;
  	   } 
       if(!validateDayAccident()){
           return false;
       }
       if(!validateDayAccident2()){
           return false;
       }
       if(!validateNameDriver()){
           return false;
       }
       if(!validateAddressAccident()){
           return false;
       }
       if(!validateDescribe()){
           return false;
       } 
   }
   
   // check payment
   
    $(document).ready(function(){
    	$("#nganhang").hide();
        $("#sotaikhoan").hide();
        $("#labelnganhang").hide();
        $("#labelsotaikhoan").hide();
        $('#phuongthucthanhtoan').on('change', function() {
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
        	if(b =='' && c == ''){
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
     
    function CheckValidatePayment(){
        if(!validateTransfer()){
            return false;
        }
    }
	
 /*   $(document).ready(function(){  // auto click by id
        $('#click')[0].click(); 
   });  */
   


</script>

</head>
<body>

<!-- Header -->
	<div class="agileheader" id="agileitshome">

		<!-- Navigation -->
		<nav class="navbar navbar-default w3ls navbar-fixed-top">
			<div class="container">
				<div class="navbar-header wthree nav_2">
					<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
						<span class="sr-only"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand agileinfo" href="${pageContext.request.contextPath }"><span><m:message code="logoleft"></m:message></span> <m:message code="logoright"></m:message></a> 
				</div>
				<div id="bs-megadropdown-tabs" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
					<c:if test="${sessionScope.tendangnhap != null}">
						<li class="dropdown">
							<a class="popup-with-zoom-anim" href="#small-dialog3"> <m:message code="declare"></m:message></a>
						</li>
						
						<li class="dropdown">
							<a href="${pageContext.request.contextPath }/baohiem/listdeclare.html"> <m:message code="listdeclare"></m:message></a>
						</li>

						<li class="dropdown">
							<a href="${pageContext.request.contextPath }/baohiem/listbuyinsurrance.html"> <m:message code="listbuyinsurrance"></m:message></a>
						</li>
					</c:if>
						<li class="wthreesearch" style="margin-right: -75px">
							<s:form method="post" commandName="baohiem" action="${pageContext.request.contextPath }/baohiem/search.html">
								<input id="key" type="search" name="key" placeholder="<m:message code="key"></m:message>">
								<button type="submit" class="btn btn-default search" aria-label="Left Align">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
							</s:form>
						</li>
					</ul>
				</div>

			</div>
		</nav>
		<!-- //Navigation -->



		<!-- Header-Top-Bar-(Hidden) -->
		<div class="agileheader-topbar">
			<div class="container">
				<div class="col-md-2 agileheader-topbar-grid agileheader-topbar-grid1">
                    <!-- <p>Hotline: <a href="#">1800-588813</a></p> -->
                    <a href="${pageContext.request.contextPath }?lang=vi" style="color: #C41228">Tiếng việt |</a>
					<a href="${pageContext.request.contextPath }?lang=en" style="color: #C41228">English</a>
                </div>
                <div class="col-md-2 agileheader-topbar-grid agileheader-topbar-grid1">
                     <b id="date" style="color: #C41228; font-weight: normal;"></b>
                </div>
                <div class="col-md-2 agileheader-topbar-grid agileheader-topbar-grid1">
                    <div id="fb-root"></div>
                    <script>(function(d, s, id) {
                      var js, fjs = d.getElementsByTagName(s)[0];
                      if (d.getElementById(id)) return;
                      js = d.createElement(s); js.id = id;
                      js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.12&appId=860333777447491&autoLogAppEvents=1';
                      fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));</script>
                    <div class="fb-like" data-href="https://tructuyen.baominh.vn/" data-layout="button_count" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div>
                </div>
				<div class="col-md-6 agileheader-topbar-grid agileheader-topbar-grid2">
					<ul>
						
						<li><a href="${pageContext.request.contextPath }/baohiem/introduce.html"><m:message code="introduce"></m:message></a></li>
                        <li><a href="${pageContext.request.contextPath }/baohiem/guide.html"><m:message code="guide"></m:message></a></li>
                        <li><a href="${pageContext.request.contextPath }/baohiem/contact.html"><m:message code="contact"></m:message></a></li>
						<c:if test="${sessionScope.tendangnhap == null}">
							<li><a class="popup-with-zoom-anim" href="#small-dialog1"><i class="fa fa-lock"></i> <m:message code="login"></m:message></a></li>
							<li><a class="popup-with-zoom-anim" href="#small-dialog2"><i class="fa fa-sign-in"></i> <m:message code="signin"></m:message></a></li>
						</c:if>
						<c:if test="${sessionScope.tendangnhap != null}">
							<p hidden="">${sessionScope.tendangnhap}</p>
                        	<li><a href="${pageContext.request.contextPath }/baohiem/listbuyinsurrance.html"><m:message code="payment"></m:message></a></li>
							<li><a href="${pageContext.request.contextPath }/baohiem/changeprofile.html"><i class="fa fa-user"></i><span style="color: #C41228; font-weight: bold"> ${sessionScope.hotencuataikhoan }</span></a></li>
							<li><a href="${pageContext.request.contextPath }/baohiem/logout.html" onclick="return confirm('Bạn có chắc muốn đăng xuất không ?')"><i class="fa fa-sign-out"></i> <m:message code="logout"></m:message></a></li>
						</c:if>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>

				<!-- Popup-Box -->
				<div id="popup1">
					<div id="small-dialog1" class="mfp-hide agileinfo" >
						<div class="pop_up">
							<s:form method="post" commandName="taikhoan" action="${pageContext.request.contextPath }/baohiem/login.html">
								<h3 style="font-weight: bold;margin-bottom: 0">ĐĂNG NHẬP</h3>
									<span style="color: red; margin: auto;">${errorLogin }</span>
									<br>
									<p style="color: #000; display: inline;">Email</p><span style="color: red; float: right;" id="errortendangnhap"></span>
									<s:input path="tendangnhap" id="tendangnhap" placeholder="Email"/>
									<p style="color: #000; display: inline;">Mật khẩu</p><span style="color: red; float: right;" id="errormatkhau"></span>
									<s:password path="matkhau" id="matkhau" placeholder="Mật khẩu"/> 
								<ul class="tick w3layouts agileinfo">
									<li>
										<input type="checkbox" id="brand1" name="remember" value="1">
										<label for="brand1"><span></span>Nhớ đăng nhập</label>
									</li>
									<li>
										<a href="#">Quên mật khẩu ?</a>
									</li>
								</ul>
								<span style="color: red;">${errorCaptcha }</span>
								<div class="g-recaptcha" data-sitekey="6LeM0zgUAAAAAMkX0zN3Jw7kX93jogJexlGHJpuz" style="margin: 0 -11px 20px"></div>
								<div class="send-button wthree agileits">
									<input type="submit" value="ĐĂNG NHẬP" onclick="return CheckValidateLogin();">
								</div>
							</s:form>
						</div>
					</div>
					<div id="small-dialog2" class="mfp-hide agileinfo" style="width: 400px;">
						<div class="pop_up">
							<s:form method="post" commandName="taikhoan" action="${pageContext.request.contextPath }/baohiem/signup.html">
								<h3 style="font-weight: bold;margin: -15px 0 0;">ĐĂNG KÝ</h3>
									<span style="color: red">${errorSignin }</span>
									<br>
									<p style="color: #000; display: inline;">Email</p><span style="color: red; float: right;" id="errortendangnhap"></span> 
									<s:input path="tendangnhap" id="tendangnhap" placeholder="Email"/>
									<p style="color: #000; display: inline;">Mật khẩu</p><span style="color: red; float: right;" id="errormatkhau"></span> 
									<s:password path="matkhau" id="matkhau" placeholder="Mật khẩu"/> 
 									<p style="color: #000; display: inline;">Xác nhận mật khẩu</p><span style="color: red; float: right;" id="errorxacnhanmatkhau"></span>
									<%-- <s:password path="matkhau" id="xacnhanmatkhau" placeholder="Xác nhận mật khẩu"/> --%> 
									<input type="password" id="xacnhanmatkhau" placeholder="Xác nhận mật khẩu"/>
 									<p style="color: #000; display: inline;">Họ tên</p><span style="color: red; float: right;" id="errorhoten"></span>
									<s:input path="hoten" id="hoten" placeholder="Họ tên"/>
									<p style="color: #000; display: inline;">Địa chỉ</p><span style="color: red; float: right; " id="errordiachi"></span>
									<s:input path="diachi" id="diachi" placeholder="Địa chỉ"/>
									<p style="color: #000; display: inline;">Số điện thoại</p><span style="color: red; float: right;" id="errorsodienthoai"></span>
									<s:input path="sodienthoai" id="sodienthoai" placeholder="Số điện thoại"/>
								<div class="send-button wthree agileits">
									<input type="submit" value="ĐĂNG KÝ" onclick="return CheckValidateSignin();">
								</div>
							</s:form>
						</div>
					</div>
					<div id="small-dialog3" class="mfp-hide agileinfo" style="width: 400px;">
						<div class="pop_up">
							 <s:form method="post" commandName="hosotainan" action="${pageContext.request.contextPath }/baohiem/declare.html">
								<h3 style="font-weight: bold; margin: -10px 0 10px">HỒ SƠ KHAI BÁO TAI NẠN</h3>
									<p style="color: #000; display: inline;">Chọn biển số xe của bạn</p>
									<select id="bienso" name="bienso" class="form-control selectpicker" style="background: #000; color: #fff;border-radius: 0px ; height: 45px;margin-bottom:20px ; font-size: 12px; border: 1px solid #000;">
                   		  				<c:forEach var="phieumuabaohiem" items="${danhsachphieumuabaohiem }">
	                   		  				<option value="${phieumuabaohiem.bienso }">${phieumuabaohiem.bienso }</option>
                   		  				</c:forEach>
                 		  			</select>
                 		  		<%-- 	<s:select path="bienso">
									<c:forEach var="item" items="${genders}">
									    <c:choose>
									        <c:when test="${account.getCfGender().getCfGender()==item.getCfGender()}">
									            <s:option selected="true" value="${item.getCfGender()}">
									                <fmt:message key="cf_gender.${item.getCfGender()}" />
									            </s:option>
									        </c:when>
									
									        <c:otherwise>
									            <s:option value="${item.getCfGender()}">
									                <fmt:message key="cf_gender.${item.getCfGender()}" />
									            </s:option>
									        </c:otherwise>
									    </c:choose>
									</c:forEach>
									</s:select> --%>
                 		  			
									<p style="color: #000; display: inline;">Ngày tai nạn</p><span style="color: red; float: right;" id="errorngaytainan"></span> 
									<input type="date" id="ngaytainan" name="ntn" placeholder="Ngày tai nạn" style="width: 100%; height: 45px; background: #000; color: #fff; border: 1px solid #000;font-size: 12px; margin-bottom: 20px"/>   
									<p style="color: #000; display: inline;">Tên tài xế</p><span style="color: red; float: right;" id="errortentaixe"></span>
									<s:input path="tentaixe" id="tentaixe" placeholder="Tên tài xế"/> 
									<p style="color: #000; display: inline;">Có bằng lái xe chưa</p><span style="color: red; float: right;" id="errorcobanglaixechua"></span>
									<div style="margin-left: 50px; display: inline;">
									<s:radiobutton path="cobanglaixe" name="cobanglaixe" value="true"/> Có &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<s:radiobutton path="cobanglaixe" name="cobanglaixe" value="false" checked="checked"/> Chưa
									</div>
									<br><br>
									<p style="color: #000; display: inline;">Địa điểm tai nạn</p><span style="color: red; float: right; " id="errordiadiemtainan"></span>
									<s:input path="diadiemtainan" id="diadiemtainan" placeholder="Địa điểm tai nạn"/>
									<p style="color: #000; display: inline;">Mô tả thiệt hại</p><span style="color: red; float: right;" id="errormotathiethai"></span>
									<s:input path="motathiethai" id="motathiethai" placeholder="Mô tả thiệt hại"/>
									
								<div class="send-button wthree agileits">
									<input type="submit" value="GỬI THÔNG TIN" onclick="return CheckValidateDeclare();">
								</div>
							</s:form> 
							
						</div>
					</div>
				<%-- 	<div id="small-dialog4" class="mfp-hide agileinfo" style="width: 400px;">
						<div class="pop_up">
							<s:form method="post" commandName="taikhoan" action="${pageContext.request.contextPath }/taikhoan/payment.html">
								<span style="color: red">${errorDeclare }</span>
								<h3 style="font-weight: bold; margin-bottom: 20px">THÔNG TIN THANH TOÁN</h3>
									<p style="color: #000; display: inline;">Chọn phương thức thanh toán</p>
									<select id="phuongthucthanhtoan" name="phuongthucthanhtoan" class="form-control selectpicker" style="background: #000; color: #fff;border-radius: 0px ; height: 45px;margin-bottom:20px ; font-size: 12px; border: 1px solid #000;">
                   		  				<option value="Thanh toán khi mua bảo hiểm">Thanh toán khi mua bảo hiểm</option>
                          				<option value="Chuyển khoản" >Chuyển khoản</option>
                 		  			</select>
									<p id="labelnganhang" style="color: #000; display: inline;">Ngân hàng</p><span style="color: red; float: right;" id="errornganhang"></span>
									<s:input path="nganhang" id="nganhang" placeholder="Ngân hàng"/> 
									<p id="labelsotaikhoan" style="color: #000; display: inline;">Số tài khoản</p><span style="color: red; float: right; " id="errorsotaikhoan"></span>
									<s:input path="sotaikhoan" id="sotaikhoan" placeholder="Số tài khoản"/>
									
								<div class="send-button wthree agileits">
									<input type="submit" value="XÁC NHẬN THANH TOÁN" onclick="return CheckValidatePayment();">
								</div>
							</s:form>
						</div>
					</div> --%>
					
				</div>
				<!-- //Popup-Box -->

		</div>
		<!-- //Header-Top-Bar-(Hidden) -->
		

	</div>
	<!-- //Header -->
</body>
</html>