import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "register_check")
public class register_check extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String usernames = request.getParameter("username");
        String passwords = request.getParameter("password");
        String phones = request.getParameter("phone");
        String cellphones = request.getParameter("cellphone");
        String emails = request.getParameter("email");
        String addresss = request.getParameter("address");
        boolean statue = false; //注册状态

/*
        try{
            Class.forName("org.sqlite.JDBC");
             String url = "jdbc:sqlite:D:/bookstore.db";
            String sql = "select username from user";
            Connection conn = DriverManager.getConnection(url);
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while(rs.next()){
                if(usernames.equals(rs.getString("username"))==true){
                    statue =true;
                    break;
                }
            }
            stat.close();
            conn.close();
            if(statue==true){
                out.println("该账号已注册！");
                response.setHeader("refresh","2;/register.html");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        */

        try{
            Class.forName("org.sqlite.JDBC");
            String url = "jdbc:sqlite:D:/bookstore.db";
            String sql2 = "Insert into user(username,password,phone,cellphone,email,address) values (?,?,?,?,?,?)";
            Connection conn2 = DriverManager.getConnection(url);
            PreparedStatement stat2 = conn2.prepareStatement(sql2);
            stat2.setString(1,usernames);
            stat2.setString(2,passwords );
            stat2.setString(3,phones );
            stat2.setString(4,cellphones);
            stat2.setString(5,emails );
            stat2.setString(6,addresss);
            int rs2 = stat2.executeUpdate();

            if(rs2>0)
                out.println("成功添加"+rs2+"行<br>两秒后自动跳转到登录界面");
            stat2.close();
            conn2.close();
            response.setHeader("refresh","2;/login.html");
            //response.sendRedirect("login.html");
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
