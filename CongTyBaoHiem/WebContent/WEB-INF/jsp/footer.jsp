<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="m" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon shortcut" href="${pageContext.request.contextPath }/icon/logo.png">
<title>Bán bảo hiểm trực tuyến</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mystyle.css" type="text/css" media="all">
</head>
        

<body>
    <!-- Footer -->
    <div class="agileinfofooter">
        <div class="agileinfofooter-grids">

            <div class="col-md-4 agileinfofooter-grid agileinfofooter-grid1">
                <ul>
             		<c:if test="${sessionScope.tendangnhap != null}">
                    <li><a href="#"><m:message code="declare"></m:message></a></li>
                    <li><a href="${pageContext.request.contextPath }/baohiem/listdeclare.html"><m:message code="listdeclare"></m:message></a></li>
                    <li><a href="${pageContext.request.contextPath }/baohiem/listbuyinsurrance.html"><m:message code="listbuyinsurrance"></m:message></a></li>
                  	</c:if>
                </ul>
            </div>

            <div class="col-md-4 agileinfofooter-grid agileinfofooter-grid2">
                <ul>
                    <li><a href="${pageContext.request.contextPath }/baohiem/introduce.html"><m:message code="introduce"></m:message></a></li>
                    <li><a href="${pageContext.request.contextPath }/baohiem/guide.html"><m:message code="guide"></m:message></a></li>
                    <li><a href="${pageContext.request.contextPath }/baohiem/contact.html"><m:message code="contact"></m:message></a></li>
                    <li><a href="${pageContext.request.contextPath }/baohiem/payment.html"><m:message code="payment"></m:message></a></li>
                </ul>
            </div>

            <div class="col-md-4 agileinfofooter-grid agileinfofooter-grid3">
                    <ul>
                        <li>FPT Software Đà Nẵng</li>
                        <li>Tầng 2 tòa nhà FPT - Complex</li>
                        <li>TP Đà Nẵng</li>
                        <li>+1 (734) 123-4567</li>
                        <li><a class="mail" href="https://mail.google.com/" target="=_blank">nguyendangtinhdx@gmail.com</a></li>
                    </ul>
            </div>
            <div class="clearfix"></div>

        </div>
    </div>
    <!-- //Footer -->
    
     <!-- scroll-->
    <script type='text/javascript'>
        $(function() {
            $(window).scroll(function() // sự kiện lăn chuột
            {
                if ($(this).scrollTop() != 0) {
                    $('#bttop').fadeIn();// khai báo 1 biến bttop
                } else {
                    $('#bttop').fadeOut();
                }
            });
            $('#bttop').click(function()// bắt sự kiện khi click vào nút
            { 
                $('body,html').animate({
                    scrollTop: 0
                }, 800); // thời gian di chuyển về đầu trang
            });
        });
    </script>
    <!-- scroll-->

    <div id='bttop'><img alt="" src="${pageContext.request.contextPath }/icon/icon_top.gif" height="50" width="10"></div>

     <jsp:include page="countaccess.jsp"></jsp:include>

    <!-- Copyright -->
    <div class="w3lscopyrightaits">
        <div class="col-md-8 w3lscopyrightaitsgrid w3lscopyrightaitsgrid1">
            <p>© <m:message code="copyright"></m:message> <a href="https://www.facebook.com/nguyendangtinhdx.BI" target="=_blank"> Nguyễn Đăng Tỉnh - nguyendangtinhdx@gmail.com </a></p>
        </div>
        <div class="col-md-4 w3lscopyrightaitsgrid w3lscopyrightaitsgrid2">
            <div class="agilesocialwthree">
                <ul class="social-icons">
                    <li><a href="#" class="facebook w3ls" title="Go to Our Facebook Page"><i class="fa w3ls fa-facebook-square" aria-hidden="true"></i></a></li>
                    <li><a href="#" class="twitter w3l" title="Go to Our Twitter Account"><i class="fa w3l fa-twitter-square" aria-hidden="true"></i></a></li>
                    <li><a href="#" class="googleplus w3" title="Go to Our Google Plus Account"><i class="fa w3 fa-google-plus-square" aria-hidden="true"></i></a></li>
                    <li><a href="#" class="instagram wthree" title="Go to Our Instagram Account"><i class="fa wthree fa-instagram" aria-hidden="true"></i></a></li>
                    <li><a href="#" class="youtube w3layouts" title="Go to Our Youtube Channel"><i class="fa w3layouts fa-youtube-square" aria-hidden="true"></i></a></li>
                </ul>
            </div>
        </div>
        <div class="clearfix"></div>

    </div>
    <!-- //Copyright -->
         
    
     <!-- chat online -->
    <script type='text/javascript'>window._sbzq||function(e){e._sbzq=[];var t=e._sbzq;t.push(["_setAccount",76472]);var n=e.location.protocol=="https:"?"https:":"http:";var r=document.createElement("script");r.type="text/javascript";r.async=true;r.src=n+"//static.subiz.com/public/js/loader.js";var i=document.getElementsByTagName("script")[0];i.parentNode.insertBefore(r,i)}(window);</script>


</body>
</html>