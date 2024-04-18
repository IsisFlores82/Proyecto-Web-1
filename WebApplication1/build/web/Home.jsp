<%-- 
    Document   : Home
    Created on : 17 abr 2024, 21:07:46
    Author     : cdpin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="HomeStyles.css">
  
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
      <h1> Steam</h1>
    </div>

    <div class="search-bar-container" >
      <i class="uil uil-search"></i>
      <input type="text" placeholder="Search something" class="search-bar">
      <i class="uil uil-filter text" id="openModalSearch"></i>
    </div>

    <div class="container">
      
      <a href="MyProfile.html">
        <img src="Imageees/canela feli.png" alt="" class="profile-photo">
      </a>
    </div>

  </nav>


  <!------ MAIN ------>
  <main>
    <div class="container">

      <!----- SIDE BAR ------->
      <div class="left">
       
        <a href="Home.html" class="a-sidebar active">
          <span>
            <i class="uil uil-home text"></i>
            <h3 class="text">Home</h3>
          </span>
        </a>

        <a href="" class="a-sidebar">
          <span>
            <i class="uil uil-shield text"></i>
            <h3 class="text">Action</h3>
          </span>
        </a>
  
  
        <a href="" class="a-sidebar">
            <span>
              <i class="uil uil-compass text"></i>
              <h3 class="text">Adventure</h3>
            </span>
        </a>

        <a href="" class="a-sidebar">
          <span>
            <i class="uil uil-map-pin-alt text"></i>
            <h3 class="text">Arcade</h3>
          </span>
        </a>

        <a href="" class="a-sidebar">
          <span>
            <i class="uil uil-basketball text"></i>
            <h3 class="text">Sport</h3>
          </span>
        </a>

        <a href="" class="a-sidebar">
          <span>
            <i class="uil uil-puzzle-piece text"></i>
            <h3 class="text">Stretegy</h3>
          </span>
        </a>

        <a href="" class="a-sidebar">
          <span>
            <i class="uil uil-trees text"></i>
            <h3 class="text">Simulation</h3>
          </span>
        </a>

        <a href="" class="a-sidebar">
          <span>
            <i class="uil uil-music text"></i>
            <h3 class="text">Rythm</h3>
          </span>
        </a>


        <a href="MyProfile.html" class="a-sidebar">
         <span>
           <i class="uil uil-user text"></i>
           <h3 class="text">Profile</h3>
         </span>
        </a>
  
        <div class="profile">
         
          <div class="user-data">
            <img src="Imageees/canela feli.png" alt="" class="profile-photo">
          </div>
  
          <div class="user-name">
            <h2>Canela</h2>
            <p class="text-muted">@Canelita</p>
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

        <!--- MODAL CREATE POST --->
        <div id="modal" class="modal">
          <div class="modal-content">
            <span class="close">&times;</span>
            <h3>Create a post</h3>
            
            <form class="">

              <div>
                <div class="profile-model">         
                  <div class="user-data">
                    <img src="Imageees/canela feli.png" alt="" class="profile-photo">
                  </div>
          
                  <div class="user-name">
                    <h3>Canela</h3>
                    <p class="text-muted">@Canelita</p>
                  </div>
          
                </div>
              </div>

              <div>
                <div class="innput">
                  <input type="text"  class="input-post text" placeholder="Title">
                </div>

                <div>
                  <textarea name="bodypost" id="" cols="8" rows="5" class="texarea-post text" 
                  placeholder="What´s on ur mind?" ></textarea>
                </div>
                
                <div class="actiones">
                  <div class=" interaction-bnts select-category">
                    <span class="icons-stile"><i class="uil uil-image"></i></span>
                    
                    <label for="clasification"><i class="uil uil-pricetag-alt" ></i></label>
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
            <img src="Imageees/canela feli.png" alt="" class="profile-photo">
          </div>
          <div class="post-body">
            <button id="openModal" class="btnLabel text">What´s on ur mind?</button>
            <div>
              <input type="text"  class="input-post text" placeholder="">
            </div>
            
            
          </div>
                   
        </form>

        <div class="posts">
          <div class="post">

            <div class="head">
              <div class="user">
                <img src="Imageees/canela feli.png" alt="" class="profile-photo">
                <div class="info">
                  <h3>Canela <span class="text-muted">@Canelita &#x2022 <small>15 min ago</small></span>  </h3>
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

          <div class="post">

            <div class="head">
              <div class="user">
                <img src="Imageees/Mikuu.jpg" alt="" class="profile-photo">
                <div class="info">
                  <h3>Little Miku <span class="text-muted">@HatsuneMiku &#x2022 <small>15 min ago</small></span>  </h3>
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
              <img src="Imageees/mikuConcert.jpg" alt="" class= "photo">

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


          
        </div>

        <div class="pagee">
          <i class="bi bi-caret-left-fill"></i>
          <p>1</p>
          <i class="bi bi-caret-right-fill"></i>
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
             <a href="SignIn.html" class="text lil-popUp">
              Sign Out
             </a>
             
             <a href="MyProfile.html" class="text lil-popUp">
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

  

  <script src="scriptHome.js"></script>
 
  
</body>




</html>