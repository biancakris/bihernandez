<?php
    function getRandomColor(){
        $red = rand(0,255);
                    $blue = rand(0,255);
                    $green = rand(0,255);
                    $alpha = rand(0,10)/10;
                    
                    echo "rgba($red,$blue,$green,$alpha);";
    }

?>
<!DOCTYPE html>
<html>
    <head>
        <title> Random Color </title>
        
        <style>
            
            body{
               background-color: <?php getRandomColor() ?>;
                
            }
            h1{
                background-color: <?= getRandomColor() ?>;
            }
            h2{
                color: <?= getRandomColor() ?>;
            }
            
        </style>
    </head>
    <body>
        
        <h1>Welcome!</h1>
        <h2>Random Background Color!</h2>

    </body>
</html>