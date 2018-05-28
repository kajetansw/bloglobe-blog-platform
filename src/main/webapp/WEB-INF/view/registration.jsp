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
    <section class="py-4">
        <div class="container">
            <div class="row justify-content-center">
                 <div class="col-md-10">
                    <div class="card card-lg">
                        <div class="card-header">
                            Please, fill in the form:
                        </div>

                        <div class="card-body">
                            <form:form action="${pageContext.request.contextPath}/register/process"
                            		method="POST" modelAttribute="newUser" id="reg-form">
                            		
                            	<!-- Check for registration error -->	
                            	<div class="form-group text-danger">
                                   	<c:if test="${registrationError != null}">
                                   		<div class="card card-body text-center bg-light"> ${registrationError} </div>
                                   	</c:if>
                                </div>
                            		
                                <div class="row">
                                	<div class="col-md-6">
	                                	<div class="form-group">
		                                    <label for="username">Username</label> *
		                                    <input id="username-input" type="text" class="form-control" name="username"
		                                    	data-validation="alphanumeric lenght" data-validation-length="min3"
		                                    	data-validation-error-msg="">
		                                    <div class="text-danger">
		                                    	<i><form:errors path="username"></form:errors></i> 
		                                    </div>
		                                </div>
		
		                                <div class="form-group">
		                                    <label for="password">Password</label> *
		                                    <input id="password-input" type="password" class="form-control" name="password"
		                                    	data-validation="length" data-validation-length="min1"
		                                    	data-validation-error-msg="">
		                                    <div class="text-danger">
		                                    	<i><form:errors path="password"></form:errors></i> 
		                                    </div>
		                                </div>
	                                </div>
	                                
	                                <div class="col-md-6">
		                                <div class="form-group">
		                                    <label for="email">Email</label> *
		                                    <input id="email-input" type="email" class="form-control" name="email"
		                                    	data-validation="email" data-validation-error-msg="">
		                                    <div class="text-danger">
		                                    	<i><form:errors path="email"></form:errors></i> 
		                                    </div>
		                                </div>
		
		                                <div class="form-group">
		                                    <label for="firstName">First Name</label> *
		                                    <input id="firstName-input" type="text" class="form-control" name="firstName"
		                                    	data-validation="alphanumeric lenght" data-validation-length="min3"
		                                    	data-validation-error-msg="">
		                                    <div class="text-danger">
		                                    	<i><form:errors path="firstName"></form:errors></i> 
		                                    </div>
		                                </div>
		
		                                <div class="form-group">
		                                    <label for="lastName">Last Name</label> *
		                                    <input id="lastName-input" type="text" class="form-control" name="lastName" 
		                                    	data-validation="alphanumeric lenght" data-validation-length="min3"
		                                    	data-validation-error-msg="">
		                                    <div class="text-danger">
		                                    	<i><form:errors path="lastName"></form:errors></i> 
		                                    </div>
		                                </div>
	                                </div>
                                </div>
                                
                                <div class="form-group">
                                	<input id="terms-checkbox" type="checkbox" data-validation="required" 
										data-validation-error-msg="You have to agree to our terms">
									I agree to the <strong>terms of service</strong>
                                </div>

                                <hr>
                                
								(*) Mandatory fields                                
                                
                                <hr>

                                <div class="row">
	                                <div class="col-md-6 py-2">
	                                	 <a href="${pageContext.request.contextPath}/bg" class="btn btn-outline-secondary btn-block">
					    					<i class="fa fa-arrow-left"></i> Back To Login
					    				</a>
	                                </div>
	                                
                                	<div class="col-md-6 py-2">
                                		<input form="reg-form" type="submit" class="btn btn-primary btn-block" value="Register Now!">
                                	</div>
                                </div>
                                
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
    <footer class="footer bg-dark text-muted text-center p-3 fixed-bottom">
        <div class="container">
            Copyright &copy; Kajetan Swiatek, 2018 
        </div>
    </footer>



    <!-- SCRIPTS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
    
    <script type="text/javascript">
	    $.validate({
	   	  modules : 'security',
	   	  onModulesLoaded : function() {
	   	    var optionalConfig = {
	   	      fontSize: '12pt',
	   	      padding: '4px',
	   	      margin: '3px',
	   	      bad : 'Very bad',
	   	      weak : 'Weak',
	   	      good : 'Good',
	   	      strong : 'Strong'
	   	    };
	
	   	    $('input[name="password"]').displayPasswordStrength(optionalConfig);
	   	  }
	   	});
	    
	    $( "#password-input, #firstName-input, #lastName-input" ).attr( "data-validation-error-msg", "<span class=\"text-danger\">Field must not be empty</span>" );
	    $( "#username-input" ).attr( "data-validation-error-msg", "<span class=\"text-danger\">Field must be at least 3 characters long</span>" );
	    $( "#email-input" ).attr( "data-validation-error-msg", "<span class=\"text-danger\">Invalid email format</span>" );
	    $( "#terms-checkbox" ).attr( "data-validation-error-msg", "<span class=\"text-danger\"><br>You have to agree to our terms</span>" );
	    $( "span.strength-meter" ).css("display", "block");
    </script>
</body>
</html>