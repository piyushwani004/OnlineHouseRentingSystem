<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%
    String username = (String) session.getAttribute("customerusername");
    int id = (int) session.getAttribute("customerid");
    String name = (String) session.getAttribute("customername");

%>  
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Client Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <style>
            .card .avatar {       
                width: auto;
                height: 100px;       
            }
            .card .avatar img {
                width: 100%;
            }
            .search{
                margin-top: 20px;
                padding-left: 50px;
                padding-right: 50px;
                width: 100%;
                height: 70px;
            }
            .form-control-borderless {
                border: none;
            }

            .form-control-borderless:hover, .form-control-borderless:active, .form-control-borderless:focus {
                border: none;
                outline: none;
                box-shadow: none;
            }

        </style>
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">${customername}</div>
                </a>
                <!-- Divider -->
                <hr class="sidebar-divider my-0">
                <!-- Nav Item - Dashboard -->
                <!-- Divider -->
                <hr class="sidebar-divider">
                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>
                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>Utilities</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header"></h6>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#ProfileModal">
                                Profile
                            </a>
                            <a class="collapse-item" href="">View Clients</a>
                        </div>
                    </div>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
                <!-- Heading -->
                <div class="sidebar-heading">
                    Addons
                </div>
                <!-- Nav Item - Pages Collapse Menu -->
                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="SearchHouse.jsp">
                        <i class="fas fa-home"></i>
                        <span>Search House</span></a>
                </li>
                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="">
                        <i class="fas fa-home"></i>
                        <span>House Details</span></a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">
                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column" style="background: url(img/i2.jpg) no-repeat center center fixed; background-size: cover; -o-background-size: cover; -moz-background-size: cover; -webkit-background-size: cover;">
                <!-- Main Content -->
                <div id="content">
                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                        <!-- Topbar Search -->
                        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">
                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>                         
                            <div class="topbar-divider d-none d-sm-block"></div>
                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${customername}</span>
                                    <i class="fas fa-user"></i>
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#ProfileModal">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </nav>

                    <!-- End of Topbar -->

                    <div class="search">
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-10 col-lg-8">
                                <form class="card card-sm">
                                    <div class="card-body row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <i class="fas fa-search fa-2x"></i>
                                        </div>
                                        <!--end of col-->
                                        <div class="col">
                                            <input class="form-control form-control-lg form-control-borderless" type="search" name="search" placeholder="Search City or price">
                                        </div>
                                        <!--end of col-->
                                        <div class="col-auto">
                                            <button class="btn btn-lg btn-outline-primary" type="submit">Search</button>
                                        </div>
                                        <!--end of col-->
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="Cheadline">
                        <%                Blob blob = null;
                            byte[] imgData = null;
                            Connection con = null;
                            String image;
                            String mobile = "";
                        %>
                        <h1> ${fname}</h1>
                    </div>
                    <section class="card-columns">
                        <%                try {
                                con = DatabaseConnection.initializeDatabase();
                                String sql = "";
                                String query = request.getParameter("search");
                                if (query != null) {
                                    sql = "select * from addhouse where city like '%" + query + "%' or price like '%" + query + "%' or bedroom like '%" + query + "%' ";
                                } else {
                                    sql = "select * from addhouse";
                                }
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery(sql);
                                while (rs.next()) {
                                    mobile = rs.getString(6);
                        %>
                        <div class="card" style="width: 350px;; margin-left: 40px; margin-right: 40px; margin-top: 50px;">
                            <div class="avatar">
                                <%  blob = rs.getBlob(9);
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
                                <li class="list-group-item"><b>City:&nbsp;&nbsp;</b><%=rs.getString(5)%></li>
                                <li class="list-group-item"><b>Price:&nbsp;&nbsp;</b><%=rs.getString(11)%></li>
                                <li class="list-group-item"><b>Category:&nbsp;&nbsp;</b><%=rs.getString(2)%></li>
                                <li class="list-group-item"><b>Bedroom:&nbsp;&nbsp;</b><%=rs.getString(3)%></li>
                                <li class="list-group-item"><b>Mobile:&nbsp;&nbsp;</b><%=rs.getString(6)%></li>
                            </ul>
                            <div class="card-body">
                                <a href=""><i class="fas fa-heart fa-2x"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href=""><i class="fas fa-cart-plus fa-2x"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <a href="ClientDetail.jsp?mob=<%=mobile%>"><i class="fas fa-eye fa-2x"></i></a>
                            </div>
                        </div>
                        <%        }
                            } catch (Exception e) {

                            }
                        %>
                    </section>

                    <!-- Footer -->
                    <footer class="sticky-footer" style="background-color: transparent;">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto" style="color: white">
                                <span>Copyright &copy; <a href="https://piyushwani004.github.io/portfolio/" style="color: white;"> Piyush047 </a></span>
                            </div>
                        </div>
                    </footer>
                    <!-- End of Footer -->

                </div>
                <!-- End of Content Wrapper -->
            </div>
        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="CustomerLogin.jsp">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Logout Modal END -->

        <%            try {
                con = DatabaseConnection.initializeDatabase();
                String s = "select * from userregister where id like '%" + id + "%' ";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(s);
                while (rs.next()) {
        %>
        <!-- Profile Modal START -->
        <div class="modal fade" id="ProfileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" >
                <div class="modal-content">
                    <div class="modal-header" >
                        <h5 class="modal-title" id="exampleModalLabel">${customername} Profile</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <form action="<%=request.getContextPath()%>/EditUserProfile"  method="post" class="modal-body" novalidate>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="validationCustom01">First name</label>
                                <input type="text" class="form-control" name="fname" id="validationCustom01" placeholder="First name" value="<%=rs.getString(2)%>">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="validationCustom02">Last name</label>
                                <input type="text" class="form-control"  name="lname" id="validationCustom02" placeholder="Last name" value="<%=rs.getString(3)%>">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="validationCustom04">Email</label>
                                <input type="text" class="form-control" name="email" id="validationCustom04" placeholder="Email" value="<%=rs.getString(4)%>">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="validationCustom04">Mobile</label>
                                <input type="text" class="form-control" name="mobile" id="validationCustom04" placeholder="Mobile" value="<%=rs.getString(5)%>">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="validationCustom03">City</label>
                                <input type="text" class="form-control" name="city" id="validationCustom03" placeholder="City" value="<%=rs.getString(10)%>" >   
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="validationCustom03">Username</label>
                                <input type="text" class="form-control" name="username" id="validationCustom03" placeholder="Username" value="<%=rs.getString(7)%>" readonly>   
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="validationCustom03">Gender</label>
                                <input type="text" class="form-control" name="gender" id="validationCustom03" placeholder="Gender" value="<%=rs.getString(6)%>">       
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="validationCustom05">Address</label>
                                <input type="text" class="form-control" name="address" id="validationCustom05" placeholder="Address" value="<%=rs.getString(9)%>">

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-primary" type="submit">Submit form</button>
                        </div>
                    </form>
                </div>
            </div>

            <%
                    }
                } catch (Exception e) {

                }
            %>
        </div>
        <!-- Profile Modal END  -->

        <script>
            // Example starter JavaScript for disabling form submissions if there are invalid fields
            (function () {
                'use strict';
                window.addEventListener('load', function () {
                    // Fetch all the forms we want to apply custom Bootstrap validation styles to
                    var forms = document.getElementsByClassName('needs-validation');
                    // Loop over them and prevent submission
                    var validation = Array.prototype.filter.call(forms, function (form) {
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
                }, false);
            })();
        </script>


        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

    </body>

</html>
