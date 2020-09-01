/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Database.DatabaseConnection;
import Entity.Client;
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
@WebServlet(name = "EditClientProfile", urlPatterns = {"/EditClientProfile"})
public class EditClientProfile extends HttpServlet {

    Client user;

    public EditClientProfile() {
        this.user = new Client();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        
        user.setFname(request.getParameter("fname"));
        user.setLname(request.getParameter("lname"));
        user.setEmail(request.getParameter("email"));
        user.setUsername(request.getParameter("username"));
        user.setGender(request.getParameter("gender"));
        user.setAddress(request.getParameter("address"));
        user.setCity(request.getParameter("city"));
        user.setMobile(request.getParameter("mobile"));

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement pst = con.prepareStatement("update clientregister set fname = ? , lname = ? ,email = ?, mobile = ? , gender = ? ,  address = ?, city = ?   where username = '" + user.getUsername() + "' ");
            pst.setString(1, user.getFname());
            pst.setString(2, user.getLname());
            pst.setString(5, user.getGender());
            pst.setString(7, user.getCity());
            pst.setString(3, user.getEmail());
            pst.setString(4, user.getMobile());
            pst.setString(6, user.getAddress());
            
            int i = pst.executeUpdate();
            if (i > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Update Successfully..!');");
                pw.println("window.location.href = \"Home.jsp\";");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Not-Update try again Later..!!!');");
                pw.println("window.location.href = \"Home.jsp\";");
                pw.println("</script>");
            }

        } catch (ClassNotFoundException | SQLException e) {
        }

    }

}
///
