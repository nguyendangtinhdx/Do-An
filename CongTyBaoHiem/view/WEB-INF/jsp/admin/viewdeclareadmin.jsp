<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="icon shortcut" href="${pageContext.request.contextPath }/icon/logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/colorpicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/datepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/uniform.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/select2.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/matrix-style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/matrix-media.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/bootstrap-wysihtml5.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/font-awesome/css/font-awesome.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<title>Bán bảo hiểm trực tuyến</title>
</head>

<body>

 	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${pageContext.request.contextPath }/baohiem/admin.html" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i> Trang chủ</a> 
				<a href="${pageContext.request.contextPath }/baohiem/listdeclareadmin.html" class="current">Hồ sơ tai nạn</a>
				<a href="#" class="current">Xem hồ sơ tai nạn</a>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span3">
				</div>
				<div class="span6">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-align-justify"></i>
							</span>
							<h5>Xem hồ sơ tai nạn</h5>
						</div>
						<div class="widget-content nopadding">
							<s:form method="post" commandName="hosotainan" action="${pageContext.request.contextPath }/baohiem/confirmdeclareadmin.html" class="form-horizontal">
								<div class="control-group">
									<label class="control-label">Mã bảo hiểm</label>
									<div class="controls">
										<input id="mabaohiem" name="mabaohiem" type="text" class="span11" placeholder="Mã bảo hiểm" value="${mabaohiem }" disabled="disabled"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Mã tài khoản</label>
									<div class="controls">
										<input id="mataikhoan" name="mataikhoan" type="text" class="span11" placeholder="Mã tài khoản" value="${mataikhoan }" disabled="disabled" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Mã phiếu mua bảo hiểm</label>
									<div class="controls">
										<input id="maphieumuabaohiem" name="maphieumuabaohiem" type="text" class="span11" placeholder="Mã phiếu mua bảo hiểm" value="<fmt:formatNumber pattern="#,##0" value="${maphieumuabaohiem }" />" disabled="disabled"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Thời hạn (tháng)</label>
									<div class="controls">
										<s:input path="thoihan" id="thoihan" name="thoihan" type="number" min="1" max="1200" class="span11" placeholder="Thời hạn" readonly="true"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Biển số</label>
									<div class="controls">
										<s:input path="bienso" id="bienso" name="bienso" type="text" class="span11" placeholder="Biển số" readonly="true"/>
									</div>
								</div>
								<div class="control-group">
					              	<label class="control-label">Ngày tai nạn</label>
					              	<div class="controls">
										<fmt:formatDate value="${ngaytainan}" var="dateString" pattern="dd/MM/yyyy" />              			
					                	<s:input path="ngaytainan" id="ngaytainan" name="ngaytainan" type="text" value="${dateString}" class="datepicker span11" readonly="true"/>
					                </div>
					            </div>
								<div class="control-group">
									<label class="control-label">Tên tài xế</label>
									<div class="controls">
										<s:input path="tentaixe" id="tentaixe" name="tentaixe" type="text" class="span11" placeholder="Tên tài xế" readonly="true"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Có bằng lái xe</label>
									<div class="controls">
										<label> <s:radiobutton path="cobanglaixe" name="cobanglaixe" value="true" disabled="true"/>Có</label> 
										<label> <s:radiobutton path="cobanglaixe" name="cobanglaixe" value="false" disabled="true"/> Chưa</label> 
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Địa điểm tai nạn</label>
									<div class="controls">
										<s:input path="diadiemtainan" id="diadiemtainan" name="diadiemtainan" type="text" class="span11" placeholder="Địa điểm tai nạn" readonly="true"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Mô tả thiệt hại</label>
									<div class="controls">
										<s:textarea path="motathiethai" id="motathiethai" name="motathiethai" class="span11" style="height: 100px" readonly="true"/>
									</div>
								</div>
								<div class="form-actions" style="text-align: center;">
									<a href="${pageContext.request.contextPath }/baohiem/listdeclareadmin.html" class="btn btn-info">Quay lại</a>
								</div>
							</s:form>
						</div>
					</div>
				</div>
				<div class="span3">
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
    
</body>



<script src="${pageContext.request.contextPath }/admin/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/jquery.ui.custom.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/bootstrap-colorpicker.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/bootstrap-datepicker.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/jquery.toggle.buttons.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/masked.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/jquery.uniform.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/select2.min.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/matrix.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/matrix.form_common.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/wysihtml5-0.3.0.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/jquery.peity.min.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/bootstrap-wysihtml5.js"></script> 


<jsp:include page="script.jsp"></jsp:include>
    
</html>