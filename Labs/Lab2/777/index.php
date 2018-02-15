<!--include php file-->
<?php
    include 'inc/functions.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <title> 777 Slot Machine </title>
        <meta charset="utf-8"/>
        <style>
            @import url("css/styles.css");
        </style>
    </head>
    <body>
        <!--beginning of 'main' div-->
        <div id="main">
            
            <!--calling php play() function-->
            <?php
                play();
            ?>
            
            <!--Adding a spin button-->
            <form>
                <input type="submit" value="Spin!" onclick="document.getElementById('spin').play()"/>
            </form>
            
            <!--creating audio attributes-->
            <audio id="spin" src="Audio/lever.mp3"></audio>
            <audio id="jackpot" src="Audio/jackpot.mp3"></audio>
        
            <!--Using JS to create functions to play sound effects for jackpot-->
            <script>
                function playSound(){
                    var audio = document.getElementById("jackpot");
                    audio.play();
                }
            </script>
            
        </div>
        
    </body>
</html>
