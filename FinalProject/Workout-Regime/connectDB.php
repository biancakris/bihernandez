<?php
    function connect(){
        
        $servername = getenv('IP');
        $dbPort = 3306;

        $database = "Workout";
        
        $username = getenv('C9_USER');
        $password = "mySQL";
    
        $dbConn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
        $dbConn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        return $dbConn;
    }
?>