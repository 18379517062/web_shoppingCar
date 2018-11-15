<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: zhaoyang
  Date: 2018/11/12
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册用户</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String usernames = request.getParameter("username");
    String passwords = request.getParameter("password");
    String phones = request.getParameter("phone");
    String cellphones = request.getParameter("cellphone");
    String emails = request.getParameter("email");
    String addresss = request.getParameter("address");

    Class.forName("org.sqlite.JDBC");
    String url = "jdbc:sqlite:D:/bookstore.db";
    String sql = "Insert into user(username,password,phone,cellphone,email,address) values (?,?,?,?,?,?)";
    Connection conn = DriverManager.getConnection(url);
    PreparedStatement stat = conn.prepareStatement(sql);
    stat.setString(1,usernames);
    stat.setString(2,passwords );
    stat.setString(3,phones );
    stat.setString(4,cellphones);
    stat.setString(5,emails );
    stat.setString(6,addresss);
    int rs = stat.executeUpdate();

    if(rs>0)
        out.println("成功添加"+rs+"行<br>三秒后自动跳转到登录界面");
    stat.close();
    conn.close();
    response.setHeader("refresh","3;/login.html");
    //response.sendRedirect("login.html");
%>

</body>
</html>
