<%-- 
    Document   : MyProfile
    Created on : 18 abr 2024, 18:09:28
    Author     : cdpin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="entidades.Publicacion"%>
<%@page import="entidades.Usuarios" %>
<%Usuarios usuario = (Usuarios)session.getAttribute("Usuario");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Profile</title>
       <!--Bootstra--> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
     -->   
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="MyProfile.css">
  
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;700&display=swap" rel="stylesheet">  

     <script src="script.js"></script>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  </head>


<body >
<input type="hidden" id="EPId" name="EPId" value="<%= usuario.getIdUsuario() %>">
<input type="hidden" id="EPusername" name="EPusername" value="<%= usuario.getUsername() %>">
<input type="hidden" id="Ename" name="Ename" value="<%= usuario.getNombre() %>">
<input type="hidden" id="Eoccupation" name="Eoccupation" value="<%= usuario.getOcupacion() %>">
<input type="hidden" id="Eplastname" name="Eplastname" value="<%= usuario.getApellidoP() %>">
<input type="hidden" id="Emlastname" name="Emlastname" value="<%= usuario.getApellidoM() %>">
<input type="hidden" id="Elocation" name="Elocation" value="<%= usuario.getLocalizacion() %>">
<input type="hidden" id="Ebirthdate" name="Ebirthdate" value="<%= usuario.getFecha_Nacimiento() %>">
<input type="hidden" id="Edescription" name="Edescription" value="<%= usuario.getDescripcion() %>">


  <!----- TOP BAR ------>
  <nav class="header">

    <div class="container" >
      <img src="Imageees/Steam_icon_logo.svg.png" alt="" class="logo">
      <h1> Steam </h1>
    </div>

    <div class="search-bar-container" >
        <form id="searchForm" action="LoadPublicacionesServlet" method="post" onsubmit="return validacionBusqueda()">
          <button type="submit" class="search-button">
          <i class="uil uil-search"></i>
          </button>
         <input name="busqueda" id="busqueda" type="text" placeholder="Search something" class="search-bar">
         <i class="uil uil-filter text" id="openModalSearch"></i>
        </form>
    </div>

    <div class="container" id="side-photo">
      <a  href="#perfil" onclick="<%
        if(usuario != null) {
        %>toProfile(true)">
        <img src="${urlImagenPerfil}" alt="Imagen de perfil" class="profile-photo photo-nav">
        <%
            } else {
        %>toProfile(false)">
        <img src="Imageees/Steam_icon_logo.svg.png" alt="Imagen de perfil" class="profile-photo">
        <%
            }
        %>        
      </a>
      
    </div>

  </nav>


  <!------ MAIN ------>
  <main>
    <div class="container">

      <!----- SIDE BAR ------->
      <div class="left">
       
        <a href="#home" onclick="toHome()" class="a-sidebar">
          <span>
             <i class="uil uil-home text"></i>
             <h3 class="text">Home</h3>
          </span>
        </a>
          

       <a href="#perfil" onclick="<%
    if(usuario != null) {
%>toProfile(true)<%
    } else {
%>toProfile(false)<%
    }
%>" class="a-sidebar active">
        <span>
          <i class="uil uil-user text"></i>
          <h3 class="text">Profile</h3>
        </span>
       </a>
  
        <div class="profile">
            <%
         if(usuario != null) {
%><div class="user-data">
            <img src="${urlImagenPerfil}" alt="Imagen de perfil" class="profile-photo">
          </div>   
<%
    } else {
%><div class="user-data">
            <img src="Imageees/Steam_icon_logo.svg.png" alt="Imagen de perfil" class="profile-photo">
          </div><%
    }
%>
  
          <div class="user-name-navbar">
              <%
    if(usuario != null) {
%>
        <h3><%= usuario.getNombre() %></h3>
        <p class="text-muted">@<%= usuario.getUsername() %></p>
<%
    } else {
%>
        Usuario Invitado
<%
    }
%>
          </div>
  
          <div class="config" id="openModalConfig">
            <i class="uil uil-setting"></i>
          </div>
  
        </div>
  
        <button>
  
        </button>
      </div>
  
  <!-- Modal Editar -->
