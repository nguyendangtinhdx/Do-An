<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
</head>
<body style="background: #F5F5F5">
    <jsp:include page="header.jsp"></jsp:include>

	<h2 style="font-weight: bold; margin: auto; font-family: inherit;">HƯỚNG DẪN</h2>    
	
    <!-- About-Us -->
    <div class="wthreeabout">
        <div class="about-us-grids">
            <div class="col-md-6 about-us-grid about-us-images">
                <div class="col-md-6 about-us-image about-us-image1">
                    <img src="${pageContext.request.contextPath }/img/oto-ghep-1.jpg" alt="Groovy Apparel" height="200" width="200">
                </div>
                <div class="col-md-6 about-us-image about-us-image2">
                    <img src="${pageContext.request.contextPath }/img/oto-ghep-2.jpg" alt="Groovy Apparel" height="200" width="200">
                </div>
                <div class="col-md-6 about-us-image about-us-image3">
                    <img src="${pageContext.request.contextPath }/img/oto-ghep-3.jpg" alt="Groovy Apparel" height="200" width="200">
                </div>
                <div class="col-md-6 about-us-image about-us-image3">
                    <img src="${pageContext.request.contextPath }/img/oto-ghep-4.jpg" alt="Groovy Apparel" height="200" width="200">
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="col-md-6 about-us-grid about-us-text">
            	<c:forEach var="danhsachtintuc" items="${danhsachtintuckhuyenmai }">
                <h1>${danhsachtintuc.tieude }</h1>
                <p>${danhsachtintuc.noidung }</p>
            	</c:forEach>
             <div id="fb-root"></div>
                <script>(function(d, s, id) {
                  var js, fjs = d.getElementsByTagName(s)[0];
                  if (d.getElementById(id)) return;
                  js = d.create Element(s); js.id = id;
                  js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.12&appId=860333777447491&autoLogAppEvents=1';
                  fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));</script>
                <div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-numposts="5"></div>
            
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //About-Us -->


    <jsp:include page="subcribe.jsp"></jsp:include>
    
    <jsp:include page="footer.jsp"></jsp:include>
</body>


  <jsp:include page="script.jsp"></jsp:include>


</html>