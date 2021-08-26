<?php
    include("db_connect.php");
    
    $sql = "SELECT * FROM staff WHERE credits = (SELECT MAX(credits) FROM staff)";
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result) > 0){
        $empmonth = mysqli_fetch_all($result, MYSQLI_ASSOC);

    }else{
        echo "Error : ". mysqli_error($conn);
    }

    $name = $email = $msg = '';
    $error = array('name' => '', 'email' => '', 'msg' => '');
    if(isset($_POST['submit'])){
        if(empty($_POST['name'])){
            $error['name'] = "*Required";
        }else{
            $name = mysqli_real_escape_string($conn, $_POST['name']);
        }
        if(empty($_POST['email'])){
            $error['email'] = "*Required";
        }else{
            if(email_validation($_POST['email'])){
                $email =  mysqli_real_escape_string($conn, $_POST['email']);
            }else{
                $error['email'] = "*Invalid email";
            }
        }
        if(empty($_POST['msg'])){
            $error['msg'] = "*Required";
        }else{
            $msg = mysqli_real_escape_string($conn, $_POST['msg']);
        }
        if(! array_filter($error)){
            $sql = "INSERT INTO feedback (Cust_name, Cust_mail, Cust_msg) VALUES ('$name', '$email', '$msg')";
            if(mysqli_query($conn, $sql)){
                echo '<script type="text/javascript">';
                echo "setTimeout(function () { swal('Thank You', 'Your response recorded successfully !!', 'success');";
                echo '}, 1000);</script>';
                $name = $email = $msg = '';
            }else{
                echo "Insert Error : " . mysqli_error($conn);
            }
            //$to = "ajitesh2k1@gmail.com";
            //$subj = $name." - ".$email;
            //$txt = $msg;
            //if(mail($to, $subj, $txt)){
            //    echo '<script type="text/javascript">';
            //    echo "setTimeout(function () { swal('Delivered', 'Your response sent successfully !!', 'success');";
            //    echo '}, 1000);</script>';
            //}else{
            //    echo '<script type="text/javascript">';
            //    echo "setTimeout(function () { swal('Not Delivered', 'Try again later', 'info');";
            //    echo '}, 1000);</script>';
            //}
        }
    }
    function email_validation($str) {
        return (!preg_match("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$^", $str)) ? FALSE : TRUE;
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <title>CC Couriers</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="style/bootstrap.css">
        <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="style/index_styles.css">
        <link rel="icon" type="image/png" sizes="32x32" href="Images/favicon-32x32.png">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .carousel-inner img {
              width: 100%;
              height: 100%;
            }
        </style>
    </head>
    <body style="font-family: Arial, Helvetica, sans-serif;">
        <div ><img src="Images/logo.png" id="logo" style="height: 100px !important;  margin-top: 10px !important;"  ></div>
        <div class="background"></div> 
        <nav class="navbar navbar-toggleable-md navbar-expand-lg navbar-default navbar-light mb-10" style="background-color: rgba(255, 255, 255, 0.7); margin-bottom: 20px; margin-top:10px !important;">
            <div class="container">
                <button class="navbar-toggler text-dark" data-toggle="collapse" data-target="#mainNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="mainNav">
                    <div class="navbar-nav  " style="margin: 0 auto; font-size: large;">
                        <a class="nav-item nav-link text-dark mr-5 active" href="index.php" >Home</a>
                        <a class="nav-item nav-link text-dark mr-5" href="#about">About</a>
                        <a class="nav-item nav-link text-dark mr-5" href="tracking.php">Tracking</a>
                        <a class="nav-item nav-link text-dark mr-5" href="branches.php">Branches</a>
                        <a class="nav-item nav-link text-dark mr-5" href="#contact">Contact Us</a>
                        <a class="nav-item nav-link text-dark" href="login.php">Staff Login</a>                        
                    </div>
                </div>
            </div>
        </nav>
        <div class = "container-fluid" style="width: 100%; padding: 0; margin: 0;">
            <div id = "carouselwithIndicators" class = "carousel slide container-fluid mt-10" data-ride = "carousel" style="width: 85%; height: 100%; border-radius: 15px;">
               <ol class = "carousel-indicators ">
                  <li data-target = "#carouselExampleIndicators" data-slide-to = "0" class = "active"></li>
                  <li data-target = "#carouselExampleIndicators" data-slide-to = "1"></li>
                  <li data-target = "#carouselExampleIndicators" data-slide-to = "2s"></li>
               </ol>
               
               <div class =" carousel-inner">
                  <div class = "carousel-item active">
                     <img class = "d-block " 
                        src = "Images/c2.jpg" 
                        alt = "First slide" style="height: 80vh; width: fit-content;">
                  </div>
                  
                  <div class = "carousel-item">
                     <img class = "d-block " 
                        src = "Images/c3.jpg" 
                        alt = "Second slide" style="height: 80vh; width: fit-content;">
                  </div>
                  <div class = "carousel-item">
                     <img class = "d-block " 
                        src = "Images/c4.jpg" 
                        alt = "Third slide" style="height: 80vh; width: fit-content;">
                  </div>
               </div>
               
               <a class = "carousel-control-prev" href = "#carouselwithIndicators" role = "button" data-slide = "prev">
                  <span class = "carousel-control-prev-icon" aria-hidden = "true" style="color: black;"></span>
                  <span class = "sr-only">Previous</span>
               </a>
               
               <a class = "carousel-control-next " href = "#carouselwithIndicators" role = "button" data-slide = "next">
                  <span class = "carousel-control-next-icon" aria-hidden = "true" style="color: black;"></span>
                  <span class = "sr-only">Next</span>
               </a>
             </div>
         </div>
         <div class="container" id="about" style="margin-top: 20px; width: 85%;">
             <div class="row">
                <div class="col-md-6 p-5" style="background-color: rgba(255, 255, 255, 0.7); color: black; border-radius: 15px; ">
                    <h2 class="display-5 text-center mb-3 pb-2" style="border-bottom: 2px solid white;">About Us</h2>
                    <p>The launch of CC Couriers from the house of CC Cargo services is exclusively designed to meet the commercial and personal shipment needs of our customers in both urban and rural destinations. We are emerging as a top destination for ‘same-day’ transportation and are continuously serving our customers 24/7/365. We constantly expand our resources to cater to our customer expectation addressing their unique market needs.</p>
                    <p class="pb-3" style="border-bottom: 2px solid white;">Having created a brand in the cargo industry we have ventured into the courier business with the same commitment. We offer flexible and faster delivery solutions. We have spread our footprints far and wide with our bouquet of products and services. We deliver promptly for all your time critical projects.</p>
                </div>
                <div class="col-md-6">
                    <img src="Images/abt3.jpg" style="height: 500px; width: 100%; padding-top: 5%;" >
                </div>
             </div>
         </div>
         <div class="container" style="margin-top: 20px; width: 85%;">
            <div class="row">
                <div class="col-md-6 text-center p-5" style="background-color: rgba(255, 255, 255, 0.7); color: black; ">
                    <img src="Images/eom.jpg" style="width: 100%; border-top:2px solid white;" >
                    <?php foreach($empmonth as $emp) : ?>
                        <div style="margin:auto !important; border-bottom:2px solid white;">
                            <p class="text-center pt-2" style="font-family: 'Times New Roman', Times, serif !important; font-size:x-large;"><?php echo $emp['Name'] ?></p>
                            <p>Staff ID : <?php echo $emp['StaffID'] ?> </p>
                            <p>Credits : <?php echo $emp['Credits'] ?> </p>
                        </div>
                    <?php endforeach; ?>              
                </div>
                <div class="col-md-6 text-center p-5" style="background-color: rgba(255, 255, 255, 0.7); color: black;  "  id='contact'>
                        <h4 style="border-bottom:2px solid white; padding-bottom:2px;">Contact Us</h4>
                        <form action="index.php" class="form text-left" method = "POST">
                            <div class="form-group">
                                <label>Name : </label>
                                <input class="form-contact"  type="text" name = "name" value=<?php echo $name; ?>>
                                <span class="text-danger"><?php echo $error['name']; ?></span>
                            </div>
                            <div class="form-group">
                                <label>Email : </label>
                                <input class="form-contact"  type="text" name = "email" value=<?php echo $email; ?>>
                                <span class="text-danger"><?php echo $error['email']; ?></span>
                            </div>
                            <div class="form-group">
                                <label>Message : </label>
                                <textarea class="form-contact" name = "msg" required><?php echo $msg; ?></textarea>
                                <span class="text-danger"><?php echo $error['msg']; ?></span>
                            </div>
                            <input type="submit" name="submit" value="Submit"class="btn btn-info">
                        </form>
                </div>
             </div>
            
         </div>
         <div class="container-fluid text-center mt-5" style="background-color: rgba(255, 255, 255, 0.7); padding: 20px; position: relative; ">
            <div class="i-bar" style="display: flex; flex-direction: row; flex-wrap: wrap; justify-content:center; margin-bottom: 2em;">
                <a class="fa fa-facebook " href="#" style="border: none; text-decoration: none;  margin: 0em 1em; color:black; font-size: xx-large;"></a>
                <a class="fa fa-instagram" href="#" style="border: none; text-decoration: none;  margin: 0em 1em; color:black; font-size: xx-large;"></a>
                <a class="fa fa-envelope " href="#" style="border: none; text-decoration: none;  margin: 0em 1em; color:black; font-size: xx-large;"></a>
            </div>
            <p class="credit" style="font-size: 20px; font-stretch: 3px; text-align: center; color: black;">© CC COURIERS</p>
        </div>
    </body>
</html>