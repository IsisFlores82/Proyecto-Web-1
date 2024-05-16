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

</head>


<body >

  <!----- TOP BAR ------>
  <nav class="header">

    <div class="container" >
      <img src="Imageees/Steam_icon_logo.svg.png" alt="" class="logo">
      <h1> Steam</h1>
    </div>

    <div class="search-bar-container" >
      <i class="uil uil-search"></i>
      <input type="text" placeholder="Search something" class="search-bar">
      <i class="uil uil-filter text" id="openModalSearch"></i>
    </div>

    <div class="container">
      
      <a href="#perfil" onclick="<%
    if(usuario != null) {
%>toProfile(true)<%
    } else {
%>toProfile(false)<%
    }
%>">
        <img src="${urlImagenPerfil}" alt="Imagen de perfil" class="profile-photo">
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

        <a href="Home.jsp" class="a-sidebar">
          <span>
            <i class="uil uil-shield text"></i>
            <h3 class="text">Action</h3>
          </span>
        </a>
  
  
        <a href="Home.jsp" class="a-sidebar">
            <span>
              <i class="uil uil-compass text"></i>
              <h3 class="text">Adventure</h3>
            </span>
        </a>

        <a href="Home.jsp" class="a-sidebar">
          <span>
            <i class="uil uil-map-pin-alt text"></i>
            <h3 class="text">Arcade</h3>
          </span>
        </a>

        <a href="Home.jsp" class="a-sidebar">
          <span>
            <i class="uil uil-basketball text"></i>
            <h3 class="text">Sport</h3>
          </span>
        </a>

        <a href="Home.jsp" class="a-sidebar">
          <span>
            <i class="uil uil-puzzle-piece text"></i>
            <h3 class="text">Stretegy</h3>
          </span>
        </a>

        <a href="Home.jsp" class="a-sidebar">
          <span>
            <i class="uil uil-trees text"></i>
            <h3 class="text">Simulation</h3>
          </span>
        </a>

        <a href="Home.jsp" class="a-sidebar">
          <span>
            <i class="uil uil-music text"></i>
            <h3 class="text">Rythm</h3>
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
         
          <div class="user-data">
            <img src="${urlImagenPerfil}" alt="Imagen de perfil" class="profile-photo">
          </div>
  
          <div class="user-name-navbar">
              <%
    if(usuario != null) {
%>
        <h3><%= usuario.getNombre() %></h3>
        <p class="text-muted">@<%= usuario.getUsername() %></p>
<%
    } else {
%>
        Sin Usuario
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
            
            <form id="formCreatePost" action="PostPublicacionServlet" method="post" enctype="multipart/form-data">            
              <div>
                <div class="innput">
                  <input type="text"  class="text advanced-search-bar" placeholder="What are u looking for?">
                </div>

                <br>
                <div class="dates">
                  <p class="TitleSearch text">Dates</p>
                  <div class="data-left">
                    <p class="text-muted">Before date:</p>
                    <div class="innput">
                      <input type="date" class="input-post text-DP">
                      
                    </div>
                  </div>

                  <div class="data-right">
                    <p class="text-muted">After date:</p>
                    <div class="innput">
                      <input type="date" class="input-post text-DP">
                    </div>
                  </div>

                </div>
                <br> <br>

                <div class="dates">
                  <p class="TitleSearch text">In what category are u loonking for</p>
                  
                  <div class="select-category">
                    
                    <label for="clasification"><i class="uil uil-pricetag-alt"></i></label>
                      <select id="clasification" name="clasification" class="interaction-bnts text-DP">
                      <option value="Action">Action</option>
                      <option value="Adventure">Adventure</option>
                      <option value="Arcade">Arcade</option>
                      <option value="Sport">Sport</option>
                      <option value="Strategy">Strategy</option>
                      <option value="Simulation">Simulation</option>
                      <option value="Rythm">Rythm</option>

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
                  <input type="text" id="idpostTitle" name="postTitle" class="input-post text" placeholder="Title" required>
                </div>

                <div>
                  <textarea name="bodypost" id="postContent" cols="8" rows="5" class="texarea-post text" 
                  placeholder="What´s on ur mind?" required></textarea>
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
                    <input type="submit" value="Post" class="btn-create">
                  </div> 
                
                </div>
                
              </div>

                       
            </form>

          </div>
        </div>

        
        <form class="create-post">
          <div class="photo-container">
            <img src="${urlImagenPerfil}" alt="Imagen de perfil" class="profile-photo">
          </div>
          <div class="post-body">
            <button id="openModal" class="btnLabel text">What´s on ur mind?</button>
            <div>
              <input type="text"  class="input-post text" placeholder="">
            </div>
            
            
          </div>
                   
        </form>

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
    <ul class="pagination justify-content-center">
                <%
                    int pag = 0;
                    if(request.getAttribute("Pagina") != null){
                    pag = (int)request.getAttribute("Pagina");
                    }
                    int num_paginas = (int)request.getAttribute("num_paginas");
                    if(pag != 0){
                    %>
                    <li class="page-item">
                        <form action="PaginacionServlet" method="post">
                            <input type="hidden" id="Pag" name="Pag" value="<%out.println(pag-1);%>">
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
          
          <form class="">            

            <div>
             <a href="SignIn.jsp" class="text lil-popUp">
              Sign Out
             </a>
             
             <<a href="#perfil" onclick="<%
    if(usuario != null) {
%>toProfile(true)<%
    } else {
%>toProfile(false)<%
    }
%>" class="text lil-popUp">
              Profile
             </a>
              
            </div>

                     
          </form>

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
      const openModalBtn = document.getElementById("openModal");
const modal = document.getElementById("modal");
const closeModalBtn = document.getElementsByClassName("close")[1];



openModalBtn.onclick = function(event) {
  event.preventDefault();
  modal.style.display = "block";
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
  </script>
 
  
</body>




</html>
