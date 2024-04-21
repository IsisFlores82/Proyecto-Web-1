<%-- 
    Document   : index
    Created on : 8 abr 2024, 19:29:38
    Author     : cdpin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign In</title>

  <link rel="stylesheet" href="SignIn.css">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;700&display=swap" rel="stylesheet">

</head>


<body>
  
  <section>

    <form for="formLogin" action="LoginServlet" method="post">

      <div class="Pop-up">
      
        <div class="img-logo container">
          <img class="logo" src="Imageees/Steam_icon_logo.svg.png" alt="">
          <p>Steam</p>
        </div>
        <div>
          <p> <strong>Sign In</strong> </p>
        </div>
  
        <br>
  
           <% if (request.getAttribute("error") != null) { %>
           <div class="error-message" style="width: 80%;">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <div class="input-container">
          <input type="email" id="email" class="input" name="fusuario" required>
          <label class="placeholder" for="email" > Email </label>
        </div>
  
        <div class="input-container">
          <input type="text" id="pass" class="input"  name="fcontra"required>
          <label class="placeholder" for="pass"> Password </label>
        </div>
        
        
        <div class="signin-extras">
  
          <div class="container">
            <input type="checkbox" class="cheeck">
            <p class="remember-me">Remember me</p>
          </div>
  
          <div class="container">
            <a class="forget-pass " href="">Forget me password</a>
          </div>
                  
        </div>
        
        
        <button class="sign-in submit">
            Sign In
        </button>
        
  
        <p class="text-muted">O create an acount</p>
        
        <a href="CreateAcount.jsp" class="create">Create Acount</a>
        
  
      </div>


    </form>

    

  </section>


</body>



</html>
