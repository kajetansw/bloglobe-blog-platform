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
    
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>
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
    <header class="bg-primary text-white p-3">
        <div class="container">
            <h2><i class="fa fa-user"></i> Welcome, ${currentUser.firstName}!</h2>
        </div>
    </header>
    
    <!-- BUTTONS -->
    <section class="py-4">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-3">
    				<button type="button" class="btn btn-success btn-block" data-toggle="modal" data-target="#add-post-modal">
    					<i class="fa fa-plus"></i> Add Post
    				</button>
    			</div>
    		</div>
    	</div>
    </section>

	<!-- LIST POSTS -->
    <section id="posts" class="mt-2">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-9">
    				<div class="card">
    					<div class="card-header">
    						<h4>Your latest posts:</h4>
    					</div>
    					
    					<div class="card-body m-1">
    						<table id="users-posts-table" class="table table-hover table-light">
		    					<thead class="thead-dark">
		    						<tr>
		    							<th style="width:50%;">Title</th>
		    							<th>Date</th>
		    							<th>Author</th>
		    						</tr>
		    					</thead>
		    					
		    					<tbody>
		    						<c:forEach var="tempPost" items="${ currentUsersPosts }">
		    							<tr class='clickable-row' data-href='bg/view-post?id=${tempPost.id}'>
		    								<td>${ tempPost.title }</td>
		    								<td>${tempPost.date.toLocalDate()} ${tempPost.date.withSecond(0).toLocalTime()}</td>
		    								<td>${ tempPost.user.firstName } ${ tempPost.user.lastName }</td>
		    							</tr>
		    						</c:forEach>
		    					</tbody>
		    				</table>
    					</div>
	    				
	    				<div id="no-posts-warning" class="p-3" style="display:none;">
	    					<h2>You have yet to write Your own post! :)</h2>
		    				<br>
		    				<h5>Press green button above to do it now!</h5>
	    				</div>
    				</div>
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
    
    <!-- POST MODAL -->
	<div class="modal fade" id="add-post-modal" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary text-white">
					<h5>Add Post</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<form:form action="${pageContext.request.contextPath}/bg/save-post" modelAttribute="post" 
							id="add-post-form" method="POST">
							
						<form:hidden path="id"/>
						<form:hidden path="user.username"/>
						<form:hidden path="date"/>
						
						<div class="form-group">
							<label for="input-post-title">Title</label>
							<form:input path="title" type="text" class="form-control" id="input-post-title"/>
						</div>
						
						<div class="form-group">
							<label for="input-post-content">Content</label>
							<form:textarea path="content" id="input-post-content" rows="5" class="form-control"></form:textarea>
						</div>
						
					</form:form>
				</div>
				
				<div class="modal-footer">
                    <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success" form="add-post-form">Save Changes</button>
                </div>
			</div>
		</div>
	</div>
	


    <!-- SCRIPTS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>
    
    <script>
        CKEDITOR.replace( 'content' );
        
        $(function($) {
            $(".clickable-row").click(function() {
                window.location = $(this).data("href");
            });
            $(".clickable-row").css("cursor", "pointer");
            
            // if table is not empty enable DataTable() plugin
            if ($('#users-posts-table tr').length - 2 > 0) {
            	$('#users-posts-table').DataTable({
                    "order": [[ 1, "desc" ]]
                });
            }
            
            // if table is empty get rid of table and display warning
            if ($('#users-posts-table tr').length - 1 === 0) {
            	$('#users-posts-table').css('display', 'none');
            	$('#no-posts-warning').css('display', 'inline');
            }
        });
    </script>
</body>
</html>