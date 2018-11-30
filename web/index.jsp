<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@page isELIgnored="false" %>

<%--
  Created by IntelliJ IDEA.
  User: zhaoyang
  Date: 2018/11/5
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="css/bootstrap.min.css" rel="stylesheet"/>
  <link href="css/style.css" rel="stylesheet"/>
  <title>网上书店</title>
</head>

<body onload="initAJAX()">
<script src="js/jquery.min.js" ></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/commons.js"></script>

<div class="header">
  <div class="container">
    <div class="row">
      <div class="login span4">
        <h1><a href=""> 欢迎来到<strong>我的</strong>书店</a>
          <span class="red">.</span></h1>
      </div>
      <div class="links span8">
          <!--标签的 rel 属性用于指定当前文档与被链接文档的关系,提示作用
          data-* 属性用于存储页面或应用程序的私有自定义数据。
          存储的（自定义）数据能够被页面的 JavaScript 中利用，以创建更好的用户体验-->

             <a class="login" href="login.html" rel="tooltip" data-
             placement="bottom" data-toggle="modal" data-target="#myModal"></a>

        <a class="register" href="register.html" rel="tooltip" data_placement="bottom"></a>

               <script>
                 function out() {

                     <%
                     if(session.getAttribute("username")==null){
                     %>
                     alert("您还未登陆！");
                     <%
                     }
                     else{
                      %>
                     var statue =confirm("您即将退出");
                     if(statue==true)
                     {


                     }


                     else{}

                     <% //if(session.getAttribute("statue")=="true")
                          //response.sendRedirect("logout");

                      %>


                <% }%>
                 }
               </script>


               <a class="logout" href="#" rel="tooltip" data_placement="bottom" onclick="out()"></a>


            <a class="car" href="show_car.jsp" rel="tooltip"></a>

      </div>
    </div>
  </div>
</div> <%--header--%>

<script language="JavaScript">
    function showBook(categoryID) {
        xmlHttp.onreadystatechange = function() {
            if (xmlHttp.readyState == 4) {
                if(xmlHttp.status == 200) {
                    var data = xmlHttp.responseText;
                    document.getElementById("book").innerHTML = data;
                }
            }
        }
        xmlHttp.open("GET", "getBook.jsp?id="+categoryID, true);
        xmlHttp.send();
    }
</script>


<div class="row"> <%--下方左右div控制--%>
  <div class="col-md-3"> <%--左侧菜单div控制--%>
    <ul class="nav nav-list">
      <li class="nav-header">书籍类型</li>
      <%
        Class.forName("org.sqlite.JDBC");
        String url = "jdbc:sqlite:D:/bookstore.db";
        String sql = "select id,name,description from category ";
        Connection conn = DriverManager.getConnection(url);
        Statement stat = conn.createStatement();
        ResultSet rs = stat.executeQuery(sql);
        while(rs.next())
        {
      %>
      <li>
        <a href='javascript:showBook("<%=rs.getString("id")%>")'><%=rs.getString("name")%></a>
      </li>
      <%
        }
        stat.close();
        conn.close();
      %>
    </ul>
  </div><%--左侧菜单div控制--%>

    <div class="col-md-9" id="book"><%-- 书籍布局控制 --%>


    </div><%-- 书籍布局控制 --%>
</div><%--下方左右div控制--%>

<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"></div>
      <div class="modal-body"></div>
      <div class="modal-footer"></div>
    </div>
  </div>
</div>
  </body>
</html>
