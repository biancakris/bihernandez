<!DOCTYPE html>
<html>
    <head>
        <link rel = "stylesheet" href = "css/styles.css"> 
        <link href="https://fonts.googleapis.com/css?family=Lora:700|Scope+One|Arvo|Slabo+27px" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title> Body Buddy</title>
    </head>
    <body>
        <!--Header-->
        <center>
        <div id = 'header' style = "">
            <img src = "https://images.clipartuse.com/b6504904f5e194032e61f36898164b42_muscle-arm-clip-art-6-pack-abs-are-still-possible-this-summer-_400-400.png" style = "width:75px; height:75px;;">
            Body Buddy
            <img src = "https://images.clipartuse.com/b6504904f5e194032e61f36898164b42_muscle-arm-clip-art-6-pack-abs-are-still-possible-this-summer-_400-400.png" style = "width:75px; height:75px; transform: scaleX(-1)">
           <div id = 'headSubtitle'>
               Be Ready to Get Sweaty!!
           </div> 
        </div>
        </center>
       
        <!--Body-->
        <div>
            <img id = "man" src = "https://s-media-cache-ak0.pinimg.com/originals/09/3d/02/093d0274d12253d5540c82b708e72e1a.png" style = "width:350px; ">
            <center>
            <div id = 'text' style = "width: 50%; text-align: center;">
                   Are you Tired of Sitting Around?? <br>
                   But You Don't know Where to Start??<br><br>
                   Well We have the Solution For YOU!!!<br>
            </div>
            </center>
            <img id = "woman" src = "http://vignette2.wikia.nocookie.net/animatedmusclewomen/images/b/b8/Amber_by_thefranksterchannel-da8ys4n.png/revision/latest?cb=20160705163233" style = "height: 450px; "> 
        </div>
        
        <!--Submit Button-->
        <center>
        <div id = 'demo' style = "width: 45%; bottom: -305px; position: relative" >
                <img src = "http://www.clipartbest.com/cliparts/9i4/p55/9i4p55ExT.png" style = "width:35px; height:35px; top-padding=25px;">
               <button id=button type="button" onclick="loadDoc()">I'm Ready</button> 
                <img src = "http://www.clipartbest.com/cliparts/9i4/p55/9i4p55ExT.png" style = "width:35px; height:35px; transform: scaleX(-1)">
        </div>
        </center>
        
        
        <script>
        function loadDoc() {
          var xhttp = new XMLHttpRequest();
          xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
              document.getElementById("demo").innerHTML =
              this.responseText;
            }
          };
          xhttp.open("GET", "login.php", true);
          xhttp.send();
        }
        </script>
    
    </body>
</html>