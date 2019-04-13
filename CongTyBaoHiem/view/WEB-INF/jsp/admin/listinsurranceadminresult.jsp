<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Bán bảo hiểm trực tuyến</title>
</head>

<body>
<section id="mytable">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"><i class="icon-th"></i></span>
							<h5>Danh sách bảo hiểm</h5>
						</div>
						<div class="widget-content nopadding">
							<table class="table table-bordered data-table">
								<thead>
									<tr>
										<th>STT</th>
										<th>Loại bảo hiểm</th>
										<th>Đơn giá</th>
										<th>Ảnh</th>
										<th width="500">Mô tả</th>
										<th width="90">Tùy chọn</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="baohiem" items="${danhsachbaohiem }">
									<tr class="gradeX">
										<c:set var="stt" value="${stt + 1}" />
										<td>${stt }</td>
										<td>${baohiem.loaibaohiem }</td>
										<td><fmt:formatNumber pattern="#,##0" value="${baohiem.dongia }" /> VND</td>
										<td><img src="${pageContext.request.contextPath }/img/${baohiem.anh }" alt="" height="150" width="200"></td>
										<td>${baohiem.mota }</td>
										<td>
											<a href="${pageContext.request.contextPath }/baohiem/updateinsurranceadmin/${baohiem.id }.html" class="btn btn-primary btn-mini">Cập nhật</a> 
											<a href="${pageContext.request.contextPath }/baohiem/deleteinsurranceadmin/${baohiem.id }.html" class="btn btn-danger btn-mini" onclick="return confirm('Bạn có chắc muốn xóa không ?')">Xóa</a>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

    </section>
</body>



</html>