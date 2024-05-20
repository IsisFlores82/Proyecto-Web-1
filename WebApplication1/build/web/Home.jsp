 <%-- 
    Document   : Home
    Created on : 17 abr 2024, 21:07:46
    Author     : cdpin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="entidades.Publicacion" %>
<%@page import="entidades.Usuarios" %>
<%Usuarios usuario = (Usuarios)session.getAttribute("Usuario");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home</title>
     <!--Bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="HomeStyles.css">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;700&display=swap" rel="stylesheet">
  <script src="script.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>


<body >
<input type="hidden" id="UPId" name="UPId" value="">
<%
    if(usuario != null) {
%><input type="hidden" id="IDS" name="IDS" value="<%= usuario.getIdUsuario() %>"><%
    } else {
%><input type="hidden" id="IDS" name="IDS" value="0"><%
    }
%>
  <!----- TOP BAR ------>
  <nav class="header">

    <div class="container" >
      <img src="Imageees/Steam_icon_logo.svg.png" alt="" class="logo">
      <h1> Steam</h1>
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
       
        <a href="#home" onclick="toHome()" class="a-sidebar active">
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
%>" class="a-sidebar">
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
                       <h4> Guest User</h4>
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

        <!--- MODAL CREATE POST --->
        <div id="modal" class="modal">
          <div class="modal-content">
            <span class="close">&times;</span>
            <h3>Create a post</h3>
            
            <form id="formCreatePost" action="PostPublicacionServlet" method="post" enctype="multipart/form-data">

              <div>
                <div class="profile-model">         
                  <div class="user-data">
                    <img src="${urlImagenPerfil}" alt="Imagen de perfil" class="profile-photo">
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
                  <textarea name="bodypost" id="postContent" cols="8" rows="5" class="texarea-post text" 
                  placeholder="What´s on ur mind?" required maxlength="500"></textarea>
                </div>
                
                <div class="actiones">
                  <div class=" interaction-bnts select-category">
                    <label for="PostinputImage" class="icons-stile">
                        <i class="uil uil-image"></i>
                    </label>
                      
                    <input type="file" name="nPostinputImage" id="PostinputImage" style="display: none;">
                    <img id="imagePreview" src="#" alt="Vista previa de la imagen" style="display: none; max-width: 100px;">
                    
                    <label for="clasification" class="icons-stile"><i class="uil uil-pricetag-alt" ></i></label>
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
                    <input type="submit" value="Post" class="btn-create">
                  </div> 
                
                </div>
                
              </div>

                       
            </form>

          </div>
        </div>

        
        <form class="create-post">
            <%
         if(usuario != null) {
%><div class="photo-container">
            <img src="${urlImagenPerfil}" alt="Imagen de perfil" class="profile-photo">
          </div> 
<%
    } else {
%><div class="photo-container">
            <img src="Imageees/Steam_icon_logo.svg.png" alt="Imagen de perfil" class="profile-photo">
          </div><%
    }
%>
          <div class="post-body">
            <button id="openModal" class="btnLabel text">What´s on ur mind?</button>
          </div>
                   
        </form>

