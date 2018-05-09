<?php
    $backgroundImage = "img/sea.jpg";
    
    //API call goes here
    if (isset($_GET['keyword']))
    {
        include 'api/pixabayAPI.php';
        echo "<h3>You searched for " . $_GET['keyword'] . "</h3>";
        $imageURLs = getImageURLs($_GET['keyword']);
        $backgroundImage = $imageURLs[array_rand($imageURLs)];
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <title> Image Carousel </title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <style>
            @import url("css/styles.css");
            body{
                background-image: url(' <?=$backgroundImage ?> ');
            }
        </style>
    </head>
    <body>
        <br/> <br/>
        <?php
            if(!isset($imageURLs)){
                echo "<h2> Type a keyword to display a slideshow <br/> with random images from Pixabay.com </h2>";
            }
            else
            {
                //Display Carousel Here
                
        ?>
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!--Indicators Here-->
            
            <!--Wrapper for Images-->
            <div class="carousel-inner" role="listbox">
                <?php
                    for($i = 0; $i < 5; $i++)
                    {
                        do 
                        {
                            $randomIndex = rand(0,count($imageURLs));
                        } while (!isset($imageURLs[randomIndex]));
                        
                        echo '<div class="item ';
                        echo ($i == 0)?"active": "";
                        echo '">';
                        echo '<img src="' . $imageURLs[$randomIndex] . '">';
                        echo '</div>';
                        unset($imageURLs[$randomIndex]);
                    }
                ?>
            </div>
            
            <!--Controls Here-->
        </div>
            
               
        ?>
        <h1>I'm a regular HTML tag inside the PHP else statement!</h1>
        
        <?php
            }
        ?>
        
        
        <!--HTML form goes here-->
        <form>
            <input type="text" name="keyword" placeholder="keyword">
            <input type="submit" value="Submit" />
        </form>
    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>