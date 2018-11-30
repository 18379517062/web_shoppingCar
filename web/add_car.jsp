<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="page.car" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.print.DocFlavor" %><%--
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

    <%
        if(session.getAttribute("username")==null){

        //car car = (car)session.getAttribute("car");
       //if(car.getUsername()==null){
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
           String name=request.getParameter("name");
           out.println(name+"成功加入购物车");

          // ArrayList car = (ArrayList)session.getAttribute("car") ;
          // car.add(name);
         //  for(int i=0;i<car.size();i++){
         //      out.println("<<");
          //     out.println(car.get(i)+">><br>");
         //  }
        //    session.setAttribute("car",car );
           //response.setHeader("refresh","1;index.jsp");
           //request.getRequestDispatcher("index.jsp").forward(request, response);
           //response.sendRedirect("show_car.jsp");
       }
    %>
</body>
</html>
