<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="m" uri="http://www.springframework.org/tags" %>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon shortcut" href="${pageContext.request.contextPath }/icon/logo.png">
<title>Bán bảo hiểm trực tuyến</title>
</head>

<style>
.counter{
color:#C41228;
font-weight:bold;
font-size: 20px;
}
</style>


<script>

    expireDate = new Date
    expireDate.setMonth(expireDate.getMonth()+6)
    jcount = eval(cookieVal("jaafarCounter"))
    jcount++
    document.cookie = "jaafarCounter="+jcount+";expires=" + expireDate.toGMTString()
    
    function cookieVal(cookieName) {
    thisCookie = document.cookie.split("; ")
    for (i=0; i<thisCookie.length; i++){
        if (cookieName == thisCookie[i].split("=")[0]){
            return thisCookie[i].split("=")[1]
        }
    }
    return 0
    }
    
    function page_counter(){
    for (i=0;i<(7-jcount.toString().length);i++)
    document.write('<span class="counter"></span>')
    for (y=0;y<(jcount.toString().length);y++)
    document.write('<span class="counter">'+jcount.toString().charAt(y)+'</span>')
    }

</script>
    <!--
        This script downloaded from www.JavaScriptBank.com
        Come to view and download over 2000+ free javascript at www.JavaScriptBank.com
    -->
<body>

<h4><b><i><m:message code="visit"></m:message></i></b> <script>page_counter(jcount);</script></h4>



</body>
</html>