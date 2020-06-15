<%--
  Created by IntelliJ IDEA.
  User: MINI
  Date: 2020-04-04
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/uimaker/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
</head>
<body>


<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">easyui</a>
<button class="mybutton"></button>


</body>


<script>
$(".mybutton").linkbutton(
    {
      text:"我的第2个Easyuibutton",
        iconCls:"icon-add",
        disabled:true,/*禁用一个按钮*/

    }
)

$(".mybutton").linkbutton("enable");

</script>

</html>
