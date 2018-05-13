<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Bloglobe - Kajetan Swiatek</title>

    <!-- BOOTSTRAP LINK -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

    <!-- NAVIGATION BAR -->
    <nav class="navbar navbar-expand-md navbar-dark bg-dark py-1">
        <div class="container">
            <a href="${pageContext.request.contextPath}/bg" class="navbar-brand">
                <i class="fa fa-paper-plane pr-1"></i> Bloglobe
            </a>
        </div>
    </nav>

    <!-- HEADER -->
    <header class="bg-primary text-white p-3">
        <div class="container">
            <h2><i class="fa fa-user"></i> Registration Form</h2>
        </div>
    </header>

    <!-- REGISTRATION FORM -->
    <section class="py-5">
        <div class="container">
            <div class="row justify-content-center">
                 <div class="col-md-5">
                    <div class="card">
                        <div class="card-header">
                            Please, fill in the form:
                        </div>

                        <div class="card-body">
                            <form:form action="${pageContext.request.contextPath}/register/process"
                            		method="POST" modelAttribute="newUser">
                            		
                            	<!-- Check for registration error -->	
                            	<div class="form-group text-danger">
                                   	<c:if test="${registrationError != null}">
                                   		<div class="card card-body text-center bg-light"> ${registrationError} </div>
                                   	</c:if>
                                </div>
                            		
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" name="username">
                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" name="password">
                                </div>

                                <div class="form-group">
                                    <label for="firstName">First Name</label>
                                    <input type="text" class="form-control" name="firstName">
                                </div>

                                <div class="form-group">
                                    <label for="lastName">Last Name</label>
                                    <input type="text" class="form-control" name="lastName">
                                </div>

                                <hr>

                                <input type="submit" class="btn btn-primary btn-block" value="Register Now!">
                                <a href="${pageContext.request.contextPath}/bg" class="btn btn-outline-secondary btn-block my-3">
			    					<i class="fa fa-arrow-left"></i> Back To Login
			    				</a>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Add some free space -->
    <div style="height: 5rem;"></div>

    <!-- FOOTER -->
    <footer class="footer bg-dark text-muted text-center p-4 fixed-bottom">
        <div class="container">
            Copyright &copy; Kajetan Swiatek, 2018 
        </div>
    </footer>



    <!-- BOOTSTRAP SCRIPTS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>