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
        <center>
        <?php
            $randomValue = rand(0,9);
            displayPrize($randomValue);  
        ?>
        <br>
        <button onclick="goBack()">Try Your Luck Again!</button>

        <script>
        function goBack() {
            window.history.back();
        }
        </script>
        </center>
    </body>
</html>