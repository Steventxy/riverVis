<%--
  Created by IntelliJ IDEA.
  User: 帅逼唐的电脑
  Date: 2019/12/30
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="man/readManExcel.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
    ...
    <a class="btn btn-mini btn-primary" onclick="save();">导入</a>
    <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
    <a class="btn btn-mini btn-success" onclick="window.location.href='man/dowExcel.do'">下载模版</a>
</form>
</body>
</html>
