<?php

session_start();

session_unset();

//echo "<div>post</div>";
//var_dump($_POST);



$_SESSION["goal"] = $_POST["goal"];

$_SESSION["difficulty"] = $_POST["difficulty"];

$_SESSION["time"] = $_POST["time"];

$_SESSION["muscleGroupId"] = $_POST["muscleGroupId"];

$_SESSION["muscleId"] = $_POST["muscleId"];

$_SESSION["time"] = $_POST["time"];

//echo "<div>session</div>";

//var_dump($_SESSION);

header("Location: choicePage.php");

?>