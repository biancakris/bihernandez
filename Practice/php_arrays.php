<?php

 $cards = array("ace","one", 2);
 //print_r($cards); //for debugging purposes, shows all elements in array

 //echo $cards[0];
 
 $cards[] = "jack"; //adds new element at the end of the array
 array_push($cards, "queen", "king");
 
 $cards[2] = "ten";

 //print_r($cards); 
 
 echo "<img src='../../Challenges/Challenge2/img/cards/clubs/$cards[0].png'/>";
 
 

?>


<!DOCTYPE html>
<html>
    <head>
        <title> </title>
    </head>
    <body>

    </body>
</html>