<div id="modalEditarPost" class="modal">
  <div class="modal-content">
    <span class="close" id="cl">&times;</span>
    <h3>Editar Publicación</h3>
    <form id="formEditarPost" action="EditarPublicacionServlet" method="post" enctype="multipart/form-data">
       <input type="hidden" id="EpostId" name="EpostId" value="">
       <input type="hidden" id="EuserId" name="EuserId" value="">
                            
      <div>
        <div class="profile-model-edit">
          <div class="user-data-edit">
            <img src="${urlImagenPerfil}" alt="Imagen de perfil" class="profile-photo-edit">
          </div>

          <div class="user-name">
            <% if(usuario != null) { %>
              <h3><%= usuario.getNombre() %></h3>
              <p class="text-muted">@<%= usuario.getUsername() %></p>
            <% } else { %>
              Sin Usuario
            <% } %>
          </div>
        </div>
      </div>

      <div>
        <div class="innput">
          <input type="text" id="idpostTitle" name="postTitle" class="input-post text" placeholder="Title" required maxlength="50">
        </div>

        <div>
          <textarea name="bodypost" id="postContent" cols="8" rows="5" class="texarea-post text" placeholder="What´s on ur mind?" required maxlength="500"></textarea>
        </div>

        <div class="actiones">
          <div class=" interaction-bnts select-category">
            <label for="PostinputImage" class="icons-stile">
              <i class="uil uil-image"></i>
            </label>
            <input type="file" name="nPostinputImage" id="PostinputImage" style="display: none;">
            <img id="imagePreview" src="#" alt="Vista previa de la imagen" style="display: none; max-width: 100px;">

            <label for="clasification"><i class="uil uil-pricetag-alt" ></i></label>
            <select id="clasification" name="categoria" class="interaction-bnts text-DP">
              <option value="1">Action</option>
              <option value="2">Adventure</option>
              <option value="3">Arcade</option>
              <option value="4">Sport</option>
              <option value="5">Strategy</option>
              <option value="6">Simulation</option>
              <option value="7">Rythm</option>
            </select>
          </div>

          <div>
            <input type="submit" value="Editar" class="btn-create">
          </div>
        </div>
      </div>
    </form>
  </div>
