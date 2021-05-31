<?php 
    include("db_connect.php");
    
    $id = $pwd = '';
    $errors = array('id' => '', 'pwd' => '', 'login' => '');

    if(isset($_POST['submit'])){
        if(empty($_POST['id'])){
            $errors['id'] = "*Required";
        }else{
            $id = $_POST['id'];
        }
        if(empty($_POST["pwd"])){
            $errors['pwd'] = "*Required";
        }else{
            $pwd = $_POST['pwd'];
        }
        if(array_filter($errors)){
            //echo errors
        }else{
            $id = mysqli_real_escape_string($conn, $id);
            $pwd = mysqli_real_escape_string($conn, $pwd);

            $sql = "SELECT * FROM credentials WHERE StaffID='$id' AND Pwd='$pwd'";
            $result = mysqli_query($conn, $sql);
            if(mysqli_num_rows($result) > 0){
                $user = mysqli_fetch_assoc($result);
                session_start();
                $_SESSION['id'] = $user['StaffID'];
                header("Location: staff.php");
            }else{
                $sql = "SELECT * FROM credentials WHERE StaffID='$id'";
                $result = mysqli_query($conn, $sql);
                if(mysqli_num_rows($result) == 0){
                    $errors['login'] = 'Enter valid Staff ID';
                }else{
                    $user = mysqli_fetch_assoc($result);
                    if($pwd != $user['Pwd']){
                        $errors['login'] = 'Incorrect Password';
                    }
                }
            }
        }
        
    }
    mysqli_close($conn);

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
    </head>
    <body style="font-family: Arial, Helvetica, sans-serif;">
        <div ><img src="Images/logo.png" id="logo" style="height: 100px !important;  margin-top: 10px !important;" ></div>
        <div class="background"></div> 
        <nav class="navbar navbar-toggleable-md navbar-expand-lg navbar-default navbar-light mb-10" style="background-color: rgba(255, 255, 255, 0.7);  margin-top:10px !important;">
            <div class="container">
                <button class="navbar-toggler text-dark" data-toggle="collapse" data-target="#mainNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="mainNav">
                    <div class="navbar-nav  " style="margin: 0 auto; font-size: large;">
                        <a class="nav-item nav-link text-dark mr-5 " href="index.php" >Home</a>
                        <a class="nav-item nav-link text-dark mr-5" href="index.php#about">About</a>
                        <a class="nav-item nav-link text-dark mr-5" href="tracking.php">Tracking</a>
                        <a class="nav-item nav-link text-dark mr-5" href="branches.php">Branches</a>
                        <a class="nav-item nav-link text-dark mr-5" href="index.php#contact">Contact Us</a>
                        <a class="nav-item nav-link text-dark active" href="#">Staff Login</a>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container text-center p-3" style="background-color: rgba(255, 255, 255, 0.7); margin-top: 20px; border-radius: 15px; width: 35%;">
        
            <img src="Images/userlogo.png" style="margin:0 auto; height: 140px; width: 140px; margin-bottom: 15px;">
            <form class="form" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
                <div class="form-group">
                    <label style="font-size: 20px;">Staff ID : </label>
                    <input type="text" style="border-radius: 8px;" name="id" value="<?php echo htmlspecialchars($id)?>" >
                    <label class="text-danger"><?php echo $errors['id'];?></label>
                </div>
                <div class="form-group">
                    <label style="font-size: 20px;">Password : </label>
                    <input type="password" style="border-radius: 8px;" name="pwd" value="<?php echo htmlspecialchars($pwd)?>" >
                    <label class="text-danger"><?php echo $errors['pwd'];?></label>
                </div>
                <label class="text-danger"><?php echo $errors['login'];?></label>
                <input type="submit" name="submit" class="btn btn-light text-center" value="Sign In" style="font-size: 20px;">
            </form>
        </div>
        <div class="container-fluid text-center mt-5" style="background-color: rgba(255, 255, 255, 0.7); padding: 20px; position: absolute; bottom: 0; left: 0; ">
            <div class="i-bar" style="display: flex; flex-direction: row; flex-wrap: wrap; justify-content:center; margin-bottom: 2em;">
                <a class="fa fa-facebook " href="#" style="border: none; text-decoration: none;  margin: 0em 1em; color:black; font-size: xx-large;"></a>
                <a class="fa fa-instagram" href="#" style="border: none; text-decoration: none;  margin: 0em 1em; color:black; font-size: xx-large;"></a>
                <a class="fa fa-envelope " href="#" style="border: none; text-decoration: none;  margin: 0em 1em; color:black; font-size: xx-large;"></a>
            </div>
            <p class="credit" style="font-size: 20px; font-stretch: 3px; text-align: center; color: black;">© CC COURIERS</p>
        </div>
    </body>
</html>