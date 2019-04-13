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
				<a href="${pageContext.request.contextPath }/baohiem/listbuyinsurranceadmin.html" class="current">Phiếu mua bảo hiểm</a>
			</div>
			
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					
					<div class="control-group" style="float: right;">
			             <div class="controls">
			               <s:form method="post" commandName="phieumuabaohiem" action="${pageContext.request.contextPath }/baohiem/searchbuyinsurranceadmin.html">
			               <div class="input-prepend"> 
			                 <input name="keybuyinsurranceadmin" type="text" placeholder="Từ khóa..." class="span11" style="width: 160px">
			                 <input type="submit" value="Tìm kiếm" class="btn btn-inverse">
			               </div>
			                 </s:form>
			             </div>
		           	</div>
					
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"><i class="icon-th"></i></span>
							<h5>Danh sách phiếu mua bảo hiểm</h5>
						</div>
						<div class="widget-content nopadding">
							<table class="table table-bordered data-table">
								<thead>
									<tr>
										<th>STT</th>
										<th>Biển số</th>
										<th>Ngày mua</th>
										<th>Ngày hết hạn</th>
										<th>Thời hạn</th>
										<th>Gói bảo hiểm</th>
										<th>Số tiền thực thu</th>
										<th>Số tiền đã thanh toán</th>
										<th>Trạng thái thanh toán</th>
										<th>Tùy chọn</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="phieumuabaohiem" items="${danhsachphieumuabaohiem }">
									<tr class="gradeX">
										<c:set var="stt" value="${stt + 1}" />
										<td>${stt }</td>
										<td>${phieumuabaohiem.bienso }</td>
										<td><fmt:formatDate pattern="dd/MM/yyyy hh:mm:ss" value = "${phieumuabaohiem.ngaymua }" /></td>
	                                	<td><fmt:formatDate pattern="dd/MM/yyyy hh:mm:ss" value = "${phieumuabaohiem.ngayhethan }" /></td>
	                                	<td>${phieumuabaohiem.thoihan / 12 } năm</td>
										<td><fmt:formatNumber pattern="#,##0" value="${phieumuabaohiem.goibaohiem }" /> VND</td>
	                                	<td><fmt:formatNumber pattern="#,##0" value="${phieumuabaohiem.sotienthucthu }" /> VND</td>
	                                	<c:if test="${phieumuabaohiem.sotienthanhtoan == null }">
	                                		<td>0 VND</td>
		                                </c:if>
		                                <c:if test="${phieumuabaohiem.sotienthanhtoan != null }">
		                                	<td><fmt:formatNumber pattern="#,##0" value="${phieumuabaohiem.sotienthanhtoan }" /> VND</td>
		                                </c:if>
										<td>${phieumuabaohiem.trangthaithanhtoan }</td>
										<td>
											<c:if test="${phieumuabaohiem.trangthaithanhtoan == 'Đang chờ xác nhận...' }">
												<a href="${pageContext.request.contextPath }/baohiem/confirmpaymentadmin/${phieumuabaohiem.id }.html" class="btn btn-info btn-mini" onclick="return confirm('Bạn có chắc muốn xác nhận đã thanh toán không ?')">Xác nhận</a> 
		                                	</c:if>
		                                	<c:if test="${phieumuabaohiem.trangthaithanhtoan == 'Chưa thanh toán' }">
		                                		<a style="visibility: hidden;" href="${pageContext.request.contextPath }/baohiem/confirmpaymentadmin/${phieumuabaohiem.id }.html" class="btn btn-info btn-mini" onclick="return confirm('Bạn có chắc muốn xác nhận đã thanh toán không ?')">Xác nhận</a>
		                                	</c:if>
		                                	<c:if test="${phieumuabaohiem.trangthaithanhtoan == 'Đã thanh toán' }">
												<a href="${pageContext.request.contextPath }/baohiem/renewwbuyinsurranceadmin/${phieumuabaohiem.id }.html" class="btn btn-success btn-mini" data-toggle="modal" data-target=".${phieumuabaohiem.id }">Gia hạn</a>
										  			<!-- The Modal -->
													<div class="modal fade ${phieumuabaohiem.id }">
														<div class="modal-dialog modal-dialog-centered">
															<div class="modal-content">
																<!-- Modal Header -->
																<div class="modal-header">
																	<h4 class="modal-title">Gia hạn phiếu mua bảo hiểm: ${phieumuabaohiem.loaibaohiem } <br>Biển số: ${phieumuabaohiem.bienso }</h4>
																</div>
																<!-- Modal body -->
																<div class="modal-body">
																	<s:form action="${pageContext.request.contextPath }/baohiem/renewwbuyinsurranceadmin.html" commandName="danhsachphieumuabaohiem" method="post" class="form-horizontal">
																		<input id="id" name="id" value="${phieumuabaohiem.id }" type="hidden" placeholder=""/>
																		<div class="control-group">
																			<label class="control-label">Thời hạn</label>
																			<div class="controls">
																				<label> 
																					<input type="radio" name="thoihan" value="6" checked="checked"/> 6 tháng
																				</label> 
																				<label> 
																					<input type="radio" name="thoihan" value="12" /> 1 năm
																				</label>
																				<label> 
																					<input type="radio" name="thoihan" value="24" /> 2 năm
																				</label> 
																				<label> 
																					<input type="radio" name="thoihan" value="36" /> 3 năm
																				</label>
																				<label> 
																					<input type="radio" name="thoihan" value="60" /> 5 năm
																				</label> 
															              		<button type="submit" class="btn btn-success">Xác nhận gia hạn</button>
																			</div>
																		</div>
																	</s:form>
																</div>
																<!-- Modal footer -->
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
																</div>
															</div>
														</div>
													</div>
											</c:if>
											<a href="${pageContext.request.contextPath }/baohiem/updatebuyinsurranceadmin/${phieumuabaohiem.id }.html" class="btn btn-primary btn-mini">Cập nhật</a> 
											<a href="${pageContext.request.contextPath }/baohiem/deletebuyinsurranceadmin/${phieumuabaohiem.id }.html" class="btn btn-danger btn-mini" onclick="return confirm('Bạn có chắc muốn xóa không ?')">Xóa</a>
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