<?php
    include 'inc/functions.php';
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Prize</title>
        <style>
            @import url("css/styles.css");
        </style>
    </head>
    <body>
        
        <?php
            $randomValue = rand(0,6);
            displayPrize($randomValue);  
        ?>
    </body>
</html>