<div class="posts">
    <%-- Verificar si hay publicaciones --%>
    <% if (request.getAttribute("publicaciones") != null||request.getAttribute("search") != null||request.getAttribute("BusquedaAvanzada") != null) { %>
    
       <%  
        List<Publicacion> publicaciones;
        if(request.getAttribute("search") != null) {
                    %>
                    <h4>Resultados de la búsqueda: "<%out.print(request.getAttribute("searchword"));%>"</h4>
                    <%
                    publicaciones = (List<Publicacion>)request.getAttribute("search");
                } else if(request.getAttribute("BusquedaAvanzada") != null){
                %>
                <h4>Resultados de la Busqueda Avanzada</h4>
                <%
publicaciones = (List<Publicacion>)request.getAttribute("BusquedaAvanzada");
                    
                }else {
publicaciones = (List<Publicacion>)request.getAttribute("publicaciones");
}%>

        <!-- Iterar sobre la lista de publicaciones -->
        <% for (Publicacion post : publicaciones) { %>
            <!-- Mostrar los detalles de la publicación -->
            <div class="post">
                <!-- Encabezado de la publicación -->
                <div class="head">
                    <div class="user" onclick="obtenerDatosUsuario(<%= post.getIdPublicacion() %>)">
                        <!-- Aquí podrías mostrar la imagen de perfil del usuario -->
                        <!-- Si tienes la imagen de perfil de la publicación, puedes usar publicacion.getImagenPerfil() -->
                        <img src="<%= post.getNImg_Perfil() %>" alt="" class="profile-photo">
                        <div class="info">
                            <!-- Aquí muestras el nombre de usuario y el tiempo transcurrido desde la publicación -->
                            <h3><%= post.getNombreUsuario() %> <span class="text-muted">@<%= post.getUsername() %> &#x2022 <small><%= post.getFormattedDate() %></small></span></h3>
                            <!-- Si tienes la categoría de la publicación, puedes mostrarla aquí -->
                            <h4 class="text-muted">  <i class="uil uil-pricetag-alt"></i> <%= post.getCategoria() %>  </h4>
                        </div>
                        <form id="formDatosUserPub_<%= post.getIdPublicacion() %>" >
                            <input type="hidden" id="EuserId_<%= post.getIdPublicacion() %>" name="EuserId" value="<%out.println(post.getIdUsuario());%>">
                        </form>  
                    </div>
                </div>

                <!-- Título de la publicación -->
                <div class="title">
                    <p><%= post.getTitulo() %></p>
                </div>

                <!-- Contenido de la publicación -->
                <div class="caption">
                    <p><%= post.getContenido() %></p>
                </div>

                <!-- Imagen de la publicación -->
                <div>
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
    <h2>Sin Publicaciones</h2>
    <% } %>
    <ul class="pagination justify-content-center ">
                <%
                    int pag = 0;
                    if(request.getAttribute("Pagina") != null){
                    pag = (int)request.getAttribute("Pagina");
                    }
                    boolean search = false;
                    if(request.getAttribute("search") != null) {
                        search = true;
                    }
                    boolean asearch = false;
                    if(request.getAttribute("BusquedaAvanzada") != null) {
                        asearch = true;
                    }
                    int num_paginas = (int)request.getAttribute("num_paginas");
                    if(pag != 0){
                    %>
                    <li class="page-item">
                        <form action="PaginacionServlet" method="post">
                            <input type="hidden" id="Pag" name="Pag" value="<%out.println(pag-1);%>">
                            <input type="hidden" id="Search" name="Search" value="<%out.println(search);%>">
                            <input type="hidden" id="Searchword" name="Searchword" value="<%out.println(request.getAttribute("searchword"));%>">
                            <input type="hidden" id="ASearch" name="ASearch" value="<%out.println(asearch);%>">
                            <input type="hidden" id="IdCategoria" name="IdCategoria" value="<%out.println(request.getAttribute("idCategoria"));%>">
                            <input type="hidden" id="F_inicio" name="F_inicio" value="<%out.println(request.getAttribute("f_inicio"));%>">
                            <input type="hidden" id="F_fin" name="F_fin" value="<%out.println(request.getAttribute("f_fin"));%>">
                            <button class="page-image" style="background: none; border: none; width: 2.5rem; height: 2.5rem" type="submit" href="#" aria-label="Previous" style="--bs-pagination-border-radius:50%;">
                                <a class="bi bi-caret-left-fill page-link" style="--bs-pagination-border-radius:50%;"></a>
                            </button>
                        </form>
                    </li>
                    <%
                    }
                    for(int i = 1; i < num_paginas+1; i++){
                    if(i == pag+1){
                        %>
                        <li class="page-item" style="background: rgba(55, 50, 70, 1); border-radius: 100%">
                            <form action="PaginacionServlet" method="post">
                                <input type="hidden" id="Pag" name="Pag" value="<%out.println(i-1);%>">
                                <input type="hidden" id="Search" name="Search" value="<%out.println(search);%>">
                                <input type="hidden" id="Searchword" name="Searchword" value="<%out.println(request.getAttribute("searchword"));%>">
                                <input type="hidden" id="ASearch" name="ASearch" value="<%out.println(asearch);%>">
                            <input type="hidden" id="IdCategoria" name="IdCategoria" value="<%out.println(request.getAttribute("idCategoria"));%>">
                            <input type="hidden" id="F_inicio" name="F_inicio" value="<%out.println(request.getAttribute("f_inicio"));%>">
                            <input type="hidden" id="F_fin" name="F_fin" value="<%out.println(request.getAttribute("f_fin"));%>">
                                <button style="background: none; border: none; width: 2.5rem; height: 2.5rem" class="page-image" type="submit" href="#" aria-label="Next" style="--bs-pagination-border-radius:50%">
                                <a class="page-link" style="--bs-pagination-border-radius:50%;"><%out.print(i);%></a>
                                </button>
                            </form>
                        </li>
                        <%
                    }else{
                        %>
                        <li class="page-item">
                            <form action="PaginacionServlet" method="post">
                                <input type="hidden" id="Pag" name="Pag" value="<%out.println(i-1);%>">
                                <input type="hidden" id="Search" name="Search" value="<%out.println(search);%>">
                                <input type="hidden" id="Searchword" name="Searchword" value="<%out.println(request.getAttribute("searchword"));%>">
                                <input type="hidden" id="ASearch" name="ASearch" value="<%out.println(asearch);%>">
                            <input type="hidden" id="IdCategoria" name="IdCategoria" value="<%out.println(request.getAttribute("idCategoria"));%>">
                            <input type="hidden" id="F_inicio" name="F_inicio" value="<%out.println(request.getAttribute("f_inicio"));%>">
                            <input type="hidden" id="F_fin" name="F_fin" value="<%out.println(request.getAttribute("f_fin"));%>">
                                <button style="background: none; border: none; width: 2.5rem; height: 2.5rem" class="page-image" type="submit" href="#" aria-label="Next" style="--bs-pagination-border-radius:50%">
                                <a class="page-link" style="--bs-pagination-border-radius:50%;"><%out.print(i);%></a>
                                </button>
                            </form>
                        </li>
                        <%
                    }
                    }
                    if(pag+1 != num_paginas){
                    %>
                    <li class="page-item">
                        <form action="PaginacionServlet" method="post">
                            <input type="hidden" id="Pag" name="Pag" value="<%out.println(pag+1);%>">
                            <input type="hidden" id="Search" name="Search" value="<%out.println(search);%>">
                            <input type="hidden" id="Searchword" name="Searchword" value="<%out.println(request.getAttribute("searchword"));%>">
                            <input type="hidden" id="ASearch" name="ASearch" value="<%out.println(asearch);%>">
                            <input type="hidden" id="IdCategoria" name="IdCategoria" value="<%out.println(request.getAttribute("idCategoria"));%>">
                            <input type="hidden" id="F_inicio" name="F_inicio" value="<%out.println(request.getAttribute("f_inicio"));%>">
                            <input type="hidden" id="F_fin" name="F_fin" value="<%out.println(request.getAttribute("f_fin"));%>">
                            <button style="background: none; border: none; width: 2.5rem; height: 2.5rem" class="page-image" type="submit" href="#" aria-label="Next" style="--bs-pagination-border-radius:50%">
                              <a class="bi bi-caret-right-fill page-link" style="--bs-pagination-border-radius:50%;"></a>
                            </button>
                        </form>
                    </li>
                    <%
                    }
                %>

          </ul>
</div>
      </div>
    
      <!------ RIGHT PART ------>
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
                <button type="submit" class="text lil-popUp">
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
      <p class="text-footer"> All rights reserved <i class="uil uil-copyright"></i>
       <br>
       Isis Esmerada Flores Montes  |     Carlos Daniel Pinkus Martinez
      </p>
      
      <br>
      <br>
      
    </div>




  </main>

  

      <script>
const openModalBtn = document.getElementById("openModal");
const modal = document.getElementById("modal");
const closeModalBtn = document.getElementsByClassName("close")[1];
const userlog=document.getElementById("IDS").value;


openModalBtn.onclick = function(event) {
  event.preventDefault();
  if(parseInt(userlog)!=0){
      console.log("hola el user log vale: "+userlog)
   modal.style.display = "block";
  }else{
      alert('Inicie sesion para crear publicaciones');
  }
 
}

closeModalBtn.onclick = function(event) {
  event.preventDefault();
  modal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}


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
  event.preventDefault(); // Evita el comportamiento predeterminado del enlace
  elemento1.style.display = 'block';
  
});

document.getElementById('game2').addEventListener('click', function(event) {
  event.preventDefault(); // Evita el comportamiento predeterminado del enlace
  elemento1.style.display = 'none';
  elemento2.style.display = 'block';
});

document.getElementById('game3').addEventListener('click', function(event) {
  event.preventDefault(); // Evita el comportamiento predeterminado del enlace
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
/* ------ Post Img Preview ----- */
document.getElementById('PostinputImage').addEventListener('change', function(event) {
  var input = event.target;
  var reader = new FileReader();
  
  reader.onload = function() {
    var imagePreview = document.getElementById('imagePreview');
    imagePreview.src = reader.result;
    imagePreview.style.display = 'block'; // Mostrar la miniatura
  }
  
  reader.readAsDataURL(input.files[0]);
});

$(document).ready(function() {
      $('i.bi-heart').on('click', function() {
        $(this).toggleClass('bi-heart bi-heart-fill');
        $(this).toggleClass('transicion transparent');
      });
});
  </script>
 
  
</body>




</html>
