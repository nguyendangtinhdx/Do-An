<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	function CountTime() {
	    var money = document.getElementById("dongia").value;
	    var duration = document.getElementById("thoihan").value;
	    document.getElementById("VAT").innerHTML =  (((money*duration/12) / 10) / 10).formatMoney(0, " ") + " đồng";
	    document.getElementById("Sum").innerHTML =  (((money*duration/12) / 10) + (((money*duration/12) / 10)) / 10).formatMoney(0, " ") + " đồng";
	}
	
	/*     function Charged() {
	    var money = document.getElementById("Money").value;
	    var duration = document.getElementById("Duration").value;
	    document.getElementById("Sum").innerHTML =  (((money*duration/12) * 0.1) - 15000).formatMoney(0, " ") + " đồng";
	} */
	
	Number.prototype.formatMoney = function(places, symbol, thousand, decimal) {
	    places = !isNaN(places = Math.abs(places)) ? places : 2;
	    symbol = symbol !== undefined ? symbol : "$";
	    thousand = thousand || ".";
	    decimal = decimal || ",";
	    var number = this, 
	        negative = number < 0 ? "-" : "",
	        i = parseInt(number = Math.abs(+number || 0).toFixed(places), 10) + "",
	        j = (j = i.length) > 3 ? j % 3 : 0;
	    return symbol + negative + (j ? i.substr(0, j) + thousand : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousand) + (places ? decimal + Math.abs(number - i).toFixed(places).slice(2) : "");
	};
    
    function validateVehicleNumber() {
        var a = document.getElementById("bienso2").value;
        if (a != '') {
            document.getElementById("errorbienso2").innerHTML="";
            return true;
        }
        else {
            document.getElementById("errorbienso2").innerHTML="Vui lòng nhập biển số xe !";
            return false;
        }
    }
    
    function validateTypeInsurrance() {
        var a = document.getElementById("loaibaohiem").value;
        if (a != '') {
            document.getElementById("errorloaibaohiem").innerHTML="";
            return true;
        }
        else {
        	alert("Vui lòng chọn loại bảo hiểm cần mua !");
        	window.location.replace("${pageContext.request.contextPath }"); // trở về trang chủ
          /*   document.getElementById("errorloaibaohiem").innerHTML="Vui lòng mua bảo hiểm !";
            return false; */
        }
    }
    
    function validateSeatingOto() {
        var a = document.getElementById("sochongoi").value;
        if (a != 'Chọn số chỗ ngồi') {
            document.getElementById("errorsochongoi").innerHTML="";
            return true;
        }
        else {
            document.getElementById("errorsochongoi").innerHTML="Vui lòng chọn số chỗ ngồi !";
            return false;
        }
    }
    
    function validateDuration() {
        var a = document.getElementById("thoihan").value;
        if (a != 'Chọn thời hạn') {
            document.getElementById("errorthoihan").innerHTML="";
            return true;
        }
        else {
            document.getElementById("errorthoihan").innerHTML="Vui lòng chọn thời hạn !";
            return false;
        }
    }
    
   
    function CheckValidateBuyInsurrance(){
        if(!validateTypeInsurrance()){
            return false;
        }
    	if(!validateVehicleNumber() /* && !validateSeatingOto() */ && !validateDuration() ){
            return false;
       	}  
        if(!validateVehicleNumber()){
            return false;
        }
        /* if(!validateSeatingOto()){
            return false;
        } */
        if(!validateDuration()){
            return false;
        }
        
    }
    
    $(document).ready(function(){
   		var str = $('#loaibaohiem').val();
   		if(str.indexOf('XE MÁY') != -1){
   			$("#sochongoi").hide();
   			$("#labelsochongoi").hide();
   		}
    });
    
</script>

