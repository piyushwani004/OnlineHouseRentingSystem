/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CustomerController;

import Controller.ClientRegister;
import Database.DatabaseConnection;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CustomerRegister", urlPatterns = {"/CustomerRegister"})
public class CustomerRegister extends HttpServlet {

    User u = new User();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter pw = response.getWriter();
        u.setFname(request.getParameter("fname"));
        u.setLname(request.getParameter("lname"));
        u.setEmail(request.getParameter("email"));
        u.setMobile(request.getParameter("mobile"));
        u.setGender(request.getParameter("gender"));
        u.setUsername(request.getParameter("username"));
        u.setPassword(request.getParameter("password"));
        u.setAddress(request.getParameter("address"));
        u.setCity(request.getParameter("city"));

        try {

            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement pst = con.prepareStatement("insert into UserRegister(fname,lname,email,mobile,gender,username,password,address,city) values(?,?,?,?,?,?,?,?,?)");
            pst.setString(1, u.getFname());
            pst.setString(2, u.getLname());
            pst.setString(3, u.getEmail());
            pst.setString(4, u.getMobile());
            pst.setString(5, u.getGender());
            pst.setString(6, u.getUsername());
            pst.setString(7, u.getPassword());
            pst.setString(8, u.getAddress());
            pst.setString(9, u.getCity());
            int i = pst.executeUpdate();
            if (i > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Register Successfully..!');");
                pw.println("window.location.href = \"CustomerLogin.jsp\";");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Enter Valid Details and try again Later..!!!');");
                pw.println("window.location.href = \"ClientRegister.jsp\";");
                pw.println("</script>");
            }

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ClientRegister.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
