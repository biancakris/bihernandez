<?php 
    include "connectDB.php";
    
    $dbConn = connect();
    
    function showMuscles()
    {
        global $dbConn;
        $upperMuscles = "SELECT muscle.name , muscle.muscleId FROM muscle WHERE muscle.muscleGroupId = 1";
        $stmt = $dbConn->prepare($upperMuscles);
        $stmt->execute();
        
        // upper body
        echo "<td valign=top style='color:#59429E;'> <h3>Upper Body</h3>";
        
        while($row = $stmt->fetch())
        {
            // echo "<option value=$name>" . $row['name'] . "</option>";
            echo "<input type='checkbox' name='muscleId[]' value='" . $row['muscleId'] . "'/>" . $row['name'] . "<BR>";
        }
                
        echo "</td></select>";
                
                
        $coreMuscles = "SELECT muscle.name , muscle.muscleId FROM muscle WHERE muscle.muscleGroupId = 2";
        $stmt2 = $dbConn->prepare($coreMuscles);
        $stmt2->execute();
        
        // core
        echo "<td valign=top  style='color:#59429E;'> <h3>Core</h3>";
        
        while($row = $stmt2->fetch())
        {
            // echo "<option value=$name>" . $row['name'] . "</option>";
            echo "<input type='checkbox'    name='muscleId[]' value='" . $row['muscleId'] . "'/>" . $row['name'] . "<BR>";
        }
                
        echo "</td></select>";
        
        $upperMuscles = "SELECT muscle.name , muscle.muscleId FROM muscle WHERE muscle.muscleGroupId = 3";
        $stmt = $dbConn->prepare($upperMuscles);
        $stmt->execute();
        
        // upper body
        echo "<td valign=top  style='color:#59429E;'> <h3>Lower Body</h3>";
        
        while($row = $stmt->fetch())
        {
            // echo "<option value=$name>" . $row['name'] . "</option>";
            echo "<input type='checkbox' name='muscleId[]' value='" . $row['muscleId'] . "'/>" . $row['name'] . "<BR>";
        }
                
        echo "</td></select>";
        
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Goals</title>
        <link rel = "stylesheet" href = "css/styles.css"> 
        <link href="https://fonts.googleapis.com/css?family=Lora:700|Scope+One|Arvo|Slabo+27px" rel="stylesheet">
    </head>
    
    
    <body>
        <center>
        <div id = 'header' style = "">
            <img src = "https://img.clipartfox.com/4bb8b858f34acd68a373e98093b52d2f_muscular-arm-with-weights-muscular-arm-clipart_434-480.png" style = "width:75px; height:75px;;">
            Body Buddy
            <img src = "https://img.clipartfox.com/4bb8b858f34acd68a373e98093b52d2f_muscular-arm-with-weights-muscular-arm-clipart_434-480.png" style = "width:75px; height:75px; transform: scaleX(-1)">
           <div id = 'headSubtitle'>
               Be Ready to Get Sweaty!!
           </div> 
        </div>
       
        

        <form action="processGoals.php" method="POST">
        <div id="goalsContent" >
            <img src = "https://s-media-cache-ak0.pinimg.com/originals/09/3d/02/093d0274d12253d5540c82b708e72e1a.png" style = "height:400px; float:left;postion: absolute; bottom: 0px; ">
            <img src = "http://vignette2.wikia.nocookie.net/animatedmusclewomen/images/b/b8/Amber_by_thefranksterchannel-da8ys4n.png/revision/latest?cb=20160705163233" style = "height: 400px; float: right;">
        
            <table cellspacing="40" class="content" style="margin-left:0px;">
                <tr><th colspan=3></th></tr>
                <tr>
                    <!--start select goal-->
                    <td valign="top">
                        <h2>Select Goal</h2>
                        
                        <label>
                            <input type="radio" name="goal" value="muscleGain" selected="selected"/>
                            <img class="goals hvrbox-layer_bottom" src="img/goals/muscle-gain-2.png" title="Muscle Gain">
                        </label>
                        
                        <label>
                            <input type="radio" name="goal" value="weightLoss" />
                            <img class="goals hvrbox-layer_bottom" src="img/goals/weight-loss-2.png" title="Weight Loss">
                        </label>
                        
                    </td>
                    <!--end select goal-->
                    <td></td>
                    <!--start difficulty-->
                    <td valign="top">
                        <h2>Select Difficulty</h2>
                        
                        <label>
                            <input type="radio" name="difficulty" value="1" selected="selected" />
                            <img class="difficulty hvrbox-layer_bottom" src="img/goals/beginner.png" title="Beginner">
                        </label>
                        
                        <label>
                            <input type="radio" name="difficulty" value="2" />
                            <img class="difficulty hvrbox-layer_bottom" src="img/goals/intermediate.png" title="Intermediate">
                        </label>
                        
                        <label>
                            <input type="radio" name="difficulty" value="3" />
                            <img class="difficulty hvrbox-layer_bottom" src="img/goals/advanced.png" title="Advanced">
                        </label>
                        
                    </td>
                    <!--end difficulty-->
                </tr>
                    
                <tr>
                    <!--start select muscle group-->
                    <td valign="top">
                        <h2>Select Muscle Group(s)</h2>
                        
                        <label>
                            <input type="checkbox" name="muscleGroupId[]" value="1" selected="selected"/><img class="muscles hvrbox-layer_bottom" src="img/goals/arms.png" title="Upper Body">
                        </label>
                        <label>
                            <input type="checkbox" name="muscleGroupId[]" value="2"/><img class="muscles hvrbox-layer_bottom" src="img/goals/core.png" title="Core">
                        </label>
                        
                        <BR>
                        <label>
                            <input type="checkbox" name="muscleGroupId[]" value="3"/><img class="muscles hvrbox-layer_bottom" src="img/goals/legs.png" title="Lower Body">
                        </label>
                        <label>
                            <input type="checkbox" name="muscleGroupId[]" value="4"/><img class="muscles hvrbox-layer_bottom" src="img/goals/cardio.png" title="Cardio">
                        </label>
                    </td>
                    <!--end select muscle group-->
                    
                    <td></td>
                    
                    <!--start muscle-->
                    <td valign="top">
                        <table >
                            <tr><h2>Select Muscle(s)</h2></tr>
                            
                            <tr>
                                <?= showMuscles() ?>
                            </tr>
                        </table>
                
                    </td>
        
                </tr>
                
                <tr>
                    <td>
                        <!--start time-->
                <center>
                    <h2>Specify Time</h2>
                        <input type="text" name="time" placeholder="30"> <text style="color:#CD5334; font-family: 'Slabo 27px', serif; font-size:20px;">minutes</text>
                </center>
                <!--end time-->
                    </td>
                </tr>
                </table>
                
                
                
                <BR>
            
            <input type="submit" value="get ripped"/></center>
        </div>
        </form>
    </body>
</html>