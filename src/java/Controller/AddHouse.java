/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Database.DatabaseConnection;
import Entity.House;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddHouse", urlPatterns = {"/AddHouse"})
@MultipartConfig(maxFileSize = 16177216)
public class AddHouse extends HttpServlet {

    House house;
    InputStream inputStream = null;

    public AddHouse() {
        this.house = new House();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();

        house.setHname(request.getParameter("hname"));
        house.setCategory(request.getParameter("category"));
        house.setBedroom(request.getParameter("bedroom"));
        house.setEmail(request.getParameter("email"));
        house.setCity(request.getParameter("city"));
        house.setMobile(request.getParameter("mobile"));
        house.setAddress(request.getParameter("address"));
        house.setDescription(request.getParameter("description"));
        house.setPrice(request.getParameter("price"));
        Part filePart = request.getPart("photo");

        try {

            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement ps = con.prepareStatement("insert into addhouse(hname,category,bedroom,email,city,mobile,address,descr,photo,price) values(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, house.getHname());
            ps.setString(2, house.getCategory());
            ps.setString(3, house.getBedroom());
            ps.setString(4, house.getEmail());
            ps.setString(5, house.getCity());
            ps.setString(6, house.getMobile());
            ps.setString(7, house.getAddress());
            ps.setString(8, house.getDescription());
            inputStream = filePart.getInputStream();
            ps.setBlob(9, inputStream);
            ps.setString(10, house.getPrice());
            int i = ps.executeUpdate();

            if (i > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('House Add Sucessfully');");
                pw.println("window.location.href = \"Home.jsp\";");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Error...!!!!Try Again Later..');");
                pw.println("window.location.href = \"ClientAddHouse.jsp\";");
                pw.println("</script>");
            }

        } catch (ClassNotFoundException | SQLException e) {

        }
    }

}
