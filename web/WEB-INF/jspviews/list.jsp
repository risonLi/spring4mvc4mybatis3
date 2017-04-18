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
<html>
<head>
    <title>Title</title>
</head>
<body>
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
                <c:forEach items="${findAllList}" var="s">
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
