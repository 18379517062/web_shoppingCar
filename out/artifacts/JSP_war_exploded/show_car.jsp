<%--
  Created by IntelliJ IDEA.
  User: zhaoyang
  Date: 2018/11/15
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
</head>
<body>
    <%
        Cookie[] cookies = request.getCookies();
        for(int i=0;i<cookies.length;i++){
            if(cookies[i].getName().equals("book_name")){
                out.println(cookies[i].getValue()+"aa");
            }
        }
    %>
</body>
</html>
