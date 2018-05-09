<!DOCTYPE html>
<html>
    <head>
        <link rel = "stylesheet" href = "css/styles.css"> 
        <link href="https://fonts.googleapis.com/css?family=Lora:700|Scope+One|Arvo|Slabo+27px" rel="stylesheet">
        <title> Choose Your Workout! </title>
    </head>
    


<!-- gennerate sql statement from session data and connect to database -->
<?php
    session_start();
    
    include "connectDB.php";
    $con = connect();
    //$sql = makeSQL();
    
    function makeSQL(){
        $result = "SELECT DISTINCT exercise.name, exercise.description 
            From exercise, exerciseMuscle  
            WHERE ( ";
        //var_dump($result);
        //var_dump($_SESSION);
            
        if($_SESSION["goal"] === "weightLoss"){
            $result .= " muscleGroup=(SELECT muscleGroupId FROM muscleGroup WHERE name='cardio')  OR ";
        }
        
        //var_dump($_SESSION["muscleGroup"]);
        
        foreach($_SESSION["muscleGroupId"] as $mg){
            $result .= " muscleGroup=$mg OR ";
        }
        
        foreach($_SESSION["muscleId"] as $m){ 
            $result .= " (exercise.exerciseId = exerciseMuscle.exerciseId and $m = exerciseMuscle.muscleId) OR ";
        }
        
        if(substr($result,-3,3) === "OR "){//remove 'OR ' from end
            $result = substr($result,0,strlen($result) - 3);
        }
        
        $result .= " ) ";
        switch( intval($_SESSION["difficulty"]) ){ // TODO: fix bug where weighted stuff comes through when user selects difficulty 1
            case 1:
                $result .= " AND exercise.equipmentId=(SELECT equipment.equipmentId FROM equipment WHERE name='none') ";    
                //echo "<div>switch case one went through</div><br><br><br><br><br><br><div>switch case one went through</div>";
                break;
            case 2:
                // not sure what to put here
                break;
            case 3:
                $result .= " AND exercise.equipmentId<>(SELECT equipment.equipmentId FROM equipment WHERE name='none') ";
                break;
        }
        
        
        if( $_GET["sorts"] != null ){ 
            $result .= " ORDER BY " . $_GET["sorts"];
        }
        else{
            $result .= " ORDER BY exercise.muscleGroup";
        }
        
        // var_dump($result);
        return $result;
    }
    
    $sql = makeSQL();
    
    $stmt = $con->prepare($sql);
    $stmt->execute();
    
    $exercises = array();
    
    while($row = $stmt->fetch()){
        array_push($exercises,array("description"=>$row["description"],"name"=>$row["name"]));
    }
    
     //var_dump( $exercises[12]["name"] );
     //var_dump($exercises);
?>
    <form class="right" action="choicePage.php" method="GET">
        <label>Sort By:</label>
        <select name="sorts" onchange="this.form.submit()">
            <option selected="selected">--</option>
            <option value="exercise.muscleGroup">muscle group</option>
            <option value="exerciseMuscle.muscleId">muscle</option>
            <option value="exercise.equipmentId">equipment</option>
        </select>
        
    </form>
    
    <form action="processChoice.php" method="POST">
        <body>
            <!--Header-->
            <center>
            <div id = 'header' style = "">
                <img src = "https://images.clipartuse.com/b6504904f5e194032e61f36898164b42_muscle-arm-clip-art-6-pack-abs-are-still-possible-this-summer-_400-400.png" style = "width:75px; height:75px;;">
                Body Buddy
                <img src = "https://images.clipartuse.com/b6504904f5e194032e61f36898164b42_muscle-arm-clip-art-6-pack-abs-are-still-possible-this-summer-_400-400.png" style = "width:75px; height:75px; transform: scaleX(-1)">
                <div id = 'headSubtitle'>
                   Be Ready to Get Sweaty!!
                </div> 
            </div>
            <center/>
        
            <img src = "https://s-media-cache-ak0.pinimg.com/originals/09/3d/02/093d0274d12253d5540c82b708e72e1a.png" style = "height:350px; float:left; ">
            <img src = "http://vignette2.wikia.nocookie.net/animatedmusclewomen/images/b/b8/Amber_by_thefranksterchannel-da8ys4n.png/revision/latest?cb=20160705163233" style = "height: 350px; float: right;">
            <div class = "content" styles = "margin-bottom: 20px">
                 <div class = "choiceScroll" id = "exercises" >
                     
                     <table id= "choice">
                         
                         <?php
                             $counter = 1;
                             $i = 0;
                             for($i = 0; $i < sizeof($exercises); $i++ )
                            //  while($i < sizeof($exercises))
                             {
                                echo "<tr>
                                    <td>
                                        <center>
                                        <label style = 'text-transform: capitalize;'>
                                           <input type='checkbox' name=exercise[] value='" . $exercises[$i]['name'] . "'>". $exercises[$i]['name']."<br>
                                           <div class = 'choiceContainer' style = 'text-transform: capitalize;'>
                                               <img class='goals hvrbox-layer_bottom' src= 'img/exercises/". $exercises[$i]['name']. ".gif' alt= 'Exercise' class = 'choiceImages'styles = 'width: 100%;'>
                                               <div class = 'choiceMiddle'>
                                                   <div class = 'choiceText'>" . $exercises[$i]['description'] ."</div>
                                               </div>
                                           </div>
                                        </label>
                                        </center>
                                    </td>";
                                    $counter++;
                                    $i++;
                                    echo"
                                    <td>
                                        <center>
                                        <label style = 'text-transform: capitalize;'>
                                           <input type='checkbox' name=exercise[] value='" . $exercises[$i]['name'] . "'>". $exercises[$i]['name']."<br>
                                           <div class = 'choiceContainer'>
                                               <img class='goals hvrbox-layer_bottom' src= 'img/exercises/". $exercises[$i]['name']. ".gif' alt= 'Exercise' class = 'choiceImages'styles = 'width: 100%;'>
                                               <div class = 'choiceMiddle'>
                                                   <div class = 'choiceText'>" . $exercises[$i]['description'] ."</div>
                                               </div>
                                           </div>
                                        </label>
                                        </center>
                                    </td>";
                                $counter++;
                                $i++;
                                    echo"
                                    <td>
                                        <center>
                                        <label style = 'text-transform: capitalize; text-align: center;'>
                                           <input type='checkbox' name=exercise[] value='" . $exercises[$i]['name'] . "'>". $exercises[$i]['name']."<br>
                                           <div class = 'choiceContainer'>
                                               <img class='goals hvrbox-layer_bottom' src= 'img/exercises/". $exercises[$i]['name']. ".gif' alt= 'Exercise' class = 'choiceImages'styles = 'width: 100%;'>
                                               <div class = 'choiceMiddle'>
                                                   <div class = 'choiceText'>" . $exercises[$i]['description'] ."</div>
                                               </div>
                                           </div>
                                        </label>
                                        </center>
                                    </td>
                                </tr>";
                                $counter++;
                             }
                         ?>
                     </table>
                  </div>
            </div>
            
                <input type="submit" value="Get Your Workout"/></center>
         
        </body>
    </form>

</html>