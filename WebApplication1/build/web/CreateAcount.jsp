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
            <input type="text" id="idname" class="input-name" name="name" required maxlength="60">
            <label class="placeholder" for="idname" id="labelName"> Name </label>
          </div>
  
          <div class="input-container">
            <input type="text" id="idpname" class="input-name" name="pname" required maxlength="30">
            <label class="placeholder" for="idpname" id="labelPat"> Paternal surname </label>
          </div>
            
           <div class="input-container">
            <input type="text" id="idmname" class="input-name" name="mname" required maxlength="30">
            <label class="placeholder" for="idmname" id="labelMat"> Maternal surname </label>
          </div>
        </div>
        
        <div class="input-container">
          <input type="text" id="idusername" class="input" name="username" required maxlength="30">
          <label class="placeholder" for="idusername" id="labelUser"> Username </label>
        </div>
  
  
        <div class="input-container">
          <input type="email" id="idemail" class="input" name="email" required maxlength="40">
          <label class="placeholder" for="idemail" id="labelEmail" > Email </label>
        </div>
  
        <div class="input-container">
          <input type="password" id="idpass" class="input" name="pass" required maxlength="20">
          <label id="labPass" class="placeholder" for="idpass" > Password </label>
        </div>

        <div class="input-container">
          <input type="password" id="idcpass" class="input" name="cpass" required maxlength="20">
          <label id="labelPassAgain" class="placeholder" for="idcpass" > Repeat password </label>
        </div>
        
        

        <div class="namee extras">
          
  
          <div class="input-container">
             <input type="date" class="input-name" id="idfechaNacimiento" name="fechaNacimiento" required>
          </div>
          <div class="input-container label-photo ">
                
                 <label for="PortinputImage" class="icons-stile">
                            <p class="text-muted">Imagen Perfil <i class="uil uil-image"> </i></p>
                            
                        </label>
                 <input type="file" name="nPortinputImage" id="PortinputImage" style="display: none;">
                 <img id="imagePreviewPort" src="#" alt="Vista previa de la imagen" class="img-thumbnail" style="display: none; max-width: 100px;">
          
            
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
 
    
    //imagen preview
    
function mostrarVistaPreviaImagenPort(input) {
  var imgPreview = document.getElementById('imagePreviewPort');
  
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function(e) {
      imgPreview.src = e.target.result;
      console.log("Valor de imgPreview.src:", imgPreview.src);
      imgPreview.style.display = 'block';
    }

    reader.readAsDataURL(input.files[0]); // Lee el archivo como una URL de datos
  } else {
    imgPreview.style.display = 'none';
  }
}

// Evento para detectar cambios en el campo de carga de archivos
document.getElementById('PortinputImage').addEventListener('change', function() {
  mostrarVistaPreviaImagenPort(this);
});

//checa que haya datos en el los imputs para no mover el placeholder
$(document).ready(function() {
  $('#idname').on('change', function() {
   var inputValue = $(this).val();
        console.log('Valor del input:', inputValue);
        
        if(inputValue) {
          $('#labelName').removeClass('placeholder').addClass('placeholder-end');
        } else {
          $('#labelName').removeClass('placeholder-end').addClass('placeholder');
        }
  });
  
  $('#idpname').on('change', function() {
   var inputValue = $(this).val();
        console.log('Valor del input:', inputValue);
        
        if(inputValue) {
          $('#labelPat').removeClass('placeholder').addClass('placeholder-end');
        } else {
          $('#labelPat').removeClass('placeholder-end').addClass('placeholder');
        }
  });
  
   $('#idmname').on('change', function() {
   var inputValue = $(this).val();
        console.log('Valor del input:', inputValue);
        
        if(inputValue) {
          $('#labelMat').removeClass('placeholder').addClass('placeholder-end');
        } else {
          $('#labelMat').removeClass('placeholder-end').addClass('placeholder');
        }
  });
  
  $('#idusername').on('change', function() {
   var inputValue = $(this).val();
        console.log('Valor del input:', inputValue);
        
        if(inputValue) {
          $('#labelUser').removeClass('placeholder').addClass('placeholder-end');
        } else {
          $('#labelUser').removeClass('placeholder-end').addClass('placeholder');
        }
  });
  
  $('#idemail').on('change', function() {
   var inputValue = $(this).val();
        console.log('Valor del input:', inputValue);
        
        if(inputValue) {
          $('#labelEmail').removeClass('placeholder').addClass('placeholder-end');
        } else {
          $('#labelEmail').removeClass('placeholder-end').addClass('placeholder');
        }
  });
  
   $('#idpass').on('change', function() {
   var inputValue = $(this).val();
        console.log('Valor del input:', inputValue);
        
        if(inputValue) {
          $('#labPass').removeClass('placeholder').addClass('placeholder-end');
        } else {
          $('#labPass').removeClass('placeholder-end').addClass('placeholder');
        }
  });
  
  $('#idcpass').on('change', function() {
   var inputValue = $(this).val();
        console.log('Valor del input:', inputValue);
        
        if(inputValue) {
          $('#labelPassAgain').removeClass('placeholder').addClass('placeholder-end');
        } else {
          $('#labelPassAgain').removeClass('placeholder-end').addClass('placeholder');
        }
  });
      
});

</script>
</body>



</html>
