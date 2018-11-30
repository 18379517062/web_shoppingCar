<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %><%--
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
    //判断是否登入，如果没有则返回主界面，否则显示购物车信息
    if(session.getAttribute("username")==null) {
        out.println("<script>alert('请先登录');</script>");
        response.setHeader("refresh","0;/index.jsp");
    }
    else{
%>


    <table border="1" width="100%" height="300px;" align="center;">
        <caption><%=(session.getAttribute("username")+"的购物车")%></caption>

        <th>书籍名称</th>
        <th>书籍价格</th>
        <th>书籍数量</th>
        <th>修改状态</th>
    </tr>
    <%
        ArrayList car = (ArrayList)session.getAttribute("car");
        Class.forName("org.sqlite.JDBC");
        String url = "jdbc:sqlite:D:/bookstore.db";
        String sql = "select book_id,price,quantity from orderitem";
        Connection conn = DriverManager.getConnection(url);
        Statement stat = conn.createStatement();
        ResultSet rs = stat.executeQuery(sql);
        while (rs.next()) {
    %>

        <form action="orderitem.jsp" method="post" name="book_news">
        <tr align="center">
        <td>  <input type="text" name="book_name" value="<%=rs.getString("book_id")%>" readonly style="border:none;font-size: 20px;"></td>
        <td>  <input type="number" name="book_price" value=" <%=rs.getString("price")%>" readonly style="border:none;font-size: 20px;"></td>
        <td>  <input type="number" name="book_quantity" min="1" max="100" maxlength="3"  value="<%=rs.getString("quantity")%>" autofocus style="font-size: 20px;">
              <input type=button value="+" onClick="javascript:if(this.form.book_quantity.value<100)this.form.book_quantity.value++;" >
              <input type=button value="-" onClick="javascript:if(this.form.book_quantity.value>1)this.form.book_quantity.value--">
        </td>
        <td>  <input type="submit" value="提交修改"></td>
        </td>
            </tr>
        </form>

    <% }
        stat.close();
        conn.close();
    %>

    <!--   // ArrayList car = (ArrayList)session.getAttribute("car");
        //for (int i=0;i<car.size();i++){
        //    out.println(car.get(i)+"<br>");
      //  }-->

    </table>
    <br> <br>


<%} %>
</body>
</html>
