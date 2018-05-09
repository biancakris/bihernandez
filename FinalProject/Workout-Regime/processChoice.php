<?php
    session_start();
    
    var_dump($_POST);
    
    $_SESSION["exercise"] = $_POST["exercise"];
    
    header("Location: resultsPage.php");
?>