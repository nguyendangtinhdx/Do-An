<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="m" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bán bảo hiểm trực tuyến</title>


</head>
<body>
	<div class="col-md-8">
            <!-- Model-Slider -->
       <%--  <div class="agilemodel-slider">
            <div id='film_roll_1'>
                <div><img src="${pageContext.request.contextPath }/img/slide-oto.jpg" height="300"></div>
                <div><img src="${pageContext.request.contextPath }/img/slide-moto.jpg" alt="moto" height="300"></div>
                <div><img src="${pageContext.request.contextPath }/img/slide-moto2.jpg" alt="moto" height="300"></div>
    
            </div>
        </div> --%>
        <!-- //Model-Slider -->
        <div id="games" style=" margin: auto;">
			<c:forEach var="danhsachtintuc" items="${danhsachtintucslide }">
			<c:set var="stt" value="${stt + 1}" />
			<img src="${pageContext.request.contextPath }/img/slide/${danhsachtintuc.anh }">
			<c:if test="${stt % 2 == 0}">
				<span>
					<b>${danhsachtintuc.tieude }</b><br />
					${danhsachtintuc.noidung }
				</span>
			</c:if>
			</c:forEach>
		</div>
		<script>
			$('#games').coinslider();
		</script>
        
    </div>
    <div class="col-md-4">
    
	    <marquee direction="down" onmouseover="this.stop()" onmouseout="this.start()"  style="height: 290px;">
	    	<%-- <c:forEach var="danhsachtintuc" items="${danhsachtintucgioithieu }"> --%>
	       <%--  <div class="col-md-6" >
	           <a href="${pageContext.request.contextPath }/baohiem/${danhsachtintuc.duongdan }"><img src="${pageContext.request.contextPath }/img/${danhsachtintuc.anh }" height="120" width="100" style="margin-bottom:  20px"></a>
	        </div>
	        <div class="col-md-6" >
	            <a href="${pageContext.request.contextPath }/baohiem/${danhsachtintuc.duongdan }"><b style="color: #C41228">${danhsachtintuc.tieude }</b></a>
	            <a href="${pageContext.request.contextPath }/baohiem/${danhsachtintuc.duongdan }"><p>${danhsachtintuc.noidung }</p></a>
	        </div> --%>
	        <div class="col-md-6" >
	           <a href="${pageContext.request.contextPath }/baohiem/introduce.html"><img src="${pageContext.request.contextPath }/img/slide.jpg" height="120" width="100" style="margin-bottom:  20px"></a>
	        </div>
	        <div class="col-md-6" >
	            <a href="${pageContext.request.contextPath }/baohiem/introduce.html"><b style="color: #C41228"><m:message code="titleintroduce1"></m:message></b></a>
	            <a href="${pageContext.request.contextPath }/baohiem/introduce.html"><p><m:message code="contentintroduce1"></m:message></p></a>
	        </div>
	        
	        <div class="col-md-6" >
	           <a href="${pageContext.request.contextPath }/baohiem/guide.html"><img src="${pageContext.request.contextPath }/img/slide2.jpg" height="120" width="100" style="margin-bottom:  20px"></a>
	        </div>
	        <div class="col-md-6" >
	            <a href="${pageContext.request.contextPath }/baohiem/guide.html"><b style="color: #C41228"><m:message code="titleintroduce2"></m:message></b></a>
	            <a href="${pageContext.request.contextPath }/baohiem/guide.html"><p><m:message code="contentintroduce2"></m:message></p></a>
	        </div>
	        
	        <div class="col-md-6" >
	           <a href="${pageContext.request.contextPath }/baohiem/contact.html"><img src="${pageContext.request.contextPath }/img/slide3.jpg" height="120" width="100" style="margin-bottom:  20px"></a>
	        </div>
	        <div class="col-md-6" >
	            <a href="${pageContext.request.contextPath }/baohiem/contact.html"><b style="color: #C41228"><m:message code="titleintroduce3"></m:message></b></a>
	            <a href="${pageContext.request.contextPath }/baohiem/contact.html"><p><m:message code="contentintroduce3"></m:message></p></a>
	        </div>
	       <%--  </c:forEach> --%>
	        <div class="clearfix"></div>
	    </marquee>
    
    </div>
    

</body>
</html>