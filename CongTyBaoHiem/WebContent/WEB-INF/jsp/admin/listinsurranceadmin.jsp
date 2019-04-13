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
				<a href="${pageContext.request.contextPath }/baohiem/listinsurranceadmin.html" class="current">Bảo hiểm</a>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					
					<a href="${pageContext.request.contextPath }/baohiem/addinsurranceadmin.html" class="btn btn-success ">Thêm mới</a>
					 
					<div class="control-group" style="float: right;">
			             <div class="controls">
			               <s:form method="post" commandName="baohiem" action="${pageContext.request.contextPath }/baohiem/searchinsurranceadmin.html">
			               <div class="input-prepend"> 
			                 <input name="keyinsurranceadmin" type="text" placeholder="Từ khóa..." class="span11" style="width: 160px">
			                 <input type="submit" value="Tìm kiếm" class="btn btn-inverse">
			               </div>
			                 </s:form>
			             </div>
		           	</div>
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
											<%-- <button class="btn btn-danger btn-mini" onclick="Xoa('${baohiem.id}')">Xóa</button> --%>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					</section>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
    
</body>

<script type="text/javascript">
		function Xoa($id){
			var result = confirm("Bạn có chắc chắn muốn xóa bảo hiểm này không?");
			if(result == true){
		 		XoaBaoHiem($id); 
			/* 	window.location = "XoaBaoHiemServlet?id="+$id; */
			/* 	window.location = "/CongTyBaoHiem/baohiem/deleteinsurranceadmin/" + $id + ".html"; */
			}
		}
		
		function suaBaoHiem($id){
			window.location = "SuaBaoHiemServlet?id="+$id;
		}
	</script>
	
	<script type="text/javascript">
		function result($info) {
			alert($info);
		}
	
		function XoaBaoHiem($id) {
      	  var xhttp = new XMLHttpRequest();
      	  /* var url="XoaBaoHiemServlet?id="+$id; */
      	  var url="/CongTyBaoHiem/baohiem/deleteinsurranceadmin/" + $id + ".html";
      	  xhttp.onreadystatechange = function() {
      	    if (this.readyState == 4 && this.status == 200) {
      	      var data = xhttp.responseText;
      	      document.getElementById("mytable").innerHTML=data;
      	      //alert("Bạn đã giám định hồ sơ này!");
      	    }
      	  };
      	  xhttp.open("POST",url, true);
      	  xhttp.send();
      	}
	</script>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/ja/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/ja/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/ja/Director/app.js" type="text/javascript"></script>

	<!-- Director dashboard demo (This is only for demo purposes) -->
	<script src="${pageContext.request.contextPath }/ja/Director/dashboard.js" type="text/javascript"></script>
	
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