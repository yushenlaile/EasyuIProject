<%--
  Created by IntelliJ IDEA.
  User: MINI
  Date: 2020-04-05
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/uimaker/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>

</head>

<%--将整各页面进行easyui布局--%>
<body class="easyui-layout">
<%--上部--%>
<div data-options="region:'north',split:false" style="height:100px; background-color: orangered">
    <img src="${pageContext.request.contextPath}/main_logo.png" style="padding-left: 10px;padding-top: 20px">
</div>
<%--下部--%>
<div data-options="region:'south' " style="height:50px; border-bottom: 3px solid orangered">
    <p style="text-align:center">版权</p>
</div>
<%--左部--%>
<div data-options="region:'west',split:true" style="width:240px;"><%--split表示是否可以进行拖动--%>
    <%-- class="easyui-accordion  表示是一个accordion--%> <%--fit:true 铺满父容器--%>
    <div id="aa" class="easyui-accordion" style="width:300px;height:200px;" data-options="fit:true">
        <div title="菜单" data-options="iconCls:'icon-save',selected:true" style="overflow:auto;padding:10px;">
            <%--tree--%>
            <div id="tree"></div>
        </div>

        <div title="Title2" data-options="iconCls:'icon-reload'" style="padding:10px;">
            content2
        </div>
        <div title="Title3">
            content3
        </div>
    </div>
</div>
<%--中部--%>
<div data-options="region:'center'," style="padding:5px;background:#eee;">
    <%--tabs--%>
    <div id="tabs">

    </div>
</div>

</body>
<script>
    /*将id的dom变成easyui的选项卡*/
    $('#tabs').tabs({
        /*铺满父容器  否则在Layout布局时可能显示不出来*/
        fit: true,/*必须加上，否则可能*/
    });


    $('#tree').tree({
        url: 'tree.json',
        lines: true,
        /*点击子节点时，添加选项卡中对应的选项*/
        onClick: function (node) { /*tree点击事件,node点击的子节点*/
         /*   alert(node.text);  // 在用户点击的时候提示*/
            /*先判断选项卡中是否已经有该选项卡面板--根据选项的名字  -返回值是boolean*/
            var isxuanze = $('#tabs').tabs("exists", node.text);
            console.log(isxuanze);
            if (isxuanze) {//如果已经有了则选中这个选项(根据选项的名字)
                $('#tabs').tabs("select",node.text)
            } else {  /*如果没有则添加新选项*/
                $('#tabs').tabs("add", {
                    title: node.text,
                    /*引入其他页面到选项卡的面板中*/
                    /*node.attributes.url--访问某个节点node中的自定义属性*/
                    content:"<iframe   frameborder='0'  style='width: 100%;height: 100%' src="+node.attributes.url+"  ></iframe>",
                   /*frame不能脱离frameSet单独使用，iframe可以，且frame不能放在body中；故我们使用iframe--记录*/
                    selected: true,
                    cache:false,
                    closable: true,

                    //*href--引入其他页面到当前面板时只能引入<body>中的内容--注意故一般不用  我们需要的则时全部包括<js>*/
                /*  href:node.attributes.url,访问节点node中的自定义属性*/
                })
            }
        }

    });


</script>
</html>
