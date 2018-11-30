import page.car;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "login_check")
public class login_check extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String une = request.getParameter("id");
        String pwd = request.getParameter("pwd");

        try {
            Class.forName("org.sqlite.JDBC");
            String url = "jdbc:sqlite:D:/bookstore.db";
            String sql = "SELECT id,username ,password from user";

           // String sql2= "SELECT username from orders";
           // String sql3 = "Insert into orders(username,state) values(?,?)";
          //  String sql4 = "UPDATE orders set state='true' ";

            Connection conn = DriverManager.getConnection(url);

            Statement stat = conn.createStatement();
          //  Statement stat2 = conn.createStatement();
          //  Statement stat4 = conn.createStatement();

           // PreparedStatement stat3 = conn.prepareStatement(sql3);
           // stat3.setString(1,une);
          //  stat3.setString(2,"true" );

            ResultSet rs = stat.executeQuery(sql);
          //  ResultSet rs2 = stat2.executeQuery(sql2);

            boolean stau_login=false;
           // boolean stau_exist=false;
            while(rs.next()){
                if(une.equals(rs.getString("username")) == true && pwd.equals(rs.getString("password")) == true){
                    //将用户名加入session中
                    HttpSession session = request.getSession();
                    //car car =new car();
                   // car.setUsername(une);
                    ArrayList car = new ArrayList();

                    session.setAttribute("username", une);
                    session.setAttribute("car",car );
                    stau_login=true;
                  /*  while(rs2.next()){
                        //在orders 列表里面存在该用户
                        if(une.equals(rs2.getString("username"))){
                            stat4.executeUpdate(sql4);                   //将状态改为true：在线
                            out.println("用户以前登陆过！");
                            stau_exist = true;

                        }
                    }
                    //orders 列表不存在该用户
                    if(stau_exist == false){
                        //将username加入到orders里面
                        stat3.executeUpdate();
                       out.println("将用户加入订单用户");
                    }

                    //跳转用户界面
                    stat.close();
                    stat2.close();
                    stat3.close();
                    stat4.close();
*/
                    out.println("登录成功，一秒后返回主界面");

                    response.setHeader("refresh","1;/index.jsp");
                    break;
                }
            }
                 stat.close();
              //   stat2.close();
            //     stat3.close();
            //     stat4.close();
                 conn.close();
            //登陆失败，返回登陆页面
            if(stau_login==false) {
                out.println("登录失败，可能用户名或密码错误，一秒后返回主界面");
                response.setHeader("refresh", "1;/index.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }





    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response );
    }
}
