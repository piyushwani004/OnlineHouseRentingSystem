/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import Controller.ClientRegister;
import Database.DatabaseConnection;
import Entity.Admin;
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
@WebServlet(name = "AdminRegister", urlPatterns = {"/AdminRegister"})
public class AdminRegister extends HttpServlet {

    Admin adm = new Admin();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter pw = response.getWriter();
        adm.setFname(request.getParameter("fname"));
        adm.setLname(request.getParameter("lname"));
        adm.setUsername(request.getParameter("username"));
        adm.setPassword(request.getParameter("password"));
        adm.setEmail(request.getParameter("email"));
        adm.setMobile(request.getParameter("mobile"));
        adm.setGender(request.getParameter("gender"));
        adm.setAddress(request.getParameter("address"));
        adm.setCity(request.getParameter("city"));

        try {

            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement pst = con.prepareStatement("insert into adminlogin(username, password,fname,lname,email,mobile,gender,address,city) values(?,?,?,?,?,?,?,?,?)");
            pst.setString(1, adm.getUsername());
            pst.setString(2, adm.getPassword());
            pst.setString(3, adm.getFname());
            pst.setString(4, adm.getLname());
            pst.setString(5, adm.getEmail());
            pst.setString(6, adm.getMobile());
            pst.setString(7, adm.getGender());            
            pst.setString(8, adm.getAddress());
            pst.setString(9, adm.getCity());
            int i = pst.executeUpdate();
            if (i > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Register Successfully..!');");
                pw.println("window.location.href = \"AdminLogin.jsp\";");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Enter Valid Details and try again Later..!!!');");
                pw.println("window.location.href = \"AdminRegister.jsp\";");
                pw.println("</script>");
            }

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ClientRegister.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
