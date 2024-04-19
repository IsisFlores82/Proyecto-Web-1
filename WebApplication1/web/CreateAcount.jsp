<%-- 
    Document   : CreateAcount
    Created on : 18 abr 2024, 18:17:39
    Author     : cdpin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> Create Acount</title>

  <link rel="stylesheet" href="CreateAcount.css">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;700&display=swap" rel="stylesheet">

</head>


<body>
  
  <section>

    <form action="">

      <div class="Pop-up">
      
        <div class="img-logo container">
          <img class="logo" src="Imageees/Steam_icon_logo.svg.png" alt="">
          <p>Steam</p>
        </div>
        <div>
          <p> <strong>Create Acount</strong> </p>
        </div>
  
        <br>

        <div class="namee">
          <div class="input-container">
            <input type="text" id="name" class="input-name" name="username" required>
            <label class="placeholder" for="name" > name </label>
          </div>
  
          <div class="input-container">
            <input type="text" id="lname" class="input-name" name="username" required>
            <label class="placeholder" for="lname" > last name </label>
          </div>
  
        </div>
        
        <div class="input-container">
          <input type="text" id="username" class="input" name="username" required>
          <label class="placeholder" for="username" > username </label>
        </div>
  
  
        <div class="input-container">
          <input type="email" id="email" class="input" name="email" required>
          <label class="placeholder" for="email" > email </label>
        </div>
  
        <div class="input-container">
          <input type="text" id="pass" class="input" name="password" required>
          <label class="placeholder" for="pass"> password </label>
        </div>

        <div class="input-container">
          <input type="text" id="pass" class="input" name="password" required>
          <label class="placeholder" for="pass"> confirm password </label>
        </div>
        
        

        <div class="namee">
          
  
          <div class="input-container">
            <input type="date" class="input-name" required>
          </div>

          <div class="input-container  label-photo">
            <label for="photo-file">Select Photo</label>
            <input type="file" id="photo-file" class="input-name" required>
          </div>
  
        </div>

       
        <br>
        <button class="create submit">Create Acount</button>
        <p class="text-muted">I alredy have an acount</p>
        <a href="SignIn.jsp" class="sign-in" id="signIn">Sign In</a>
  
      </div>


    </form>

    

  </section>


</body>



</html>
