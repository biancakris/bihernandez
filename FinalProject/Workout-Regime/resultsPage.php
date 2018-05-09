<!DOCTYPE html>
<html>
    <head>
        <link rel = "stylesheet" href = "css/styles.css">
        <link href="https://fonts.googleapis.com/css?family=Lora:700|Scope+One|Arvo|Slabo+27px" rel="stylesheet">
        <title> Get Results! </title>
    </head>
    
    
<?php
    session_start();
    
    include "connectDB.php";
    
    $con = connect();
?>

    <body>
        
        <!--Header-->
        <center>
        <div id = 'header' style = "margin-bottom: 10px;">
            <img src = "https://img.clipartfox.com/4bb8b858f34acd68a373e98093b52d2f_muscular-arm-with-weights-muscular-arm-clipart_434-480.png" style = "width:75px; height:75px;;">
            Body Buddy
            <img src = "https://img.clipartfox.com/4bb8b858f34acd68a373e98093b52d2f_muscular-arm-with-weights-muscular-arm-clipart_434-480.png" style = "width:75px; height:75px; transform: scaleX(-1)">
           <div id = 'headSubtitle'>
               Be Ready to Get Sweaty!!
           </div> 
        </div>
        </center>
        
        <img src = "https://s-media-cache-ak0.pinimg.com/originals/09/3d/02/093d0274d12253d5540c82b708e72e1a.png" style = "height:350px; float:left; ">
        <img src = "http://vignette2.wikia.nocookie.net/animatedmusclewomen/images/b/b8/Amber_by_thefranksterchannel-da8ys4n.png/revision/latest?cb=20160705163233" style = "height: 350px; float: right;">        
         
        <center>   
        <div id="timer" style = "margin-bottom: 0px;">Total Time 00:<?php echo $_SESSION["time"]; ?>:00 </div>
        <div class = "content" style = "margin-top: 0px;">
            <div class="scrollBox" id="workout">
                <table>
                    <?php
                        $count = 0;
                        foreach($_SESSION["exercise"] as $ex){
                            
                            $sql = "SELECT muscle.name AS m_name, exercise.description, equipment.name AS e_name
                                    FROM exerciseMuscle 
                                    JOIN muscle
                                    ON muscle.muscleId = exerciseMuscle.muscleId
                                    JOIN exercise
                                    ON exercise.exerciseId = exerciseMuscle.exerciseId
                                    JOIN equipment
                                    ON exercise.equipmentId = equipment.equipmentId
                                    WHERE exercise.name = '$ex'";
                            $stmt = $con->prepare($sql);
                            $stmt->execute();
                            
                            $muscles = array();
                            
                            while($row = $stmt->fetch()){
                                array_push($muscles, array("muscle"=>$row["m_name"],"description"=>$row["description"], "equipment"=>$row["e_name"]));
                            }       
                            
                            
                            echo "<tr style = 'text-transform: capitalize; '>";
                                if($count % 2 != 0){
                                    echo "<td><img src= 'img/exercises/" . $ex . ".gif' alt= 'Exercise' class = 'choiceImages'styles = 'width: 100%;'></td>";
                                }
                                echo "<td style = 'text-transform: capitalize; padding-left:10px; padding-right: 10px;'>";
                                    echo  "$ex <br>";
                                    echo "Equipment: " . $muscles[0]["equipment"] . "<br>";
                                    echo "Muscle(s): ";
                                    for($i = 0;$i < (sizeof($muscles) - 1);++$i){
                                        echo $muscles[$i]["muscle"] . ", ";
                                    }
                                    echo $muscles[sizeof($muscles) - 1]["muscle"] . "<br>";
                                    echo "Description: " . $muscles[0]["description"] . "<br>";
                                echo "</td>";
                                if($count % 2 == 0){
                                    echo "<td> <img src= 'img/exercises/" . $ex . ".gif' alt= 'Exercise' class = 'choiceImages'styles = 'width: 100%;'></td>";
                                }
                            echo "</tr>";
                        
                            ++$count;
                        }
                        
                        
                    ?>
                </table>
            </div>
            
        </div>
        
    </body>
</html>