</div>
      <!------ CENTER POST ------>
      <div class="center">

        <!------ MODAL WINDOW FOR ADVANCE SEARCH ------>
        <div id="modalSearch" class="modal">
          <div class="modal-content advanced-search" id="winModalSearch">
            <span class="close">&times;</span>
            <h3>Advanced Search</h3>
            
            <form id="formBusquedaAvanzada" action="BusquedaAvanzadaServlet" method="post">    
              <div>
                <div class="innput">
                    <input type="text" name="BAText" id="BAText" class="text advanced-search-bar" placeholder="What are u looking for?" required="">
                </div>

                <br>
                <div class="dates">
                  <p class="TitleSearch text">Dates</p>
                  <div class="data-left">
                    <p class="text-muted">Before date:</p>
                    <div class="innput">
                      <input name="datePickerFin" id="datePickerFin" type="date" class="input-post text-DP">
                      
                    </div>
                  </div>

                  <div class="data-right">
                    <p class="text-muted">After date:</p>
                    <div class="innput">
                      <input name="datePickerInicio" id="datePickerInicio" type="date" class="input-post text-DP">
                    </div>
                  </div>

                </div>
                <br> <br>

                <div class="dates">
                  <p class="TitleSearch text">In what category are u loonking for</p>
                  
                  <div class="select-category">
                    
                    <label for="clasification"><i class="uil uil-pricetag-alt"></i></label>
                      <select id="clasification" name="clasification" class="interaction-bnts text-DP">
                      <option value="0">No Category</option>
                      <option value="1">Action</option>
                      <option value="2">Adventure</option>
                      <option value="3">Arcade</option>
                      <option value="4">Sport</option>
                      <option value="5">Strategy</option>
                      <option value="6">Simulation</option>
                      <option value="7">Rythm</option>

                      </select>
                  </div>
                 

                </div>

               
                <br>
                <div class=" actiones">
                  <div class=" interaction-bnts">
                  </div>
                     
                  <div>
                    <input type="submit" value="Search" class="btn-create">
                  </div> 
                
                </div>
                
              </div>

                       
            </form>

          </div>
        </div>

        <!--- MODAL EDIT INFO USER --->
        <div id="modal" class="modal">
    <div class="modal-content">
        <span class="close" id="cl-Data">&times;</span>
        <h3>Edit Profile</h3>
        <br>
        <form id="Edit-Info" action="ProfileServlet" method="post" enctype="multipart/form-data">
            <% if (request.getAttribute("error") != null) { %>
           <div class="error-message" style="width: 80%;">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
            <input type="hidden" id="EPIdF" name="EPIdF" value="">
            <input type="hidden" id="EPusernameF" name="EPusernameF" value="<%= usuario.getUsername() %>">
            <div class="images-profile">  
  <%
    // Define the URL of the default image
    String defaultImageUrlE = "/WebApplication1/Imageees/tulips.jpg";
    // Check if the urlImagenPortada is null or empty and use the default image if it is
    String portadaImageUrlE = (usuario.getNImg_Portada() != null && !usuario.getNImg_Portada().isEmpty()) ? usuario.getNImgP() : defaultImageUrlE;
%>
                <div>
                    <img src="<%= portadaImageUrlE %>" alt="" class="cover-photo">
                </div>   
                <div class="user-data">
                    <img src="${urlImagenPerfil}" alt="Imagen de perfil" class="profile-photo">
                </div>
                <div class="profile-model user-name">
                    <h3> <b>   @<%= usuario.getUsername() %> </b> </h3>
            </div>
           
            </div>
             <br>
            <div class="category-edit-user">                
                <div class="data-left">
                    <div class="innput">
                        <input type="text" id="name" name="name" class="input-post text" placeholder="Name" maxlength="60">
                    </div>
                    <div class="innput">
                        <input type="text" id="occupation" name="occupation" class="input-post text" placeholder="Ocupation" maxlength="30">
                    </div>   
                    <div class="innput">
                        <input type="date" id="birthdate" name="birthdate" class="input-post text">
                    </div>             
                </div>
                <div class="data-right">
                    <div class="innput">
                        <input type="text" id="plastname" name="plastname" class="input-post text" placeholder="Paternal Surname " maxlength="30">
                    </div>
                    <div class="innput">
                         <input type="text" id="location" name="location" class="input-post text" placeholder="Localition" maxlength="30">
                         
                    </div>
                    
                    <div class="innput">
                        <label for="ProfileinputImage" class="icons-stile">
                            <p class="text-muted">Imagen Perfil</p>
                            <i class="uil uil-image"></i>
                        </label>
                        <input type="file" name="nProfileinputImage" id="ProfileinputImage" style="display: none;">
                        <img id="imagePreviewProfile" src="#" alt="Vista previa de la imagen" style="display: none; max-width: 100px;">
                    </div>              
                    
                                     
                </div>
                <div class="data-left">
                    <div class="innput">
                        <input type="text" id="mlastname" name="mlastname" class="input-post text" placeholder="Maternal Surname" maxlength="30">
                       
                    </div>
                    <div class="innput">
                        <input type="text" id="description" name="description" class="input-post text" placeholder="Description" maxlength="100">
                    </div>
                    
                    <div class="innput">
                        <label for="PortinputImage" class="icons-stile">
                            <p class="text-muted">Imagen Portada</p>
                            <i class="uil uil-image"></i>
                        </label>
                        <input type="file" name="nPortinputImage" id="PortinputImage" style="display: none;">
                        <img id="imagePreviewPort" src="#" alt="Vista previa de la imagen" style="display: none; max-width: 100px;">
                    </div>
                </div>                
            </div>
            <div class="">
                <p class="category-edit-user">Security Data</p>
                <br> 
            </div>
            <div class="email-pass">                
                <div class="innput data-left">
                    <input type="text" id="email" name="email" class="input-post text" placeholder="Email" maxlength="40">
                </div>
                <div class="innput data-right">
                    <input type="text" id="password" name="password" class="input-post text" placeholder="Password" maxlength="20">
                </div>
                <div class="innput data-right">
                    <input type="text" id="confirmPassword" name="confirmPassword" class="input-post text" placeholder=" Confirm Password" maxlength="20">
                </div>
            </div>
            <div class="btn-save">
                <input type="submit" value="Save" class="btn-create">
            </div> 
        </form>
    </div>
</div>

        <div class="MyProfile">
          
          <div class="photoos">
       
            <%
    // Define the URL of the default image
    String defaultImageUrl = "/WebApplication1/Imageees/tulips.jpg";
    // Check if the urlImagenPortada is null or empty and use the default image if it is
    String portadaImageUrl = (usuario.getNImg_Portada() != null && !usuario.getNImg_Portada().isEmpty()) ? usuario.getNImgP() : defaultImageUrl;
%>
                <div >
                    <img src="<%= portadaImageUrl %>" alt="" class="cover-photo">
                </div>   
            
            <div class="photo-container">
                <div class="profile-img-container">
                    <img src="${urlImagenPerfil}" alt="Imagen de perfil" class="big-profile-photo">
                </div>
                
            </div>
                
         
          </div>   

            
          <div class="editable-data-container">   
               <div class="user-name">
                  <h2><%= usuario.getNombre() %></h2>
                  <p class="text-muted">@<%= usuario.getUsername() %></p>
               </div>
               
                <div class="btn-edit-user" id="open-edit">
                  <button class="btn-mutted text-muted" onclick="editarPerfil()"> <i class="uil uil-pen"></i> Edit  <br> profile</button>
               </div>
            
          </div>
          <br>
          <div class="editable-data-container">   
              <p class="description"><%= usuario.getDescripcion() %></p>
          </div>
          <br>
          
          <div class="editable-data-container">           

            <div class="data-left">
              
              <div class="work">
                <span class="some-info"> <i class="uil uil-envelope"></i> <%= usuario.getCorreoE() %></span>
              </div>
  
              <div class="work">
                <span class="some-info"> <i class="uil uil-suitcase data"> </i> <%= usuario.getOcupacion() %></span>
              </div> 

            </div>

            <div class="data-right">
              
              <div class="age">
                <span class="some-info"><i class="bi bi-balloon"></i> <%= usuario.getEdad() %></span>
              </div>
  
              <div class="age">
                <span class="some-info"> <i class="uil uil-map-marker"></i> <%= usuario.getLocalizacion() %> </span>
              </div>
            </div>
            
            
          </div>

        </div>

         <!------ PERSONAL POST ------>

         <div class="posts">
<%-- Verificar si hay publicaciones --%>
    <% if (request.getAttribute("publicaciones") != null) { %>
        <!-- Obtener la lista de publicaciones del atributo "publicaciones" del request -->
        <% List<Publicacion> publicaciones = (List<Publicacion>) request.getAttribute("publicaciones"); %>

        <!-- Iterar sobre la lista de publicaciones -->
        <% for (Publicacion post : publicaciones) { %>
            <!-- Mostrar los detalles de la publicación -->
            <div class="post">
                <!-- Encabezado de la publicación -->
                <div class="head">
                    <div class="user">
                        <!-- Aquí podrías mostrar la imagen de perfil del usuario -->
                        <!-- Si tienes la imagen de perfil de la publicación, puedes usar publicacion.getImagenPerfil() -->
                        <img src="<%= post.getNImg_Perfil() %>" alt="" class="profile-photo">
                        <div class="info">
                            <!-- Aquí muestras el nombre de usuario y el tiempo transcurrido desde la publicación -->
                            <h3><%= post.getNombreUsuario() %> <span class="text-muted">@<%= post.getUsername() %> &#x2022 <small><%= post.getFormattedDate() %></small></span></h3>
                            <!-- Si tienes la categoría de la publicación, puedes mostrarla aquí -->
                            <h4 class="text-muted">  <i class="uil uil-pricetag-alt"></i> <%= post.getCategoria() %>  </h4>
                        </div>
                        <div class="manage-posts">
                            
                       
                         <form id="formDatosPublicacion_<%= post.getIdPublicacion() %>" >
                            <input type="hidden" id="EpostId_<%= post.getIdPublicacion() %>" name="EpostId" value="<%out.println(post.getIdPublicacion());%>">
                            <input type="hidden" id="EuserId_<%= post.getIdPublicacion() %>" name="EuserId" value="<%out.println(post.getIdUsuario());%>">
                            <input type="hidden" id="Etitle_<%= post.getIdPublicacion() %>" name="Etitle" value="<%out.println(post.getTitulo());%>">
                            <input type="hidden" id="Econtent_<%= post.getIdPublicacion() %>" name="Econtent" value="<%out.println(post.getContenido());%>">
                            <input type="hidden" id="ENimg_<%= post.getIdPublicacion() %>" name="ENimg" value="<%out.println(post.getNImg());%>">
                            <input type="hidden" id="Eimg_<%= post.getIdPublicacion() %>" name="Eimg" value="<%out.println(post.getImg());%>">
                            <input type="hidden" id="EcatId_<%= post.getIdPublicacion() %>" name="EcatId" value="<%out.println(post.getIdCategoria());%>">
                         </form>
                          <button onclick="editarPublicacion(<%= post.getIdPublicacion() %>)" class="text-muted btn-mutted-publicaciones" id="botonEditar">
                            <i class="uil uil-edit"></i>
                            </button>
                            
                         <form class="d-flex flex-row-reverse" action="BorrarPublicacionServlet" method="post" onsubmit="return confirmacionBorrarPost()">
                            <input type="hidden" id="IpostId" name="IpostId" value="<%out.println(post.getIdPublicacion());%>">
                            
                            <button type="submit" class="text-muted" name="submit_button">
                             <i class="uil uil-trash"></i>
                            </button>
                            
                         </form>
                                   
                </div>
                    </div>
                </div>

                <!-- Título de la publicación -->
                <div class="title" id="titulo">
                     <p><%= post.getTitulo() %></p>
                </div>

                <div class="caption" id="contenido">
                   <p><%= post.getContenido() %></p>
                </div>

                <div id="imagen">
                    <img src="<%= post.getNImg() %>" alt="" class="photo">
                </div>
      
                <!-- Acciones de la publicación (por ejemplo, botón de "Me gusta" y "Guardar") -->
                <div class="actiones">
                    <div class="interaction-bnts">
                        <span class="icons-stile"><i class="bi bi-heart transicion"></i></span>
                    </div>
                    <div class="save">
                        <span class="icons-stile"> <i class="uil uil-bookmark"></i></span>
                    </div>
                </div>
            </div>
        <% } %>
    <% } else { %>
        <!-- Mostrar un mensaje si no hay publicaciones -->
        <div class="post">
            <div class="head">
                <div class="user">
                    <img src="${urlImagenPerfil}" alt="Imagen de perfil" class="profile-photo">
                    <div class="info">
                        <h3>Nombre prueba <span class="text-muted">@prueba &#x2022 <small>15 min ago</small></span></h3>
                        <h4 class="text-muted">  <i class="uil uil-pricetag-alt"></i>  Adventure  </h4>
                    </div>
                </div>
            </div>
            <div class="title">
                <p>Happy </p>
            </div>
            <div class="caption">
                <p>I went out with my human, was fun </p>
            </div>
            <div>
                <img src="Imageees/post.jpg" alt="" class="photo">
            </div>
            <div class="actiones">
                <div class="interaction-bnts">
                    <span class="icons-stile"><i class="class="bi bi-heart transicion"></i> 108</span>
                </div>
                <div class="save">
                    <span  class="icons-stile"> <i class="uil uil-bookmark"></i></span>
                </div>
            </div>
        </div>
        <div class="post">
            <div class="head">
                <div class="user">
                    <img src="Imageees/Mikuu.jpg" alt="" class="profile-photo">
                    <div class="info">
                        <h3>Little Miku <span class="text-muted">@HatsuneMiku &#x2022 <small>15 min ago</small></span></h3>
                        <h4 class="text-muted">  <i class="uil uil-pricetag-alt"></i>  Rythm  </h4>
                    </div>
                </div>
            </div>
            <div class="title">
                <p>An amazing Concert </p>
            </div>
            <div class="caption">
                <p>It was an incredible concert, thank u so much! </p>
            </div>
            <div>
                <img src="Imageees/mikuConcert.jpg" alt="" class="photo">
            </div>
            <div class="actiones">
                <div class="interaction-bnts">
                    <span class="icons-stile"><i class="bi bi-heart transicion"></i> 2.7k</span>
                </div>
                <div class="save">
                    <span  class="icons-stile"> <i class="uil uil-bookmark"></i></span>
                </div>
            </div>
        </div>
    <% } %>
        </div>





      </div>    
      
      
      
      <!------ RIGHT POST ------>
        <div class="right">
          
            <div class="gaaames">
                <div class="recommended-games">   

                    <a href="#item1" id="game1">
                      <div class="games-cards">
                        <div class="img-game-cards">
                          <img src="Imageees/Game1.PNG" alt="" class="img-game-cards">
                        </div>

                        <div class="game-info">
                          <h3>Crypt of the Necrodancer</h3>
                          <span class="text-muted"><i class="uil uil-pricetag-alt"></i> Rythm</span>
                        </div>
                      </div>            
                    </a>

                    <a href="#item2" id="game2">
                      <div class="games-cards">
                        <div class="img-game-cards">
                          <img src="Imageees/Game2.PNG" alt="" class="img-game-cards">
                        </div>

                        <div class="game-info">
                          <h3>Yu gi oh!</h3>
                          <span class="text-muted"><i class="uil uil-pricetag-alt"></i> Strategy</span>
                        </div>
                      </div>
                    </a>

                    <a href="#item3" id="game3">
                      <div class="games-cards">
                        <div class="img-game-cards">
                          <img src="Imageees/Game4.PNG" alt="" class="img-game-cards">
                        </div>

                        <div class="game-info">
                          <h3>Overcooked 2</h3>
                          <span class="text-muted"><i class="uil uil-pricetag-alt"></i> Simulation</span>
                        </div>
                      </div> 

                    </a>
                </div>

              <!-- COVER PHOTOS -->
                <div class="big-photo-game">

                    <div class="conteCarrusel">

                      <div class="game-carrusel" id="item1">
                        <img src="Imageees/coverphoto1.PNG" alt="" class="cover-photo-game" id="item1">
                        <p class="text-muted" id="item1">Overwhelmingly Positive reviews</p>
                      </div>

                      <div class="game-carrusel" id="item2">
                        <img src="Imageees/coverphoto2.PNG" alt="" class="cover-photo-game">
                        <p class="text-muted">New Decks</p>        
                      </div>

                      <div class="game-carrusel" id="item3">
                        <img src="Imageees/coverphoto4.PNG" alt="" class="cover-photo-game">
                        <p class="text-muted">Play with friends</p>        
                      </div>
                    </div>
                </div>
            </div>
            
        </div>   

      <!------ MODAL CONFIG ------>
      <div id="modalConfig" class="modal">
        <div class="modal-content" id="triangle"></div>
        <div class="modal-content configg" id="popup-config">
          <span class="close" id="close-signOut">&times;</span>
          
                
    <div>
        <% if (usuario != null) { %>
            <form action="SignOutServlet" method="post">
                <button type="submit" class="text lil-popUp" >
                    Sign Out
                </button>
            </form>
        <% } else { %>
            <a href="SignIn.jsp" class="text lil-popUp">
                Sign In
            </a>
        <% } %>
        <a href="#perfil" onclick="<%
            if (usuario != null) {
        %>toProfile(true)<%
            } else {
        %>toProfile(false)<%
            }
        %>" class="text lil-popUp">
            Profile
        </a>
    </div>
        </div>
        
      </div>
  
  
  
  
  
  
    </div>

    <!------ FOOTER ------>
    <br>
    <div class="footer">
      <p class="text-footer">All rights reserved <i class="uil uil-copyright"></i>
       <br>
       Isis Esmeralda Flores Montes | Carlos Daniel Pinkus Martinez
      </p>
      
      <br>
      <br>
      
    </div>

  </main>

  

<script>
    

    
/* ------ MODAL WINDOW FOR EDIT A POST ----- */    
const modal = document.getElementById("modal");
const closeModalBtn = document.getElementsByClassName("close")[3];
const cerrarmodal = document.getElementById("cl");
const modalEdit = document.getElementById("modalEditarPost");

cerrarmodal.onclick = function(event) {
  event.preventDefault();
  modalEdit.style.display = "none";
}

closeModalBtn.onclick = function(event) {
  event.preventDefault();
  modal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
  if (event.target == modalEdit) {
    modalEdit.style.display = "none";
  }
}


/* ------ MODAL WINDOW FOR ADVANCE SEARCH ----- */

const openModalBtnSearch = document.getElementById("openModalSearch");
const modalSearch = document.getElementById("modalSearch");
const closeModalBtnSearch = document.getElementsByClassName("close")[1];

openModalBtnSearch.onclick = function(event) {
  event.preventDefault();
  modalSearch.style.display = "block";
}

closeModalBtnSearch.onclick = function(event) {
  event.preventDefault();
  modalSearch.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modalSearch) {
    modalSearch.style.display = "none";
  }
}


