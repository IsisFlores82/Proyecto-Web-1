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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  
</head>


<body>
  
  <section>

    <form id="formCreateUser" action="RegistrarUsuarioServlet" method="post" enctype="multipart/form-data">

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
            <input type="text" id="idname" class="input-name" name="name" required>
            <label class="placeholder" for="name" > name </label>
          </div>
  
          <div class="input-container">
            <input type="text" id="idpname" class="input-name" name="pname" required>
            <label class="placeholder" for="pname" > paternal surname </label>
          </div>
            
           <div class="input-container">
            <input type="text" id="idmname" class="input-name" name="mname" required>
            <label class="placeholder" for="mname" > maternal surname </label>
          </div>
        </div>
        
        <div class="input-container">
          <input type="text" id="idusername" class="input" name="username" required>
          <label class="placeholder" for="username" > username </label>
        </div>
  
  
        <div class="input-container">
          <input type="email" id="idemail" class="input" name="email" required>
          <label class="placeholder" for="email" > email </label>
        </div>
  
        <div class="input-container">
          <input type="text" id="idpass" class="input" name="pass" required>
          <label class="placeholder" for="pass"> password </label>
        </div>

        <div class="input-container">
          <input type="text" id="idcpass" class="input" name="cpass" required>
          <label class="placeholder" for="cpass"> confirm password </label>
        </div>
        
        

        <div class="namee">
          
  
          <div class="input-container">
             <input type="date" class="input-name" id="idfechaNacimiento" name="fechaNacimiento" required>
          </div>

          <div class="input-container label-photo">
            <label for="idphoto-file">Select Photo</label>
            <input type="file" id="idphoto-file" name="photo-file" class="input-name" accept="image/*" required>
            </div>
            
            <div class="input-container">
                <img src="" id="imgPerfil" class="img-thumbnail">
            </div> 

  
        </div>

       
        <br>
        <% if (request.getAttribute("error") != null) { %>
          <div class="error-message">
        <%= request.getAttribute("error") %>
       </div>
        <% } %>

        <button class="create submit">Create Acount</button>
        <p class="text-muted">I alredy have an acount</p>
        <a href="SignIn.jsp" class="sign-in" id="signIn">Sign In</a>
  
      </div>


    </form>

    

  </section>

<script>
  document.getElementById('idfechaNacimiento').addEventListener('change', function() {
    var selectedDate = new Date(this.value);
    var currentDate = new Date();

    if (selectedDate > currentDate) {
      alert('La fecha no puede ser mayor que la fecha actual.');
      this.value = ''; // Limpiar el valor del campo de fecha
    }
  });
  document.getElementById('idphoto-file').addEventListener('change', function(){
      var archivos = $("#idphoto-file")[0].files;
      const primerArchivo = archivos[0];
      let url= URL.createObjectURL(primerArchivo);
      const img=document.getElementById('imgPerfil');
      img.src=url;
  });
  document.getElementById('formCreateUser').addEventListener('submit', function(event) {
    var name = document.getElementById('idname').value;
    var paternalSurname = document.getElementById('idpname').value;
    var maternalSurname = document.getElementById('idmname').value;
    var password = document.getElementById('idpass').value;
    var confirmPassword = document.getElementById('idcpass').value;
    var email = document.getElementById('idemail').value;
    
    if (!validateAlphabetic(name)) {
      alert('El nombre solo debe contener caracteres alfabéticos.');
      event.preventDefault();
      return;
    }

    if (!validateAlphabetic(paternalSurname)) {
      alert('El apellido paterno solo debe contener caracteres alfabéticos.');
      event.preventDefault();
      return;
    }

    if (!validateAlphabetic(maternalSurname)) {
      alert('El apellido materno solo debe contener caracteres alfabéticos.');
      event.preventDefault();
      return;
    }

    if (!validateEmail(email)) {
       alert('Por favor, introduce un correo electrónico válido.');
       event.preventDefault(); 
       return;
    }

    if (!validatePassword(password)) {
      alert('La contraseña no cumple con los requisitos.');
      event.preventDefault();
      return;
    }

    if (password !== confirmPassword) {
      alert('La confirmación de contraseña no coincide con la contraseña ingresada.');
      event.preventDefault();
      return;
    }
  });

  function validateAlphabetic(value) {
    var regex = /^[a-zA-ZáéíóúüñÁÉÍÓÚÜÑ\s]+$/;
    return regex.test(value);
  }
  
  function validatePassword(value) {
    var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$/;
    return regex.test(value);
  }
  function validateEmail(value){
  var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return regex.test(value);
  }
</script>
</body>



</html>
