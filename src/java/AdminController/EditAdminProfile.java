/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import Database.DatabaseConnection;
import Entity.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditAdminProfile", urlPatterns = {"/EditAdminProfile"})
public class EditAdminProfile extends HttpServlet {

    Admin adm = new Admin();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter pw = response.getWriter();
        adm.setFname(request.getParameter("fname"));
        adm.setLname(request.getParameter("lname"));
        adm.setEmail(request.getParameter("email"));
        adm.setUsername(request.getParameter("username"));
        adm.setGender(request.getParameter("gender"));
        adm.setAddress(request.getParameter("address"));
        adm.setCity(request.getParameter("city"));
        adm.setMobile(request.getParameter("mobile"));

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement pst = con.prepareStatement("update adminlogin set fname = ? , lname = ? ,email = ?, mobile = ? , gender = ? ,  address = ?, city = ?   where username = '" + adm.getUsername() + "' ");
            pst.setString(1, adm.getFname());
            pst.setString(2, adm.getLname());
            pst.setString(5, adm.getGender());
            pst.setString(7, adm.getCity());
            pst.setString(3, adm.getEmail());
            pst.setString(4, adm.getMobile());
            pst.setString(6, adm.getAddress());

            int i = pst.executeUpdate();
            if (i > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Update Successfully..!');");
                pw.println("window.location.href = \"AdminDashboard.jsp\";");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Not-Update try again Later..!!!');");
                pw.println("window.location.href = \"AdminDashboard.jsp\";");
                pw.println("</script>");
            }

        } catch (ClassNotFoundException | SQLException e) {
        }
        
        
    }

}
