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
				<a href="${pageContext.request.contextPath }/baohiem/listaccidentadmin.html" class="current">Số vụ tai nạn</a>
			</div>
			
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span1">
				</div> 
				<div class="span10">
					
					<div id="ColumnChart"></div>
					<div style="text-align: center; font-size: 20px; font-weight: bold;">Tổng cộng số vụ tai nạn: ${count2016 + count2017 + count2018} </div>
					<br>
					<div id="PieChart"></div>
					<div style="text-align: center; font-size: 20px; font-weight: bold;">Tổng cộng số vụ tai nạn: ${count2016 + count2017 + count2018} </div>
					
				</div>
				 <div class="span1">
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
    
</body>
<!-- Biểu đồ cột -->
 <!-- load Google AJAX API -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    //load the Google Visualization API and the chart
    google.load('visualization', '1', {'packages': ['columnchart']});

    //set callback
    google.setOnLoadCallback (createChart);

    //callback function
    function createChart() {

        //create data table object
        var dataTable = new google.visualization.DataTable();

        //define columns
        dataTable.addColumn('string','Quarters 2009');
        dataTable.addColumn('number', 'Số vụ tai nạn');

        //define rows of data
        dataTable.addRows([['2016', ${count2016 } ], ['2017', ${count2017 } ],['2018', ${count2018 } ]]);

        //instantiate our chart object
        var chart = new google.visualization.ColumnChart (document.getElementById('ColumnChart'));

        //define options for visualization
        var options = {width: 900, height: 400, is3D: true, title: 'Thống kê số vụ tai nạn được khai báo trong các năm qua'};

        //draw our chart
        chart.draw(dataTable, options);

    }
</script>

<!-- Biểu đồ tròn -->
 <!-- load Google AJAX API -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
   // Load the Visualization API and the piechart package.
   google.load('visualization', '1', {'packages': ['columnchart']});

   // Set a callback to run when the Google Visualization API is loaded.
   google.setOnLoadCallback(drawChart);

   // Callback that creates and populates a data table,
   // instantiates the pie chart, passes in the data and
   // draws it.
   function drawChart() {

       // Create the data table.    
       var data = google.visualization.arrayToDataTable([
           ['Country', 'Area(square km)'],['2016', ${count2016 } ],['2017', ${count2017 } ],['2018', ${count2018 } ]
       ]);
       // Set chart options
       var options = {
           'title': 'Thống kê số vụ tai nạn được khai báo trong các năm qua',
           is3D: true,
           pieSliceText: 'label',
           tooltip: {showColorCode: true},
           'width': 900,
           'height': 400
       };

       // Instantiate and draw our chart, passing in some options.
       var chart = new google.visualization.PieChart(document.getElementById('PieChart'));
       chart.draw(data, options);
   }
</script>

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