<?php
define('HOST', 'localhost');
define('USER', 'root');
define('PASS', '');
define('DB', 'fp_tpm');
$connect = mysqli_connect(HOST, USER, PASS, DB) or die('Not Connect');
?>


<?php
// For Running
$email = $_POST['email'];
$password = $_POST['password'];
// http://192.168.1.22/flutter/login.php
// //For Testing
// $email = 'test@GMAIL.COM';
// $password = '123456';

$queryResult=$connect->query("SELECT * FROM registered
WHERE email='".$email."' and password='".$password."'");
$result=array();

while($fetchData=$queryResult->fetch_assoc()) {
	$result[]=$fetchData;
}

//Send back data to Flutter
    if($result){
        echo json_encode($result);
    }else{
        echo json_encode('');
    }
?>