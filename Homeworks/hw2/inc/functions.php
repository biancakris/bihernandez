<?php

    function displayPrize($randomValue)
    {
        switch($randomValue)
        {
            case 0: $symbol = "car";
                    echo "<h1> You Won!! <br> New Car! <h1>";
                    break;
            case 1: $symbol = "macchu";
                    echo "<h1> You Won!! <br>A Trip to Macchupichhu! <h1>";
                    break;
            case 2: $symbol = "money";
                    echo "<h1> You Won!! <br>1 Million Dollars!! <h1>";
                    break;
            case 3: $symbol = "whitehouse";
                    echo "<h1> You Won!! <br>New House! <h1>";
                    break;
            case 4: $symbol = "emptyRoom";
                    echo "<h1> Sorry <br> You Picked an Empty Room! <h1>";
                    break;
            case 5: $symbol = "emptyRoom";
                    echo "<h1> Sorry <br> You Picked an Empty Room! <h1>";
                    break;
            case 6: $symbol = "emptyRoom";
                    echo "<h1> Sorry <br> You Picked an Empty Room! <h1>";
                    break;
            case 7: $symbol = "emptyRoom";
                    echo "<h1> Sorry <br> You Picked an Empty Room! <h1>";
                    break;
            case 8: $symbol = "emptyRoom";
                    echo "<h1> Sorry <br> You Picked an Empty Room! <h1>";
                    break;
            case 9: $symbol = "emptyRoom";
                    echo "<h1> Sorry <br> You Picked an Empty Room! <h1>";
                    break;
        }
        
        //print out prizes
        echo"<img id='prize' src = 'img/prizes/$symbol.png' alt='$symbol' height = '500' > ";
    }
    function displayDoor($randomValue, $pos)
    {
        echo"<a href = /bihernandez/Homeworks/hw3/prize.php> <img id='reel$pos' src= 'img/doors/door$randomValue.png' alt='door$randomValue' height='350'> </a>";
    }
    
    function play()
    {
        for($i=1; $i< 4; $i++)
        {
            ${"randomValue" } = rand(2,6);
            displayDoor($randomValue, $i);
        }
    }
?>