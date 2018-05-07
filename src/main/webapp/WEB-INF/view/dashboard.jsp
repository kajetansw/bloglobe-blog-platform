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
            <a href="/" class="navbar-brand">
                <i class="fa fa-paper-plane pr-1"></i> Bloglobe
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navCollapseContent" >
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navCollapseContent">
                <ul class="navbar-nav">
                    <li class="nav-item px-2">
                        <a href="/" class="nav-link">Dashboard</a>
                    </li>

                    <li class="nav-item px-2">
                        <a href="/posts" class="nav-link">Posts</a>
                    </li>

                    <li class="nav-item px-2">
                        <a href="/" class="nav-link">Users</a>
                    </li>
                </ul>
                
                <ul class="navbar-nav ml-auto">
                	<li class="nav-item px-2">
                        <form:form id="logout-form" action="${pageContext.request.contextPath}/logout" method="POST">
							<a href="javascript:{}" class="ml-auto nav-link" onclick="document.getElementById('logout-form').submit(); return false;">
	                        	<i class="fa fa-times"></i> Logout
	                        </a>
						</form:form>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- HEADER -->
    <header class="bg-primary text-white p-3">
        <div class="container">
            <h2><i class="fa fa-user"></i> Welcome!</h2>
        </div>
    </header>

	<!-- LIST POSTS -->
    <section id="posts" class="mt-4">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-9">
    				<div class="card">
    					<div class="card-header">
    						<h4>Latest Posts</h4>
    					</div>
    					
    					<table class="table table-striped table-hover">
	    					<thead class="thead-dark">
	    						<tr>
	    							<th>Title</th>
	    							<th>Date</th>
	    							<th>Author</th>
	    						</tr>
	    					</thead>
	    					
	    					<tbody>
	    						<c:forEach var="tempPost" items="${ posts }">
	    							<tr>
	    								<td>${ tempPost.title }</td>
	    								<td>${ tempPost.date }</td>
	    								<td>${ tempPost.user.firstName } ${ tempPost.user.lastName }</td>
	    							</tr>
	    						</c:forEach>
	    					</tbody>
	    				</table>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>
    
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