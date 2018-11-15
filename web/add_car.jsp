<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: zhaoyang
  Date: 2018/11/15
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>加入购物车</title>
</head>
<body>
>
    <%
       if(session.getAttribute("username")==null){
           out.println("您未登录，请先登录！");
    %>
    <a href="login.html">前往登陆</a><br>
    <a href="index.jsp">返回主页</a>
    <%
       }
       else{
         //  Class.forName("org.sqlite.JDBC");
          // String url = "jdbc:sqlite:D:/bookstore.db";
         //  String sql1 = "select ";
           //Connection conn = DriverManager.getConnection(url);
           //PreparedStatement stat = conn.prepareStatement(sql);

           out.println(session.getAttribute("username"));
       //    ArrayList book_name = (ArrayList)session.getAttribute("book_name") ;
         //  for(int i=0;i<book_name.size();i++){
            //   out.println(book_name.get(i)+"<br>");
         //  }

       }
    %>
</body>
</html>
