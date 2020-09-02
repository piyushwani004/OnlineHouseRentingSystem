/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Database.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin_piyush
 */
@WebServlet(name = "ClientLogin", urlPatterns = {"/ClientLogin"})
public class ClientLogin extends HttpServlet {

    private String user;
    private String pass;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String username = request.getParameter("login");
            String password = request.getParameter("password");

            String s = "select fname,username,password,mobile from clientregister";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(s);
            while (rs.next()) {
                String fname = rs.getString(1);
                String mob = rs.getString(4);
                user = rs.getString(2);
                pass = rs.getString(3);

                if (username.equals(user) && password.equals(pass)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("fname", fname);
                    session.setAttribute("username", username);
                    session.setAttribute("mobile",mob);
                    pw.println("<script type=\"text/javascript\">");
                    pw.println("alert('Login Successfully..!');");
                    pw.println("window.location.href = \"Home.jsp\";");
                    pw.println("</script>");                   
                }
            }
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Username or Password is Incorrect..!');");
            pw.println("window.location.href = \"clientLogin.jsp\";");
            pw.println("</script>");

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ClientLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
