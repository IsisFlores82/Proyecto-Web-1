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

function editarPerfil() {
  // Obtener los valores de los campos ocultos
  var userId = document.getElementById("EPId" ).value;
  var name = document.getElementById("Ename" ).value;
  var occupation = document.getElementById("Eoccupation" ).value;
  var plastname = document.getElementById("Eplastname" ).value;
  var mlastname = document.getElementById("Emlastname" ).value;
  var location = document.getElementById("Elocation" ).value;
  var birthdate = document.getElementById("Ebirthdate" ).value;
  var description = document.getElementById("Edescription").value;

  // Llenar el modal con los valores obtenidos
  document.getElementById("EPIdF").value = userId;
  document.getElementById("name").value = name;
  document.getElementById("occupation").value = occupation;
  document.getElementById("plastname").value = plastname;
  document.getElementById("mlastname").value = mlastname;
  document.getElementById("location").value = location;
  document.getElementById("birthdate").value = birthdate;
  document.getElementById("description").value = description;
  

  // Abrir el modal
  var modalE = document.getElementById("modal");
  modalE.style.display = "block";
}

function validacionBusqueda(){
    var texto = document.getElementById("busqueda").value.trim();
    if (texto.length > 60) {
        alert('Total de caracteres de busqueda exedidos');
        return false; // Prevent form submission
    }
    if (texto === "") {
        alert("Por favor, ingresa algo en el campo de búsqueda.");
        return false; // Evitar el envío del formulario
    }
    return true; // Allow form submission
}

 function obtenerDatosUsuario(idPublicacion) {
    // Obtener el valor oculto de la publicación utilizando su ID
    var userId = document.getElementById("EuserId_" + idPublicacion).value;
    document.getElementById("UPId").value = userId;
    // Aquí puedes hacer lo que necesites con el ID de usuario obtenido
    console.log("ID de usuario de la publicación:"+ userId);
    console.log("Ola el perfil de este tilin sin cebolla por favor");
    console.log("la id en el hidden es esta btw: "+document.getElementById("UPId").value);
    toUserProfile();
}

function toUserProfile(){
    var userId = document.getElementById("UPId").value;
    console.log("ID de usuario de la publicación:"+ userId);
    // Construir la URL del servlet con el parámetro UPId
    var currentUserId = document.getElementById("IDS").value;
    console.log("ID de usuario session:"+ currentUserId);
    // Verificar si el usuario actual y el usuario del perfil tienen la misma ID
    if (parseInt(userId) === parseInt(currentUserId)) {
        // Redirigir al servlet ProfileServlet
        window.location.href = 'ProfileServlet';
    } else {
        // Construir la URL del servlet UserProfileServlet con el parámetro UPId
        var url = 'UserProfileServlet?UPId=' + userId;
        // Redirigir al servlet UserProfileServlet
        window.location.href = url;
    }
}

  