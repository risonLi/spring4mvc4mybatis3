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

    <%--1、定义div初始化玫瑰图--%>
    <div style="height: 410px; min-height: 100px; margin: 0 auto" id="main"></div>
    <script type="text/javascript">
        //2、加载dom之后初始化Echarts实例
        var mychart = echarts.init(document.getElementById("main"));

        option = {
            title : {
                text: '南丁格尔玫瑰图',
                subtext: '花名册',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                x : 'center',
                y : 'bottom',
                data:['rose1','rose2','rose3','rose4','rose5','rose6','rose7','rose8']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {
                        show: true,
                        type: ['pie', 'funnel']
                    },
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            series : [
                {
                    name:'半径模式',
                    type:'pie',
                    radius : [20, 110],
                    center : ['25%', '50%'],
                    roseType : 'radius',
                    label: {
                        normal: {
                            show: false
                        },
                        emphasis: {
                            show: true
                        }
                    },
                    lableLine: {
                        normal: {
                            show: false
                        },
                        emphasis: {
                            show: true
                        }
                    },
                    data:[
                        {value:10, name:'rose1'},
                        {value:5, name:'rose2'},
                        {value:15, name:'rose3'},
                        {value:25, name:'rose4'},
                        {value:20, name:'rose5'},
                        {value:35, name:'rose6'},
                        {value:30, name:'rose7'},
                        {value:40, name:'rose8'}
                    ]
                },
                {
                    name:'面积模式',
                    type:'pie',
                    radius : [30, 110],
                    center : ['75%', '50%'],
                    roseType : 'area',
                    data:[
                        {value:10, name:'rose1'},
                        {value:5, name:'rose2'},
                        {value:15, name:'rose3'},
                        {value:25, name:'rose4'},
                        {value:20, name:'rose5'},
                        {value:35, name:'rose6'},
                        {value:30, name:'rose7'},
                        {value:40, name:'rose8'}
                    ]
                }
            ]
        };


        /**
         * 动态图表的制作
         */
        //在数据为动态加载之前建筑loading动画
        mychart.showLoading();
        //对数据进行重写，变为动态数据
        var arraydata = [];
//        var snum = [];
//        var scount = [];
//        var sname = [];
        //利用ajax从后台动态的获取数据
        $.ajax({
            type:"post",
            async:true, //异步请求
            url:"<%=basePath%>getAllByPie.do",
            data:{},
            dataType:"json",
            success:function(result){
                if (result != null && result.length > 0){
                    for (var i=0; i<result.length; i++){
                        arraydata.push(result[i].name);
//                        snum.push(result[i].num);
//                        scount.push(result[i].count);
//                        sname.push(result[i].name);
                    }
                    //隐藏加载动画
                    mychart.hideLoading();
                    //设置表格
                    mychart.setOption({
                        //动态设置表格
                        legend:{
                            data:arraydata  //重写X轴
                        },
                        series:[
                            {
//                                name:"最大值",
                                data:result,
//                                color:['#123456']
                            },
                            {
//                                name:"最小值",
                                data:result,
//                                color:['#654321']
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
