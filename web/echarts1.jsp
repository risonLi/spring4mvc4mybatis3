<%--
  Created by IntelliJ IDEA.
  User: rison
  Date: 2017/4/20
  Time: 09:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
    <title>折线图</title>

    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/echarts.js"></script>
</head>
<body>

    <%--1、定义div初始化折线图--%>
    <div style="height: 410px; min-height: 100px; margin: 0 auto" id="main"></div>
    <script type="text/javascript">
        //2、加载dom之后初始化Echarts实例
        var mychart = echarts.init(document.getElementById("main"));
        option = {
            title: {
                text: '花名册图',
                subtext: '测试用'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data:['最高分','最低分']
            },
            toolbox: {
                show: true,
                feature: {
                    dataZoom: {
                        yAxisIndex: 'none'
                    },
                    dataView: {readOnly: false},
                    magicType: {type: ['line', 'bar']},
                    restore: {},
                    saveAsImage: {}
                }
            },
            xAxis:  {
                type: 'category',
                boundaryGap: false,
                data: ['周一','周二','周三','周四','周五','周六','周日']
            },
            yAxis: {
                type: 'value',
                axisLabel: {
                    formatter: '{value}分'
                }
            },
            series: [
                {
                    name:'最高气温',
                    type:'line',
                    data:[11, 11, 15, 13, 12, 13, 10],
                    markPoint: {
                        data: [
                            {type: 'max', name: '最大值'},
                            {type: 'min', name: '最小值'}
                        ]
                    },
                    markLine: {
                        data: [
                            {type: 'average', name: '平均值'}
                        ]
                    }
                },
                {
                    name:'最低气温',
                    type:'line',
                    data:[1, -2, 2, 5, 3, 2, 0],
                    markPoint: {
                        data: [
                            {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
                        ]
                    },
                    markLine: {
                        data: [
                            {type: 'average', name: '平均值'},
                            [{
                                symbol: 'none',
                                x: '90%',
                                yAxis: 'max'
                            }, {
                                symbol: 'circle',
                                label: {
                                    normal: {
                                        position: 'start',
                                        formatter: '最大值'
                                    }
                                },
                                type: 'max',
                                name: '最高点'
                            }]
                        ]
                    }
                }
            ]
        };

        /**
         * 动态图表的制作
         */
        //在数据为动态加载之前建筑loading动画
        mychart.showLoading();
        //对数据进行重写，变为动态数据
        var snum = [];
        var scount = [];
        var sname = [];
        $.ajax({
            type:"post",
            async:true, //异步请求
            url:"<%=basePath%>getAllOne.do",
            data:{},
            dataType:"json",
            success:function(result){
                if (result != null && result.length > 0){
                    for (var i=0; i<result.length; i++){
                        snum.push(result[i].num);
                        scount.push(result[i].count);
                        sname.push(result[i].name);
                    }
                    //隐藏加载动画
                    mychart.hideLoading();
                    //设置表格
                    mychart.setOption({
                        //动态设置表格
                        xAxis:{
                            data:sname  //重写X轴
                        },
                        series:[
                            {
                                name:"最大值",
                                data:snum,
                                color:['#123456']
                            },
                            {
                                name:"最小值",
                                data:scount,
                                color:['#654321']
                            }
                        ]

                    });
                }
            }
        });

        //3、加载Echarts表
        mychart.setOption(option);
    </script>

</body>
</html>
