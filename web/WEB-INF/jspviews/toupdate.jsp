<%--
  Created by IntelliJ IDEA.
  User: rison
  Date: 2017/4/19
  Time: 10:20
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
    <title>插入操作</title>

    <%--1、兼容问题，在IE中运行最新的渲染模式--%>
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">

    <%--2、导入相关的css文件--%>
    <link rel="stylesheet" href="<%=basePath%>js/bootstrap3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>js/bootstrap3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%=basePath%>js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/reg.css">

    <%--3、导入相关的JS文件--%>
    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery-ui-1.12.1/jquery-ui.min.js"></script>

    <script type="text/javascript">
        $(function() {
            $("#slider-range-max").slider({
                range:"max",
                min:10,
                max:100,
                value:${ssms.num},
                slide:function(event, ui){
                    $("#num").val(ui.value);
                }
            });
            $("#num").val($("#slider-range-max").slider("value"));
        });
    </script>

    <script type="text/javascript">
        function inserttg(){
//            ajax的库来提交form表单
            $.ajax({
                type:"post",
                async:true,
                url:"doUpdate.do",
                data:$('#formid').serialize(),
                dataType:"text",
                success:function(res){
                    if (res == "yes"){
                        alert(res + "更新成功");
                        location.href="getAllByPage.do"
                    }else {
                        alert("更新失败");
                    }
                }
            })
        }
    </script>

</head>
<body>

    <ul class="nav nav-tabs">
        <li class="active"><a href="../../reg.jsp">更新注册</a></li>
    </ul>
    <%--这里的g为别名，自定义--%>
    <%--<c:forEach items="${ssms}" var="g">--%>
        <div class="divl">
            <form id="formid">
                <div>
                    <input type="hidden" id="id" name="id" value="${ssms.id}">
                </div>
                <div>
                    <div class="glyphicon glyphicon-user" style="font-size: 26px"></div>
                    <label class="text-right">姓名：</label>
                    <input type="text" name="name" id="name" value="${ssms.name}">
                </div>
                <div>
                    <div class="glyphicon glyphicon-map-marker" style="font-size: 26px"></div>
                    <label class="text-right">时间：</label>
                    <input type="text" name="date" id="date" value="${ssms.date}">
                </div>
                <div>
                    <div class="glyphicon glyphicon-leaf" style="font-size: 26px"></div>
                    <label class="text-right">num：</label>
                    <input type="text" name="num" id="num" style="border: 0;color: #2aabd2; font-weight: bold;" value="${ssms.num}">
                    <div id="slider-range-max" class="num"></div>
                </div>
                <div>
                    <div class="glyphicon glyphicon-ok" style="font-size: 26px"></div>
                    <label class="text-right">count：</label>
                    <input type="text" name="count" id="count" value="${ssms.count}">
                </div>
                <div>
                    <div class="glyphicon glyphicon-remove" style="font-size: 26px"></div>
                    <label class="text-right">次数：</label>
                    <input type="text" name="pass" id="pass" value="${ssms.pass}">
                </div>
                <div>
                    <div class="button"></div>
                    <button type="button" class="btn btn-primary btn-lg" onclick="inserttg()" style="font-size: 20px">
                    <span class="glyphicon glyphicon-user"></span>更新
                    </button>
                </div>

            </form>

        </div>
    <%--</c:forEach>--%>

</body>
</html>
