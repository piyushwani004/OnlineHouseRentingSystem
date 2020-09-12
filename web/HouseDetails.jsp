<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%
    String user = (String) session.getAttribute("username");
    String mob = (String) session.getAttribute("mobile");
    if (user.equals(null)) {
        session.invalidate();
        response.sendRedirect("clientLogin.jsp");
    }
%>  
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <title>House Details</title>
        <style>
            body { 
                background: url(img/i2.jpg) no-repeat center center fixed; 
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
            .regform{
                padding: 20px;
                margin: 20px;
                background-color: #transparent;
            }
            .Cheadline{
                color: hotpink;
                display: flex;
                align-items: center;
                justify-content: center;
                font-style: italic;
                font-size: 30px;
            }
            label{
                color: white;
                font-size: 18px;
                font-style: italic;
                font-family: cursive;
                font-weight: bold;
            }
            .card .avatar {       
                width: 285px;
                height: 100px;       
            }
            .card .avatar img {
                width: 100%;
            }	
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm navbar-light" style="background-color: #e3f2fd;">
            <a class="navbar-brand" href="Home.jsp">House-Renting</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav ml-auto" style="margin-right: 20px;">
                    <a class="nav-item nav-link active" href="ClientAddHouse.jsp">Add House</a>
                    <a class="nav-item nav-link active" href="HouseDetails.jsp">House Details</a> 
                    <a class="nav-item nav-link active" href="clientLogin.jsp">LogOut</a> 
                </div>
            </div>
        </nav>
        <div class="Cheadline">
            <%
                Blob blob = null;
                byte[] imgData = null;
                Connection con = null;
                String image;
            %>
            <%
                HttpSession sess = request.getSession(false);
                sess.getAttribute("fname");
            %>
            <h1> ${fname}</h1>
        </div>
        <section class="card-columns">
            <%
                try {
                    con = DatabaseConnection.initializeDatabase();
                    String s = "select * from addhouse where mobile like '%" + mob + "%' ";
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(s);
                    while (rs.next()) {
                        int id = rs.getInt(10);
            %>

            <div class="card" style="width: 18rem; margin-left: 40px; margin-right: 40px; margin-top: 100px;">
                <div class="avatar">
                    <%
                        blob = rs.getBlob(9);
                        byte[] imageBytes = blob.getBytes(1, (int) blob.length());
                        String encodedImage = Base64.getEncoder().encodeToString(imageBytes);
                        image = "data:image/jpg;base64," + encodedImage;
                        out.print("<img src=" + image + ">");
                    %>
                </div>
                <div class="card-body">
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><b>Title:&nbsp;&nbsp;</b><%=rs.getString(1)%></li>
                    <li class="list-group-item"><b>Description:&nbsp;&nbsp;</b><%=rs.getString(8)%></li>
                    <li class="list-group-item"><b>Price:&nbsp;&nbsp;</b><%=rs.getString(11)%></li>
                    <li class="list-group-item"><b>Category:&nbsp;&nbsp;</b><%=rs.getString(2)%></li>
                    <li class="list-group-item"><b>Bedroom:&nbsp;&nbsp;</b><%=rs.getString(3)%></li>
                    <li class="list-group-item"><b>Mobile:&nbsp;&nbsp;</b><%=rs.getString(6)%></li>
                </ul>
                <div class="card-body">
                    <a href="UpdateHouse.jsp?id=<%=id%>" class="card-link">Edit</a>
                    <a href="DeleteHouse.jsp?id=<%=id%>" class="card-link">Delete</a>
                   
                </div>
            </div>


            <%        }
                } catch (Exception e) {

                }
            %>
        </section>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>