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
                <input type="submit" value="Spin!"/>
            </form>
            
        </div>
        
    </body>
</html>
