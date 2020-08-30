<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <title>OnlineHouseRentingSystem</title>
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <style>
            body { 
                background: url(img/i2.jpg) no-repeat center center fixed; 
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
            .heading{
                display: flex;
                align-items: flex-start;
                justify-content: center;
                position: relative;
                color: bisque;
                font-family: serif;
                font-size: 50px;
                font-style: oblique;
                font-weight: bold ;
            }
            .regform{
                padding: 20px;
                margin: 20px;
                background-color: #transparent;


            }
            .Cheadline{
                color: gold;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-top: 5px;
            }
            label{
                color: white;
                font-size: 18px;
                font-style: italic;
                font-family: cursive;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm navbar-light" style="background-color: #e3f2fd;">
            <a class="navbar-brand" href="index.html">House-Renting</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav ml-auto" style="margin-right: 20px;">
                    <a class="nav-item nav-link active" href="ClientAddHouse.jsp">Add House</a>
                    <a class="nav-item nav-link active" href="">View</a> 
                    <a class="nav-item nav-link active" href="clientLogin.jsp">LogOut</a> 
                </div>
            </div>
        </nav>
        <div class="heading">
            <%
                HttpSession sess = request.getSession(false);
                sess.getAttribute("fname");

            %>
            <h1> Welcome ${fname}</h1>
        </div>
        


        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>