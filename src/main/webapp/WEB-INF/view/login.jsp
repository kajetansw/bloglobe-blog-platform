<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <h2><i class="fa fa-user"></i> Welcome!</h2>
        </div>
    </header>

    <!-- LOGIN FORM -->
    <section class="py-5">
        <div class="container">
            <div class="row justify-content-center">
                 <div class="col-md-5">
                    <div class="card">
                        <div class="card-header">
                            Please, log in:
                        </div>

                        <div class="card-body">
                            <form:form action="${pageContext.request.contextPath}/authenticate-user"
                            		method="POST">
                            	
                            	<!-- Check for login error -->	
                            	<div class="form-group text-danger">
                                   	<c:if test="${param.error != null }">
                                   		<div class="card card-body text-center bg-light"> <i>Invalid username and/or password.</i> </div>
                                   	</c:if>
                                </div>
                                
                                <!-- Check for logout -->	
                            	<div class="form-group text-success">
                                   	<c:if test="${param.logout != null }">
                                   		<div class="card card-body text-center bg-light"> <i>You have been successfully logged out.</i> </div>
                                   	</c:if>
                                </div>
                                
                                <!-- Username -->
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" name="username">
                                </div>

								<!-- Password -->
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" name="password" class="form-control">
                                </div>

                                <hr>

								<!-- Login Button -->
                                <input type="submit" class="btn btn-primary btn-block" value="Login">
                                
                                <!-- Registration Button -->
                                <a href="${pageContext.request.contextPath}/register/" class="btn btn-warning btn-block">Create new account</a>
                            
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FOOTER -->
    <footer class="footer bg-dark text-muted text-center p-3 fixed-bottom">
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