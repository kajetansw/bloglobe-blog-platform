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

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navCollapseContent" >
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navCollapseContent">
                <ul class="navbar-nav">
                    <li class="nav-item px-2">
                        <a href="${pageContext.request.contextPath}/bg" class="nav-link">Dashboard</a>
                    </li>

                    <li class="nav-item px-2">
                        <a href="${pageContext.request.contextPath}/bg/posts" class="nav-link">Posts</a>
                    </li>

                    <li class="nav-item px-2">
                        <a href="${pageContext.request.contextPath}/bg/users" class="nav-link">Users</a>
                    </li>
                </ul>
                
                <ul class="navbar-nav ml-auto">
                	<li class="nav-item dropdown mr-3">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-user"></i> ${currentUser.firstName} ${currentUser.lastName}
                        </a>

                        <div class="dropdown-menu">
                            <a href="${pageContext.request.contextPath}/bg/edit-profile" class="dropdown-item">
                                <i class="fa fa-gear"></i> Edit Profile
                            </a>
                            <form:form id="logout-form" action="${pageContext.request.contextPath}/logout" method="POST" cssClass="pl-3">
								<a href="javascript:{}" class="ml-auto nav-link dropdown-item text-dark" onclick="document.getElementById('logout-form').submit(); return false;">
		                        	<i class="fa fa-times"></i> Logout
		                        </a>
							</form:form>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- HEADER -->
    <header class="bg-danger text-white p-3">
        <div class="container">
            <h2><i class="fa fa-times"></i> Access Denied - You are not authorized to access this resource.</h2>
        </div>
    </header>
    
    <!-- BUTTONS -->
    <section class="py-4">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-3">
    				<a href="${pageContext.request.contextPath}/bg" class="btn btn-outline-secondary btn-block my-1">
    					<i class="fa fa-arrow-left"></i> Back To Dashboard
    				</a>
    			</div>
    		</div>
    	</div>
    </section>
    
    <!-- Add some free space -->
    <div style="height: 5rem;"></div>

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