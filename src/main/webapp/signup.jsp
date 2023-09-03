<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>


<body style="background:url(image/r.jpg); background-size: cover; background-attachment: fixed;">
  <!-- Your page content goes here -->


<div class="container">
  <div class="row">
   <div class="col m6 offset-m3">
      
      <div class="card ">
         <div class="card-content">
            <h3 style="margin-top: 10px;" class="center-align">Register Here</h3>
            <h5 id="msg" class="center-align"></h5>
            
            <div class="form  center-align">
            
            <!-- creating form -->
            
            
            <form action="Register" method="post" id="myform">
            
             <input type="text"  name="user_name"  placeholder="Enter your name"/>
             <input type="text"  name="user_password"  placeholder="Enter your password"/>
             <input type="text"  name="user_email"  placeholder="Enter your email-id"/>
             
                <div class="file-field input-field">
                  <div class="btn">
                    <span>File</span> 
                    <input  name="image" type="file">
                  </div>
                  <div class="file-path-wrapper">
                    <input class="file-path validate" type="text">
                  </div>
                </div>


                <button type="submit" class="btn  teal darken-2">Submit</button>
             </form>
            </div>
            
            <div class="loader center-align" style="margin-top: 20px; display: none">
            
             <div class="preloader-wrapper active">
                 <div class="spinner-layer spinner-red-only">
                    <div class="circle-clipper left">
                      <div class="circle"></div>
                     </div><div class="gap-patch">
                      <div class="circle"></div>
                      </div><div class="circle-clipper right">
                        <div class="circle"></div>
                </div>
               </div>
             </div>
               <h5>Please wait...</h5>
            </div>
           
         
         
         </div>
      
      
      
      </div>
   
   </div>
  
  </div>


</div>

<script
  src="https://code.jquery.com/jquery-3.7.0.min.js"
  integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
  crossorigin="anonymous"></script>


 <script>
		$(document).ready(function() {

			console.log("Page is ready")

			$("#myform").on('submit', function(event) {

				event.preventDefault();

//				var f = $(this).serialize();

                let f = new FormData(this);

				console.log(f);
				
				$(".loader").show();
				$(".form").hide();

				$.ajax({
					url : "Register",
					data : f,
					type : 'POST',
					success : function(data, textStatus, jqXHR) {
						console.log(data);
						console.log("Success.....");
						$(".loader").hide();
						$(".form").show();
						
						if(data.trim()==='done'){
							
							$("#msg").html("Successfully Registered !!")
							$("#msg").addClass('green-text')
							
						}else{
							$("#msg").html("Something went wrong on server !!")
							$("#msg").addClass('red-text')
						}


					},

					error : function(jqXHR, textStatus, errorThrown) {

						console.log(jqXHR.responseText);
						console.log("Error.....");
						$(".loader").hide();
						$(".form").show();
						$("#msg").html("Something went wrong on server !!")
						$("#msg").addClass('red-text')


					},
					
					processData: false,
					contentType: false
					

				})

			})

		})
	</script>



</body>
</html>