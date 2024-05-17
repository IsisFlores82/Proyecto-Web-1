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
<%Usuarios usuarioProfile = (Usuarios)session.getAttribute("UsuarioProfile");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile</title>
       <!--Bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="MyProfile.css">
  
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;700&display=swap" rel="stylesheet">  

     <script src="script.js"></script>

  </head>


<body >

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

    <div class="container">
     <a href="#perfil" onclick="<%
    if(usuario != null) {
%>toProfile(true)">
<img src="${urlImagenPerfil}" alt="Imagen de perfil" class="profile-photo">
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
          
  <a href="">
          <li class="dropdown__list a-sidebar-dd">            
           
              <a href="#" class="dropdown__link aa-sidebar ">
                <span class="dropdown__span dropdown__icon text"> <i class="uil uil-bars"></i> 
                  Categorias
                  <i class="uil uil-angle-down dropdown__arrow"></i>
                </span>
                                
                <input type="checkbox" class="dropdown__check">
            </a>
            
    <div class="dropdown__content">
                <ul class="dropdown__sub ">
                    <li class="dropdown__li">                        
                        <a href="#" class="dropdown__anchor">  <i class="uil uil-shield text"></i> Action</a>
                    </li>
                    <li class="dropdown__li">
                        <a href="#" class="dropdown__anchor"> <i class="uil uil-compass text"></i> Adventure</a>
                    </li>
                    <li class="dropdown__li">
                        <a href="#" class="dropdown__anchor"> <i class="uil uil-map-pin-alt text"></i> Arcade</a>
                    </li>
                    <li class="dropdown__li">
                      <a href="#" class="dropdown__anchor"> <i class="uil uil-basketball text"></i> Sport</a>
                    </li>
                    <li class="dropdown__li">
                      <a href="#" class="dropdown__anchor"> <i class="uil uil-puzzle-piece text"></i> Stretegy</a>
                    </li>
                    <li class="dropdown__li">
                      <a href="#" class="dropdown__anchor"> <i class="uil uil-trees text"></i> Simulation</a>
                    </li>
                    <li class="dropdown__li">
                      <a href="#" class="dropdown__anchor"> <i class="uil uil-music text"></i> Rythm</a>
                    </li>                   

                </ul>
            </div>
          </li>

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

        <div class="MyProfile">
          
          <div class="photoos">
       <%
    // Define the URL of the default image
    String defaultImageUrl = "/WebApplication1/Imageees/tulips.jpg";
    // Check if the urlImagenPortada is null or empty and use the default image if it is
    String portadaImageUrl = (usuarioProfile.getNImg_Portada() != null && !usuarioProfile.getNImg_Portada().isEmpty()) ? usuarioProfile.getNImgP() : defaultImageUrl;
%>
                <div>
                    <img src="<%= portadaImageUrl %>" alt="" class="cover-photo">
                </div>   

              <div class="photo-container">
                <div class="profile-img-container">
                <img src="<%= usuarioProfile.getNImgPro() %>" alt="Imagen de perfil" class="big-profile-photo">
                </div>
              <div class="profile">
                <div class="user-name">
                  <h2><%= usuarioProfile.getNombre() %></h2>
                  <p class="text-muted">@<%= usuarioProfile.getUsername() %></p>
                </div>

              </div>
            </div>
          </div>   
<br>
          <div class="editable-data-container ">
            <p class="description"><%= usuarioProfile.getDescripcion() %></p>
          </div>
          <br>
          
          <div class="editable-data-container">           

            <div class="data-left">
              
              <div class="work">
                <span class="some-info"> <i class="uil uil-envelope"></i> <%= usuarioProfile.getCorreoE() %></span>
              </div>
  
              <div class="work">
                <span class="some-info"> <i class="uil uil-suitcase data"> </i> <%= usuarioProfile.getOcupacion() %></span>
              </div> 

            </div>

            <div class="data-right">
              
              <div class="age">
                <span class="some-info"><i class="bi bi-balloon"></i> <%= usuarioProfile.getEdad() %></span>
              </div>
  
              <div class="age">
                <span class="some-info"> <i class="uil uil-map-marker"></i> <%= usuarioProfile.getLocalizacion() %> </span>
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
                        <span class="icons-stile"><i class="uil uil-heart"></i></span>
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
                    <span class="icons-stile"><i class="uil uil-heart"></i> 108</span>
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
                    <span class="icons-stile"><i class="uil uil-heart"></i> 2.7k</span>
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
      
        <div class="recommended-games">   
          
          <a href="#item1" id="game1">
            <div class="games-cards">
              <div class="img-game-cards">
                <img src="Imageees/Game1.PNG" alt="" class="img-game-cards">
              </div>
    
              <div class="game-info">
                <h2>Crypt of the Necrodancer</h2>
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
                <h2>Yu gi oh!</h2>
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
                <h2>Overcooked 2</h2>
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

      <!------ MODAL CONFIG ------>
      <div id="modalConfig" class="modal">
        <div class="modal-content" id="triangle"></div>
        <div class="modal-content configg" id="popup-config">
          <span class="close" id="close-signOut">&times;</span>
          
              
    <div>
        <% if (usuario != null) { %>
            <form action="SignOutServlet" method="post">
                <button type="submit" class="text lil-popUp" style="text-decoration: underline;background-color: #202124;">
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
       Terms of use | Privacy Policy
      </p>
      
      <br>
      <br>
      
    </div>

  </main>

  

<script>
/* ------ MODAL WINDOW FOR ADVANCE SEARCH ----- */

const openModalBtnSearch = document.getElementById("openModalSearch");
const modalSearch = document.getElementById("modalSearch");
const closeModalBtnSearch = document.getElementsByClassName("close")[0];

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


  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  
</body>




</html>