</head>
<body style="background: #F5F5F5">
	<jsp:include page="header.jsp"></jsp:include>
	
	<h2 style="font-weight: bold; margin: auto; font-family: inherit; margin-bottom: -50px">THÔNG TIN MUA BẢO HIỂM</h2>    
	<div class="wthreeaddressaits">
        <div class="container">
          <!--   <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid1">
            </div> -->

            <div class="col-md-8 wthreeaddressaits-grid wthreeaddressaits-grid2">
                <s:form method="post" commandName="phieumuabaohiem" action="${pageContext.request.contextPath }/baohiem/buy.html">
                    <!-- <input type="hidden" class="text" name="IDInsurrance" placeholder="" value="" >
                    <input type="hidden" class="text" name="Email" placeholder="" value=""> -->
                    <!-- <input type="text" class="text" name="InsurranceType" placeholder="Loại bảo hiểm" id="InsurranceType" readonly="readonly" > -->
                   <div class="col-md-6">
	                   <s:input path="mabaohiem" id="mabaohiem" type="hidden" value="${baohiem.id }" readonly="readonly" />
	                   <p style="color: #000; display: inline;">Loại bảo hiểm</p><span style="color: red; float: right;" id="errorloaibaohiem"></span>
					   <input type="text" id="loaibaohiem" name="loaibaohiem" value="${baohiem.loaibaohiem }" readonly="readonly" />
                   	   <p style="color: #000; display: inline;">Phí bảo hiểm</p>
					   <input type="text" id="dongia" name="dongia" value="${baohiem.dongia }" readonly="readonly" />
                   </div>
                   <div class="col-md-6">
	                   <p style="color: #000; display: inline;">Biển số</p><span style="color: red; float: right;" id="errorbienso2"></span>
					   <s:input path="bienso" id="bienso2" name="bienso" placeholder="Biển số" />
					   <p id="labelsochongoi" style="color: #000; display: inline;">Chọn số chỗ ngồi</p><span style="color: red; float: right;" id="errorsochongoi"></span>
	                    <select id="sochongoi" name="sochongoi" class="form-control selectpicker"  style="background: #000; color: #fff;border-radius: 0px ; height: 45px; font-size: 13px; border: 1px solid #000; margin-bottom: 20px">
	                          <!-- <option value="Chọn số chỗ ngồi" >Chọn</option> -->
	                          <option value="Xe dưới 6 chỗ" >Xe dưới 6 chỗ</option>
	                          <option value="Xe từ 6 đến 11 chỗ">Xe từ 6 đến 11 chỗ</option>
	                          <option value="Xe từ 12 đến 24 chỗ">Xe từ 12 đến 24 chỗ</option>
	                          <option value="Xe trên 24 chỗ">Xe trên 24 chỗ</option>
	                    </select>
	                    <p style="color: #000; display: inline;">Chọn thời hạn</p><span style="color: red; float: right;" id="errorthoihan"></span>
	                    <select id="thoihan" name="thoihan" class="form-control selectpicker" onchange="CountTime()" style="background: #000; color: #fff;border-radius: 0px ; height: 45px; font-size: 12px; border: 1px solid #000">
	                          <option value="Chọn thời hạn" >Chọn</option>
	                          <option value="6" >6 tháng</option>
	                          <option value="12" >1 năm</option>
	                          <option value="24" >2 năm</option>
	                          <option value="36" >3 năm</option>
	                          <option value="60" >5 năm</option>
	                    </select>
	                    <br>
	                    
	                    <div class="send-button wthree agileits">
	                    	<input type="submit" value="XÁC NHẬN MUA" onclick="return CheckValidateBuyInsurrance();">
	                	</div>
				   	</div>
                </s:form>
            </div>
             <div class="col-md-4 wthreeaddressaits-grid wthreeaddressaits-grid1" style="width: 260px; float: right; margin-top: 150px; text-align: right;">
                    <h4 style="font-weight: bold;">PHÍ VAT (10%)</h4>
                    <p id="VAT" style="font-weight: bold; font-size: 20px"></p>
                    <hr>
                     <h4 style="font-weight: bold;">TỔNG PHÍ THỰC THU</h4>
                    <p id="Sum" style="font-weight: bold; font-size: 20px"></p>
                    
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