<%-- 
    Document   : MyProfile
    Created on : 18 abr 2024, 18:09:28
    Author     : cdpin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Profile</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="MyProfile.css">
  
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;700&display=swap" rel="stylesheet">
  </head>


<body >

  <!----- TOP BAR ------>
  <nav class="header">

    <div class="container" >
      <img src="Imageees/Steam_icon_logo.svg.png" alt="" class="logo">
      <h1> Steam </h1>
    </div>

    <div class="search-bar-container" >
      <i class="uil uil-search"></i>
      <input type="text" placeholder="Search something" class="search-bar">
      <i class="uil uil-filter text" id="openModalSearch"></i>
    </div>

    <div class="container">
      <a href="MyProfile.jsp">
        <img src="${urlImagenPerfil}" alt="Imagen de perfil" class="profile-photo">
      </a>
      
    </div>

  </nav>


  <!------ MAIN ------>
  <main>
    <div class="container">

      <!----- SIDE BAR ------->
      <div class="left">
       
        <a href="Home.jsp" class="a-sidebar">
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

       <a href="MyProfile.jsp" class="a-sidebar active">
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
            <h2>${sessionScope.nombre}</h2>
            <p class="text-muted">@${sessionScope.nombreUsuario}</p>
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
            
            <form class="">            

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

        <!--- MODAL EDIT INFO USER --->
        <div id="modal" class="modal">
          <div class="modal-content">
            <span class="close">&times;</span>
            <h3>Edit Profile</h3>
            <br>

            
            <form id="Edit-Info">

              <div class="images-profile">  
                  
                <div>
                  <img src="Imageees/tulips.jpg" alt="" class="cover-photo">
                </div>

                <div class="user-data">
                  <img src="${urlImagenPerfil}" alt="Imagen de perfil" class="profile-photo">
                </div>
          
              </div>

              <div class="profile-model user-name">
                <p class="text-muted">@${sessionScope.nombreUsuario}</p>
              </div>

              
              
              <div class="editable-data-container">

                
                <div class="data-left">
                  <div class="innput">
                    <input type="text"  class="input-post text" placeholder="Name" maxlength="30">
                  </div>

                  <div class="innput">
                    <input type="text"  class="input-post text" placeholder="Ocupation" maxlength="30">
                  </div>               
                  

                </div>

                <div class="data-right">
                  <div class="innput">
                    <input type="text"  class="input-post text" placeholder="Last Name" maxlength="30">
                    
                  </div>

                  <div class="innput">
                    <input type="text"  class="input-post text" placeholder="Localition" maxlength="30">
                  </div>                  
                  
                </div>

                <div class="data-left">
                  <div class="innput">
                    <input type="date" class="input-post text">
                  </div>

                  <div class="innput">
                    <input type="text"  class="input-post text" placeholder="Description" maxlength="30">
                  </div>                  
                 
                </div>                
                
              </div>

              <div class="">
                <p class="category-edit-user">Security Data</p>
                <br> 
              </div>

              <div class="email-pass">                
                
               <div class="innput data-left">
                  <input type="text"  class="input-post text" placeholder="Email" maxlength="80">
                </div>

                <div class="innput data-right">
                  <input type="text"  class="input-post text" placeholder="Password" maxlength="80">
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
       
            <div>
              <img src="Imageees/tulips.jpg" alt="" class="cover-photo">
            </div>     
            
              <div class="photo-container">
                <div class="profile-img-container">
                <img src="${urlImagenPerfil}" alt="Imagen de perfil" class="big-profile-photo">
                </div>
              <div class="profile">
                <div class="user-name">
                  <h2>${sessionScope.nombre}</h2>
                  <p class="text-muted">@${sessionScope.nombreUsuario}</p>
                </div>

                <div class="btn-edit-user" id="open-edit">
                  <button class="btn-mutted text-muted"> <i class="uil uil-pen"></i> Edit  <br> profile</button>
                </div>
        
              </div>
            </div>
          </div>   

          <div class="editable-data-container ">
            <p class="description"> Cuando quiero hago wuaw wuaw</p>
          </div>
          <br>
          
          <div class="editable-data-container">           

            <div class="data-left">
              
              <div class="work">
                <span class="some-info"> <i class="uil uil-envelope"></i> canela@wuawauw.com</span>
              </div>
  
              <div class="work">
                <span class="some-info"> <i class="uil uil-suitcase data"> </i> ser bonita uwu</span>
              </div> 

            </div>

            <div class="data-right">
              
              <div class="age">
                <span class="some-info"><i class="bi bi-balloon"></i> ${sessionScope.edad}</span>
              </div>
  
              <div class="age">
                <span class="some-info"> <i class="uil uil-map-marker"></i> Guadalajara </span>
              </div>
            </div>
            
            
          </div>

        </div>

         <!------ PERSONAL POST ------>

         <div class="posts">
          <div class="post">

            <div class="head">
              <div class="user">
                <img src="${urlImagenPerfil}" alt="Imagen de perfil" class="profile-photo">
                <div class="info">
                  <h3>${sessionScope.nombre} <span class="text-muted">@${sessionScope.nombreUsuario} &#x2022 <small>15 min ago</small></span>  </h3>
                  <h4 class="text-muted">  <i class="uil uil-pricetag-alt"></i>  Trips  </h4>
                </div>

                <div class="manage-posts">
                  <span class="text-muted"><i class="uil uil-edit-alt"></i></span>
                  <span class="text-muted"><i class="uil uil-trash"></i></span>
                                    
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
              <img src="Imageees/post.jpg" alt="" class= "photo">
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
          
          <form class="">            

            <div>
             <a href="SignIn.jsp" class="text lil-popUp">
              Sign Out
             </a>
             
             <a href="MyProfile.jsp" class="text lil-popUp">
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

  

  <script>const openModalBtn = document.getElementById("open-edit");
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