/*-------- CARRUSEL ---------*/
const elemento1 = document.getElementById('item1');
const elemento2 = document.getElementById('item2');
const elemento3 = document.getElementById('item3');

document.getElementById('game1').addEventListener('click', function(event) {
  event.preventDefault(); 
  elemento1.style.display = 'block';
  
});

document.getElementById('game2').addEventListener('click', function(event) {
  event.preventDefault(); 
  elemento1.style.display = 'none';
  elemento2.style.display = 'block';
});

document.getElementById('game3').addEventListener('click', function(event) {
  event.preventDefault(); 
  elemento1.style.display = 'none';
  elemento2.style.display = 'none';
  elemento3.style.display = 'block';
});

    

/* ------ MODAL WINDOW FOR SIGN OUT ----- */

const openModalBtnConfig = document.getElementById("openModalConfig");
const modalConfig = document.getElementById("modalConfig");
const closeModalBtnConfig = document.getElementsByClassName("close")[2];

openModalBtnConfig.onclick = function(event) {
  event.preventDefault();
  modalConfig.style.display = "block";
}

closeModalBtnConfig.onclick = function(event) {
  event.preventDefault();
  modalConfig.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modalConfig) {
    modalConfig.style.display = "none";
  }
}

/* ------ MODAL WINDOW FOR EDIT DATA ----- */    
const modalData = document.getElementById("modal");
const cerrarmodalData = document.getElementById("cl-Data");
const modalEditData = document.getElementById("modal");

