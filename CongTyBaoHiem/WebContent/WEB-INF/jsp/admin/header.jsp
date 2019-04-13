<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon shortcut" href="${pageContext.request.contextPath }/icon/logo.png">
<title>Bán bảo hiểm trực tuyến</title>

</head>
<body>
	<!--Header-part-->
	<div id="header">
		<p style="color: #C41228; font-size: 28px; font-weight: bold; padding: 12px 0 0 40px">BẢO HIỂM</p>
 		<img alt="" src="${pageContext.request.contextPath }/icon/logo.png"style="padding: 0 0 0 50px;"> 
	</div>
	<!--close-Header-part--> 
	
	
	<!--top-Header-menu-->
	<div id="user-nav" class="navbar navbar-inverse">
	  <ul class="nav">
	    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i> <span class="text" style="color: yellow; font-weight: bold"> ${sessionScope.hotencuataikhoanadmin }</span><b class="caret"></b></a>
	      <ul class="dropdown-menu">
	        <li><a href="${pageContext.request.contextPath }/baohiem/changeprofileadmin.html"><i class="icon-user"></i> Thông tin cá nhân</a></li>
	        <li class="divider"></li>
	        <li><a href="${pageContext.request.contextPath }/baohiem/logoutadmin.html" onclick="return confirm('Bạn có chắc muốn đăng xuất không ?')"><i class="icon icon-share-alt"></i> Đăng xuất</a></li>
	      </ul>
	    </li>
	    <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">Messages</span> <span class="label label-important">5</span> <b class="caret"></b></a>
	      <ul class="dropdown-menu">
	        <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> Tin nhắn</a></li>
	        <li class="divider"></li>
	        <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> Tin nhắn đến</a></li>
	        <li class="divider"></li>
	        <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> Tin nhắn đi</a></li>
	        <li class="divider"></li>
	        <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> Thùng rác</a></li>
	      </ul>
	    </li>
	  		<li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">Cài đặt</span></a></li>
	  </ul>
	</div>
	<!--close-top-Header-menu-->
	<!--start-top-serch-->
	<div id="search">
	   <a title="" href="${pageContext.request.contextPath }/baohiem/logoutadmin.html" onclick="return confirm('Bạn có chắc muốn đăng xuất không ?')"><i class="icon icon-share-alt"></i> <span class="text">Đăng xuất</span></a>
	</div>
	<!--close-top-serch-->
</body>
</html>