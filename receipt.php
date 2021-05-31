<?php
    include("db_connect.php");
    
    date_default_timezone_set('Asia/Kolkata');
    $date = date('d-m-Y');
    $time = date('h:i:s a');

    $sql = "SELECT * FROM parcel ORDER BY TrackingID DESC LIMIT 1";
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result) > 0){
        $order = mysqli_fetch_assoc($result);
    }else{
        echo 'Data fetch Error : '.mysqli_error($conn);
    }
    if(isset($_POST['back'])){
        header("Location: staff.php");
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
    </head>
    <body style="font-family: Arial, Helvetica, sans-serif;">
        <div ><img src="Images/logo.png" id="logo" style="height: 100px !important; margin-top: 10px !important;"  ></div>
        <div class="background"></div>  
        <div class="container p-5"  style="background-color: rgba(255, 255, 255, 0.7); margin-top: 10px !important">
            <h2 class="display-4 text-center" style="border-bottom: 2px solid black; margin-bottom:15px !important;">Receipt</h2>
            <p><span class="font-weight-bold">Date-Time : </span><?php echo $date.'  '.$time; ?> </p>
            <p><span class="font-weight-bold">Tracking ID : </span><?php echo $order['TrackingID']; ?> </p>
            <p> <span class="font-weight-bold">Staff ID : </span> <?php echo $order['StaffID']; ?> </p>
            <p><span class="font-weight-bold">Sender : </span> <?php echo $order['S_Name'].', '.$order['S_Add'].', '.$order['S_City'].', '.$order['S_State'].' - '.$order['S_Contact']; ?> </p>
            <p><span class="font-weight-bold">Receiver : </span><?php echo $order['R_Name'].', '.$order['R_Add'].', '.$order['R_City'].', '.$order['R_State'].' - '.$order['R_Contact']; ?></p>
            <p><span class="font-weight-bold">Weight : </span><?php echo $order['Weight_Kg'].' KG'; ?> </p>
            <p><span class="font-weight-bold">Price : </span><?php echo 'Rs '.$order['Price']; ?> </p>
            <form method="POST" action="" class="text-center">        
                <input type="submit" name="back" value="Back" class="btn btn-dark">
                <input type="submit" name="print" value="Print" class="btn btn-info" onclick="window.print()">
            </form>
        </div>
        <div class="container-fluid text-center mt-5" style="background-color: rgba(255, 255, 255, 0.7); padding: 20px; position: relative;">
            <div class="i-bar" style="display: flex; flex-direction: row; flex-wrap: wrap; justify-content:center; margin-bottom: 2em;">
                <a class="fa fa-facebook " href="#" style="border: none; text-decoration: none;  margin: 0em 1em; color:black; font-size: xx-large;"></a>
                <a class="fa fa-instagram" href="#" style="border: none; text-decoration: none;  margin: 0em 1em; color:black; font-size: xx-large;"></a>
                <a class="fa fa-envelope " href="#" style="border: none; text-decoration: none;  margin: 0em 1em; color:black; font-size: xx-large;"></a>
            </div>
            <p class="credit" style="font-size: 20px; font-stretch: 3px; text-align: center; color: black;">© CC COURIERS</p>
        </div>
    </body>
</html>