cerrarmodalData.onclick = function(event) {
  event.preventDefault();
  modalData.style.display = "none";
}



window.onclick = function(event) {
  if (event.target == modal) {
    modalData.style.display = "none";
  }
  if (event.target == modalEdit) {
    modalEditData.style.display = "none";
  }
}

// Función para mostrar la vista previa de la imagen seleccionada
function mostrarVistaPreviaImagen(input) {
  var imgPreview = document.getElementById('imagePreview');
  
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
document.getElementById('PostinputImage').addEventListener('change', function() {
  mostrarVistaPreviaImagen(this);
});


// Función para mostrar la vista previa de la imagen seleccionada
function mostrarVistaPreviaImagenProfile(input) {
  var imgPreview = document.getElementById('imagePreviewProfile');
  console.log(imgPreview);
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
document.getElementById('ProfileinputImage').addEventListener('change', function() {
  console.log("cambio imagen");
        mostrarVistaPreviaImagenProfile(this);
});

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

// Validación de fecha de nacimiento
document.getElementById('birthdate').addEventListener('change', function() {
    var selectedDate = new Date(this.value);
    var currentDate = new Date();
    var birthdate = document.getElementById("Ebirthdate" ).value;
    if (selectedDate > currentDate) {
        alert('La fecha no puede ser mayor que la fecha actual.');
        this.value = birthdate; // Limpiar el valor del campo de fecha
    }
});

// Validación del formulario al enviar
document.getElementById('Edit-Info').addEventListener('submit', function(event) {
    var name = document.getElementById('name').value;
    var paternalSurname = document.getElementById('plastname').value;
    var maternalSurname = document.getElementById('mlastname').value;
    var password = document.getElementById('password').value;
    console.log(password);
    var confirmPassword = document.getElementById('confirmPassword').value;
    var email = document.getElementById('email').value;

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
if(email!=""){
    if (!validateEmail(email)) {
       alert('Por favor, introduce un correo electrónico válido.');
       event.preventDefault(); 
       return;
    }
}
if(password!=""){
    if (!validatePassword(password)) {
        alert('La contraseña no cumple con los requisitos.');
        event.preventDefault();
        return;
    }
}

    if (password !== confirmPassword) {
        alert('La confirmación de contraseña no coincide con la contraseña ingresada.');
        event.preventDefault();
        return;
    }
});

// Funciones de validación
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

$(document).ready(function() {
      $('i.bi-heart').on('click', function() {
        $(this).toggleClass('bi-heart bi-heart-fill');
        $(this).toggleClass('transicion transparent');
      });
});      
      
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  
</body>




</html>