<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon shortcut" href="${pageContext.request.contextPath }/icon/logo.png">
<title>Bán bảo hiểm trực tuyến</title>
</head>
<body>
		
	<!--main-container-part-->
	<div id="content">
	<!--breadcrumbs-->
	  <div id="content-header">
	    <div id="breadcrumb"> <a href="${pageContext.request.contextPath }/baohiem/admin.html" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i> Trang chủ</a></div>
	  </div>
	<!--End-breadcrumbs-->
	
	<!--Action boxes-->
	  <div class="container-fluid">
	    <div class="quick-actions_homepage">
	      <ul class="quick-actions">
	        <li class="bg_ly"> <a href="${pageContext.request.contextPath }/baohiem/listinsurranceadmin.html"> <i class="icon-inbox"></i> Bảo hiểm </a> </li>
	        <li class="bg_lo"> <a href="${pageContext.request.contextPath }/baohiem/listbuyinsurranceadmin.html"> <i class="icon-hdd"></i><span class="label label-success">${demphieumuabaohiemchuaxacnhanthanhtoan }</span> Phiếu mua bảo hiểm</a> </li>
	        <li class="bg_lb"> <a href="${pageContext.request.contextPath }/baohiem/listdeclareadmin.html"> <i class="icon-file"></i><span class="label label-success">${demhsotainanchuaxacnhandenbu }</span> Hồ sơ tai nạn </a> </li>
	        <li class="bg_ls"> <a href="${pageContext.request.contextPath }/baohiem/listaccountadmin.html"> <i class="icon-pencil"></i> Tài khoản</a> </li>
	        <li class="bg_lg"> <a href="${pageContext.request.contextPath }/baohiem/listnewsadmin.html"> <i class="icon-th-list"></i> Tin tức</a> </li>
	        <li class="bg_lr"> <a href="${pageContext.request.contextPath }/baohiem/listaccidentadmin.html"> <i class="icon-signal"></i><span class="label label-success">20</span> Thống kê</a> </li>
	
	      </ul>
	    </div>
	<!--End-Action boxes-->    
	
	<!--Chart-box-->    
	    <div class="row-fluid">
	      <div class="widget-box">
	        <div class="widget-title bg_lg"><span class="icon"><i class="icon-signal"></i></span>
	          <h5>Thống kê</h5>
	        </div>
	        <div class="widget-content" >
	          <div class="row-fluid">
	            <div class="span9">
	              <div class="chart"></div>
	            </div>
	            <div class="span3">
	              <ul class="site-stats">
	                <li class="bg_lh"><i class="icon-user"></i> <strong>20</strong> <small>Người dùng</small></li>
	                <li class="bg_lh"><i class="icon-plus"></i> <strong>12</strong> <small>Người dùng mới</small></li>
	                <li class="bg_lh"><i class="icon-shopping-cart"></i> <strong>6</strong> <small>Cửa hàng</small></li>
	                <li class="bg_lh"><i class="icon-tag"></i> <strong>25</strong> <small>Đơn đặt hàng</small></li>
	                <li class="bg_lh"><i class="icon-repeat"></i> <strong>10</strong> <small>Cấp phát đơn đặt hàng</small></li>
	                <li class="bg_lh"><i class="icon-globe"></i> <strong>24</strong> <small>Đơn hàng trực tuyến</small></li>
	              </ul>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	<!--End-Chart-box--> 
	    <hr/>
	  </div>
	</div>
	
	<!--end-main-container-part-->
	
</body>
</html>