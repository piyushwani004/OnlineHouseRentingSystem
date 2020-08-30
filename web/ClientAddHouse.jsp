<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <title>House Registration</title>
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

        <div class="Cheadline">
            <%
                HttpSession sess = request.getSession(false);
                sess.getAttribute("fname");

            %>
            <h1> ${fname}</h1>
        </div>

        <section class="regform">
            <form action="<%=request.getContextPath()%>/ClientRegister" method="post">
                <div class="form-row" >
                    <div class="col-md-4 mb-3">
                        <label for="validationServer01">House name</label>
                        <input type="text" class="form-control is-valid" name="hname" id="validationServer01" placeholder="House name" required>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationServer02">Category</label>
                        <input type="text" class="form-control is-valid" name="category" id="validationServer02" placeholder="Category"  required>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
                    <div class="col-md-3 mb-2">
                        <label for="validationServer04">Bedroom</label>
                        <input type="text" class="form-control is-invalid" name="bedroom" id="validationServer04" placeholder="Bedroom" required>
                        <div class="invalid-feedback">
                            Please provide a valid state.
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationServer02">Email</label>
                        <input type="text" class="form-control is-valid" name="email" id="validationServer02" placeholder="Email"  required>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationServer04">City</label>
                        <input type="text" class="form-control is-invalid" name="city" id="validationServer04" placeholder="City" required>
                        <div class="invalid-feedback">
                            Please provide a valid city.
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationServer05">Mobile</label>
                        <input type="text" class="form-control is-invalid" name="mobile" id="validationServer05" placeholder="Mobile" required>
                        <div class="invalid-feedback">
                            Please provide a valid mobile number.
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationServer03">Address</label>
                        <input type="text" class="form-control is-invalid" name="address" id="validationServer03" placeholder="Address" required>
                        <div class="invalid-feedback">
                            Please provide a valid address.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="validationServer03">Description</label>
                        <input type="text" class="form-control is-invalid" name="description" id="validationServer03" placeholder="Description" required>
                        <div class="invalid-feedback">
                            Please provide a valid description.
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <label for="validationServer04">House Image</label>
                    <input type="file"
                           id="avatar" name="avatar"
                           accept="image/png, image/jpeg">
                    <div class="invalid-feedback">
                        Please provide a PNG/JPEG Image.
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input is-invalid" type="checkbox" name="check" id="invalidCheck3" required>
                        <label class="form-check-label" for="invalidCheck3">
                            Agree to terms and conditions
                        </label>
                        <div class="invalid-feedback">
                            You must agree before submitting.
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary" type="submit">Submit form</button>
            </form>
        </section>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>