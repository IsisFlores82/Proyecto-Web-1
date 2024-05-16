/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function toProfile(user) {
    if(user){
        console.log("Ola un perfil con todo por favor");
        window.location.href = 'ProfileServlet';
    } else{
        window.location.href = 'SignIn.jsp';
    }
}

function toHome(){
    window.location.href = 'LoadPublicacionesServlet';
}

function confirmacionBorrarPost(){
    var confirmacion = window.confirm("¿Estás seguro de que quieres borrar esta publicación?");
    
    // Retornar true si el usuario confirma, false si cancela
    return confirmacion;
}

function editarPublicacion(ID) {
  // Obtener los valores de los campos ocultos
  var postId = document.getElementById("EpostId_"+ID).value;
  var userId = document.getElementById("EuserId_"+ID).value;
  var title = document.getElementById("Etitle_"+ID).value;
  var content = document.getElementById("Econtent_"+ID).value;
  var NImg = document.getElementById("ENimg_"+ID).value;
  var img = document.getElementById("Eimg_"+ID).value;
  var catId = document.getElementById("EcatId_"+ID).value;
  console.log("Valor de catId:", catId);
  // Llenar el modal con los valores obtenidos
  document.getElementById("idpostTitle").value = title;
  document.getElementById("postContent").value = content;
  document.getElementById("EpostId").value = postId;
  document.getElementById("EuserId").value = userId;
var selectElement = document.getElementById("clasification");

// Recorrer las opciones del select
for (var i = 0; i < selectElement.options.length; i++) {
    console.log("Valor de selectElement.options[i].value:", selectElement.options[i].value);
    console.log("Valor de catId.toString():", catId.toString());
    // Verificar si el valor de la opción coincide con el catId
    if (parseInt(selectElement.options[i].value) === parseInt(catId)) {
        // Establecer la opción como seleccionada
        selectElement.options[i].selected = true;
        // Romper el bucle una vez que se haya encontrado la coincidencia
        break;
    }
}

// Mostrar la vista previa de la imagen si existe
    if (NImg) {
        document.getElementById("imagePreview").src = NImg;
        document.getElementById("imagePreview").style.display = "block";
    } else if (img) {
        var reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById("imagePreview").src = e.target.result;
            document.getElementById("imagePreview").style.display = "block";
        };
        reader.readAsDataURL(img);
    } else {
        // Si no hay ninguna imagen, ocultar la vista previa
        document.getElementById("imagePreview").style.display = "none";
    }
    
  // Abrir el modal
  var modalE = document.getElementById("modalEditarPost");
  modalE.style.display = "block";
}

