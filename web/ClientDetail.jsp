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
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <style>
            .image-container {
                position: relative;
            }
            .image {
                opacity: 1;
                display: block;
                width: 100%;
                height: auto;
                transition: .5s ease;
                backface-visibility: hidden;
            }
            .middle {
                transition: .5s ease;
                opacity: 0;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                -ms-transform: translate(-50%, -50%);
                text-align: center;

                .image-container:hover .image {
                    opacity: 0.3;
                }
                .image-container:hover .middle {
                    opacity: 1;
                }
                hr{
                    margin-bottom: 2px;
                    margin-top: 2px;
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

                    <!-- Nav Item - Pages Collapse Menu -->


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

                        <%                            String mobile = (String) request.getParameter("mob");
                            Connection con = null;
                        %>
                        <!-- Begin Page Content -->
                        <%                try {
                                con = DatabaseConnection.initializeDatabase();
                                String query = "select * from clientregister " + "where mobile = '" + mobile + "'";
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery(query);
                                while (rs.next()) {

                        %>
                        <section>
                            <div class="container">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="card" style="background: linear-gradient(45deg, black, transparent); box-shadow: 5px 10px;border: 1px solid;">
                                            <div class="card-body">
                                                <div class="card-title mb-4">
                                                    <div class="d-flex justify-content-start">
                                                        <div class="image-container">
                                                            <img src="img/i2.jpg" id="imgProfile" style="width: 150px; height: 150px" class="img-thumbnail" />
                                                                <div class="middle">
                                                                    <input type="button" class="btn btn-secondary" id="btnChangePicture" value="Change" />
                                                                    <input type="file" style="display: none;" id="profilePicture" name="file" />
                                                            </div>
                                                        </div>
                                                        <div class="userData ml-3">
                                                            <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold"><a href="javascript:void(0);"><%= rs.getString(7)%></a></h2>
                                                            </div>
                                                            <div class="ml-auto">
                                                                <input type="button" class="btn btn-primary d-none" id="btnDiscard" value="Discard Changes" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                                                <li class="nav-item">
                                                                    <a class="nav-link active" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="true">Basic Info</a>
                                                                </li>
                                                                <li class="nav-item">
                                                                    <a class="nav-link" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab" aria-controls="connectedServices" aria-selected="false">Connected Services</a>
                                                                </li>
                                                            </ul>
                                                            <div class="tab-content ml-1" id="myTabContent">
                                                                <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                                                    <div class="row">
                                                                        <div class="col-sm-3 col-md-2 col-5">
                                                                            <label style="font-weight:bold; color: white;">Full Name</label>
                                                                    </div>
                                                                    <div class="col-md-8 col-6">
                                                                        <%=rs.getString(2)%>&nbsp;&nbsp;<%= rs.getString(3)%>
                                                                    </div>
                                                                </div>
                                                                <hr />

                                                                <div class="row">
                                                                    <div class="col-sm-3 col-md-2 col-5">
                                                                        <label style="font-weight:bold; color: white;">Email:</label>
                                                                    </div>
                                                                    <div class="col-md-8 col-6">
                                                                        <%=rs.getString(4)%>
                                                                    </div>
                                                                </div>
                                                                <hr/>


                                                                <div class="row">
                                                                    <div class="col-sm-3 col-md-2 col-5">
                                                                        <label style="font-weight:bold; color: white;">Mobile</label>
                                                                    </div>
                                                                    <div class="col-md-8 col-6">
                                                                        <%=rs.getString(5)%>
                                                                    </div>
                                                                </div>
                                                                <hr />
                                                                <div class="row">
                                                                    <div class="col-sm-3 col-md-2 col-5">
                                                                        <label style="font-weight:bold; color: white;">Gender</label>
                                                                    </div>
                                                                    <div class="col-md-8 col-6">
                                                                        <%=rs.getString(6)%>
                                                                    </div>
                                                                </div>
                                                                <hr />
                                                                <div class="row">
                                                                    <div class="col-sm-3 col-md-2 col-5">
                                                                        <label style="font-weight:bold; color: white;">Address</label>
                                                                    </div>
                                                                    <div class="col-md-8 col-6">
                                                                        <%=rs.getString(9)%>
                                                                    </div>
                                                                </div>
                                                                <hr />
                                                                <div class="row">
                                                                    <div class="col-sm-3 col-md-2 col-5">
                                                                        <label style="font-weight:bold; color: white;">City</label>
                                                                    </div>
                                                                    <div class="col-md-8 col-6">
                                                                        <%=rs.getString(10)%>
                                                                    </div>
                                                                </div>
                                                                <hr />
                                                            </div>
                                                            <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
                                                                <a href="mailto:<%=rs.getString(4)%>"> <img src="img/gmail.png" alt="" width="30" height="20"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="tel:<%=rs.getString(5)%>"> <img src="img/mobile.png" alt="" width="50" height="30"></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <!-- End of Page Content -->
                        <%        }
                            } catch (Exception e) {

                            }
                        %>

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
                                <a class="btn btn-primary" href="clientLogin.jsp">Logout</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%            try {
                        con = DatabaseConnection.initializeDatabase();
                        String s = "select * from userregister where id like '%" + id + "%' ";
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery(s);
                        while (rs.next()) {
                %>
                <!-- Profile Modal-->
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

                <script>
                    $(document).ready(function () {
                        $imgSrc = $('#imgProfile').attr('src');
                        function readURL(input) {

                            if (input.files && input.files[0]) {
                                var reader = new FileReader();

                                reader.onload = function (e) {
                                    $('#imgProfile').attr('src', e.target.result);
                                };

                                reader.readAsDataURL(input.files[0]);
                            }
                        }
                        $('#btnChangePicture').on('click', function () {
                            // document.getElementById('profilePicture').click();
                            if (!$('#btnChangePicture').hasClass('changing')) {
                                $('#profilePicture').click();
                            } else {
                                // change
                            }
                        });
                        $('#profilePicture').on('change', function () {
                            readURL(this);
                            $('#btnChangePicture').addClass('changing');
                            $('#btnChangePicture').attr('value', 'Confirm');
                            $('#btnDiscard').removeClass('d-none');
                            // $('#imgProfile').attr('src', '');
                        });
                        $('#btnDiscard').on('click', function () {
                            // if ($('#btnDiscard').hasClass('d-none')) {
                            $('#btnChangePicture').removeClass('changing');
                            $('#btnChangePicture').attr('value', 'Change');
                            $('#btnDiscard').addClass('d-none');
                            $('#imgProfile').attr('src', $imgSrc);
                            $('#profilePicture').val('');
                            // }
                        });
                    });
                </script>


                <!-- Bootstrap core JavaScript-->
                <script src="vendor/jquery/jquery.min.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                <!-- Core plugin JavaScript-->
                <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

                <!-- Custom scripts for all pages-->
                <script src="js/sb-admin-2.min.js"></script>

                <!-- Page level plugins -->
                <script src="vendor/datatables/jquery.dataTables.min.js"></script>
                <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

                <!-- Page level custom scripts -->
                <script src="js/datatables-demo.js"></script>
        </body>

    </html>
