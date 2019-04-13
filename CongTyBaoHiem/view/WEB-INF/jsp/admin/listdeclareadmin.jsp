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
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/uniform.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/select2.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/matrix-style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/matrix-media.css" />
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
			</div>
			
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					
					<div class="control-group" style="float: right;">
			             <div class="controls">
			               <s:form method="post" commandName="hosotainan" action="${pageContext.request.contextPath }/baohiem/searchdeclareadmin.html">
			               <div class="input-prepend"> 
			                 <input name="keydeclareadmin" type="text" placeholder="Từ khóa..." class="span11" style="width: 160px">
			                 <input type="submit" value="Tìm kiếm" class="btn btn-inverse">
			               </div>
			                 </s:form>
			             </div>
		           	</div>
					
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"><i class="icon-th"></i></span>
							<h5>Danh sách hồ sơ tai nạn</h5>
						</div>
						<div class="widget-content nopadding">
							<table class="table table-bordered data-table">
								<thead>
									<tr>
										<th>STT</th>
										<th>Biển số</th>
										<th>Ngày tai nạn</th>
										<th>Tên tài xế</th>
										<th>Có bằng lái xe</th>
										<th>Địa điểm tai nạn</th>
										<th>Thiệt hại</th>
										<th>Mức độ đền bù</th>
										<th>Số tiền đền bù</th>
										<th>Lý do</th>
										<th>Xác nhận đền bù</th>
										<th width="150">Tùy chọn</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="hosotainan" items="${danhsachhosotainan }">
									<tr class="gradeX">
										<c:set var="stt" value="${stt + 1}" />
										<td>${stt }</td>
										<td>${hosotainan.bienso }</td>
		                                <td><fmt:formatDate pattern="dd/MM/yyyy" value = "${hosotainan.ngaytainan }"  /></td>
		                                <td>${hosotainan.tentaixe }</td>
		                                <c:if test="${hosotainan.cobanglaixe == true }">
		                                	<td>Có</td>
		                                </c:if>
		                                <c:if test="${hosotainan.cobanglaixe == false }">
		                                	<td>Chưa</td>
		                                </c:if>
		                                <td>${hosotainan.diadiemtainan }</td>
		                                <td>${hosotainan.motathiethai }</td>
		                                <c:if test="${hosotainan.mucdodenbu == null }">
		                                	<td></td>
		                                </c:if>
		                                <c:if test="${hosotainan.mucdodenbu != null }">
			                                <td>${hosotainan.mucdodenbu } %</td>
		                                </c:if>
		                                <td><fmt:formatNumber pattern="#,##0" value="${(hosotainan.mucdodenbu/100 * hosotainan.sotiendenbu) + (hosotainan.mucdodenbu/100 * hosotainan.sotiendenbu)*((hosotainan.thoihan*2/12)/10) }" /> VND</td>
		                                <td>${hosotainan.lydo}</td>
										<td>${hosotainan.xacnhandenbu}</td>
										<td>
											<a href="${pageContext.request.contextPath }/baohiem/viewdeclareadmin/${hosotainan.id }.html" class="btn btn-info btn-mini">Xem</a> 
										   	<c:if test="${hosotainan.xacnhandenbu == 'Đang chờ xác nhận...' }">
												<a href="${pageContext.request.contextPath }/baohiem/confirmdeclareadmin/${hosotainan.id }.html" class="btn btn-warning btn-mini">Giám định</a> 
			                                </c:if>
			                                <c:if test="${hosotainan.xacnhandenbu != 'Đang chờ xác nhận...' }">
			                                	<a href="${pageContext.request.contextPath }/baohiem/confirmdeclareadmin/${hosotainan.id }.html" class="btn btn-warning btn-mini">Giám định lại</a>
			                                </c:if>
											<a href="${pageContext.request.contextPath }/baohiem/deletedeclareadmin/${hosotainan.id }.html" class="btn btn-danger btn-mini" onclick="return confirm('Bạn có chắc muốn xóa không ?')">Xóa</a>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
    
</body>


<script src="${pageContext.request.contextPath }/admin/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/jquery.ui.custom.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/jquery.uniform.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/select2.min.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/jquery.dataTables.min.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/matrix.js"></script> 
<script src="${pageContext.request.contextPath }/admin/js/matrix.tables.js"></script> 

<jsp:include page="script.jsp"></jsp:include>
    
</html>