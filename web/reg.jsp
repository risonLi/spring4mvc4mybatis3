<%--
  Created by IntelliJ IDEA.
  User: rison
  Date: 2017/4/19
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                value:16,
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
                url:"insert.do",
                data:$('#formid').serialize(),
                dataType:"text",
                success:function(res){
                    if (res == "yes"){
                        location.href="getAllByPage.do"
                    }
                }
            })
        }
    </script>

</head>
<body>

    <ul class="nav nav-tabs">
        <li class="active"><a href="reg.jsp">登记注册</a></li>
    </ul>

    <div class="divl">
        <form id="formid">
            <div>
                <div class="glyphicon glyphicon-user" style="font-size: 26px"></div>
                <label class="text-right">姓名：</label>
                <input type="text" name="name" id="name">
            </div>
            <div>
                <div class="glyphicon glyphicon-map-marker" style="font-size: 26px"></div>
                <label class="text-right">时间：</label>
                <input type="text" name="date" id="date">
            </div>
            <div>
                <div class="glyphicon glyphicon-leaf" style="font-size: 26px"></div>
                <label class="text-right">num：</label>
                <input type="text" name="num" id="num" style="border: 0;color: #2aabd2; font-weight: bold;">
                <div id="slider-range-max" class="num"></div>
            </div>
            <div>
                <div class="glyphicon glyphicon-ok" style="font-size: 26px"></div>
                <label class="text-right">count：</label>
                <input type="text" name="count" id="count">
            </div>
            <div>
                <div class="glyphicon glyphicon-remove" style="font-size: 26px"></div>
                <label class="text-right">次数：</label>
                <input type="text" name="pass" id="pass">
            </div>
            <div>
                <div class="button"></div>
                <button type="button" class="btn btn-primary btn-lg" onclick="inserttg()" style="font-size: 20px">
                <span class="glyphicon glyphicon-user"></span>登记注册
                </button>
            </div>

        </form>

    </div>

</body>
</html>
