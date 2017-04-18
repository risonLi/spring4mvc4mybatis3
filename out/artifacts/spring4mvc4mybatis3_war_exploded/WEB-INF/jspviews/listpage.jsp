<%--
  Created by IntelliJ IDEA.
  User: rison
  Date: 2017/4/15
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--引入C标签--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>

    <script type="text/javascript" src="<%=basePath%>js/kkpager/jpager.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/kkpager/jpager.css"/>
    <script type="text/javascript" src="<%=basePath%>js/listpage.js"></script>
    <script type="text/javascript">
        function load() {
            arrayPage(${pageResult.pages}, ${pageResult.total});
        }
    </script>

</head>
<body onload="load()">

<div style="width: 800px; margin: 0 auto;">
    <div id="jpager"></div>
</div>

    <div>列表</div>
    <div>
        <table border="1">
            <tr>
                <th>序号</th>
                <th>名字</th>
                <th>密码</th>
                <th>数字</th>
                <th>时间</th>
                <th>次数</th>
            </tr>
            <tr>
                <c:forEach items="${pageResult.dataList}" var="s">
                    <tr>
                        <td>${s.id}</td>
                        <td>${s.name}</td>
                        <td>${s.pass}</td>
                        <td>${s.num}</td>
                        <td>${s.date}</td>
                        <td>${s.count}</td>
                    </tr>
                </c:forEach>
            </tr>
        </table>

    </div>

</body>
</html>
