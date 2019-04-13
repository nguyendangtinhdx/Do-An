<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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

	function validateMoneyPayment() {
	    var a = document.getElementById("money").value;
	    if (a != 0) {
	        document.getElementById("errorthanhtoan").innerHTML="";
	        return true;
	    }
	    else {
	        document.getElementById("errorthanhtoan").innerHTML="Bạn không có bảo hiểm nào cần thanh toán !";
	        return false;
	    }
	}

	function CheckValidateGotoPaymentPage(){
	    if(!validateMoneyPayment()){
	        return false;
	    }
	}

</script>
</head>

<body style="background: #F5F5F5">
    <jsp:include page="header.jsp"></jsp:include>
    
     <h2 style="margin-bottom: -50px;font-weight: bold; font-family: inherit;">DANH SÁCH BẢO HIỂM ĐÃ MUA</h2> 
    
    <div class="clearfix"></div>
    
    <div class="wthreeaddressaits">
        <div class="container">

            <div class="col-md-12 ">
            

                  <table class="table table-dark table-hover">
                        <thead>
                            <tr>
                                <th>Loại bảo hiểm</th>
                                <th>Biển số</th>
                          <!--       <th>Số chỗ ngồi</th> -->
                                <th>Thời hạn</th>
                                <th>Ngày mua</th>
                                <th>Ngày hết hạn</th>
                                <th>Gói bảo hiểm</th>
                                <th>Số tiền thực thu</th>
                                <th>Trạng thái thanh toán</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:set var="sum" value="${0}"/>
							<c:forEach var="phieumuabaohiem" items="${danhsachphieumuabaohiem }">
	                            <tr>
	                            	<td>${phieumuabaohiem.loaibaohiem }</td>
	                                <td>${phieumuabaohiem.bienso }</td>
	                               <%--  <td>${phieumuabaohiem.sochongoi }</td> --%>
                                	<td>${phieumuabaohiem.thoihan / 12 } năm</td>
	                                <td><fmt:formatDate pattern="dd/MM/yyyy hh:mm:ss" value = "${phieumuabaohiem.ngaymua }" /></td>
	                                <td><fmt:formatDate pattern="dd/MM/yyyy hh:mm:ss" value = "${phieumuabaohiem.ngayhethan }" /></td>
	                                <td><fmt:formatNumber pattern="#,##0" value="${phieumuabaohiem.goibaohiem }" /> VND</td>
	                                <td><fmt:formatNumber pattern="#,##0" value="${phieumuabaohiem.sotienthucthu }" /> VND</td>
	                                <td>${phieumuabaohiem.trangthaithanhtoan }</td>
	                             	<c:if test="${phieumuabaohiem.trangthaithanhtoan == 'Chưa thanh toán' }">
		                               	<c:set var="sum" value="${sum + phieumuabaohiem.sotienthucthu}" />
		                               	<td><a href="${pageContext.request.contextPath }/baohiem/deletelistbuyinsurrance/${phieumuabaohiem.id }.html" onclick="return confirm('Bạn có chắc muốn xóa không ?')"><i style="color: #C41228; font-size: 20px" class="fa fa-times"></i></a></td>
	                                </c:if>
	                                <c:if test="${phieumuabaohiem.trangthaithanhtoan != 'Chưa thanh toán' }">
	                                </c:if>
	                            </tr>
 							</c:forEach>

                        </tbody>
                    </table>
            </div>

            <div class="row">
                <div class="col-sm-8"></div>
                <div class="col-sm-4">
                    <h4 style="float: right; font-weight: bold;">TỔNG TIỀN THỰC THU</h4>
                    <br>
                    <%-- ${danhsachphieumuabaohiem.stream().map(phieumuabaohiem -> phieumuabaohiem.sotienthucthu).sum()} // tính tổng --%>
                    <p style="font-weight: bold;float: right; font-size: 20px"><fmt:formatNumber pattern="#,##0" value="${sum }" /> VND</p>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-sm-8">
                	<span style="color: red; font-size: 20px" id="errorthanhtoan"></span>
                </div>
                <div class="col-sm-4">
                	<s:form method="post" commandName="phieumuabaohiem" action="${pageContext.request.contextPath }/baohiem/gotopayment.html">
                		<input type="hidden" id="money" name="money" value="${sum }" readonly="readonly" />
                		<input type="submit" value="THANH TOÁN" onclick="return CheckValidateGotoPaymentPage();">
                	</s:form>
                </div>
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