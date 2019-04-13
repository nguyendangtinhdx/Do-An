<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="m" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bán bảo hiểm trực tuyến</title>
</head>

<body>

	<jsp:include page="slide.jsp"></jsp:include>
	 
	 <c:if test="${not empty demsoluongtimkiem} "> 
		<b style="font-size: 15px; margin-left: 120px; color: #000">Tìm thấy <span style="color: #C41228;">${demsoluongtimkiem }</span> kết quả với từ khóa <span style="color: #C41228"><%=request.getParameter("key") %></span></b>
	 </c:if> 
	 <!-- Latest-Arrivals -->
	<div class="wthreehome-latest">
		<div class="container">

			<div class="wthreehome-latest-grids">
				<c:forEach var="baohiem" items="${danhsachbaohiem }">
				<div class="col-md-6 wthreehome-latest-grid wthreehome-latest-grid1" >
					<div class="w3laccessoriesaits-grid w3laccessoriesaits-grid1">
						<div class="grid">
							<figure class="effect-apollo">
								<img src="${pageContext.request.contextPath }/img/${baohiem.anh }" alt="" height="300">
								<figcaption></figcaption>
							</figure>
						</div>
						<h4>
		                	<span style="font-weight: bold;">${baohiem.loaibaohiem } - </span>
		                	<span style="margin-top: 7px; color: #C41228; display: inline; font-weight: bold;"><fmt:formatNumber pattern="#,##0" value="${baohiem.dongia }" /></span>
		                	<span> VND</span>
	                    </h4>
	                    <div style="text-align: center;">
	                    <h5 style="display: inline;"><a href=".${baohiem.id }" class="btn btn-default popup-with-zoom-anim" style="margin: 18px 30px 20px 0"><i class="fa fa-eye"></i> <m:message code="seedetail"></m:message></a></h5>
	                   	<h6 style="display: inline;"><a style="text-decoration: none" href="${pageContext.request.contextPath }/baohiem/buy.html?id=${baohiem.id }" ><m:message code="order"></m:message></a></h6>
						</div>
					</div>
					
					<!-- Popup-Box -->
	                <div id="popup1">
	                    <div id="small-dialog3" class="mfp-hide ${baohiem.id }" style="width: 500px">
	                        <div class="pop_up">
	                                <h3 style="font-weight: bold;"><m:message code="detail"></m:message></h3>
	                                <hr>
	     							<p>${baohiem.mota }</p>
	                        </div>
	                    </div>
	                </div>
	                <!-- //Popup-Box -->
					
				</div>
				</c:forEach>
				
			</div>
			<div class="clearfix"></div>

		</div>
	</div>
	<!-- //Latest-Arrivals -->



	 <!-- Clearance-Sale -->
    <div class="aitsclearance-sales">
        <div class="aitsclearance-sales-text">
            <h2><m:message code="newspromotion"></m:message></h2>
            <c:forEach var="danhsachtintuc" items="${danhsachtintuckhuyenmai }">
            <h4>${danhsachtintuc.tieude }</h4>
            <h5>50% OFF</h5>
            <div class="wthreeshop-a">
                <a href="${pageContext.request.contextPath }/baohiem/${danhsachtintuc.duongdan }"><m:message code="seemore"></m:message></a>
            </div>
            </c:forEach>
        </div>
    </div>
    <!-- //Clearance-Sale -->



    <!-- Shopping -->
    <div class="agileshopping">
        <div class="container">

            <div class="agileshoppinggrids">
            	<c:forEach var="danhsachtintuc" items="${danhsachtintuchuongdan }">
                <div class="col-md-4 agileshoppinggrid agileshoppinggrid1">
                    <div class="grid">
                        <figure class="effect-apollo">
                            <img src="${pageContext.request.contextPath }/img/${danhsachtintuc.anh }" alt="Groovy Apparel" height="250">
                            <figcaption></figcaption>
                        </figure>
                    </div>
                </div>
               </c:forEach>
                <div class="clearfix"></div>
            </div>

            <div style="margin-left: 0px">
                <div>
                	<c:forEach var="danhsachtintuc" items="${danhsachtintuchuongdan }">
                    <div class="col-md-4 " >
                        <h3 style="padding: 10px 0">${danhsachtintuc.tieude }</h3>
                        <p>${danhsachtintuc.noidung }</p>
                    </div>
                  	</c:forEach>
                    <div class="clearfix"></div>
                </div>
            </div>

        </div>
    </div>
    <!-- //Shopping -->



    <!-- Newsletter -->
    <div class="agileinfonewsl">
		<c:forEach var="danhsachtintuc" items="${danhsachtintuchotro }">
        <h3>${danhsachtintuc.tieude }</h3>
        <p>${danhsachtintuc.noidung }</p>
		</c:forEach>

    </div>
    <!-- //Newsletter -->
	 


</body>
</html>