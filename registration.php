<?php
// Database configuration
$host = 'localhost';
$dbName = 'fp_tpm';
$username = 'root';
$password = '';

// Create a connection
$conn = new mysqli($host, $username, $password, $dbName);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve data from the registration form
$name = $_POST['name'];
$email = $_POST['email'];
$password = $_POST['password'];

// Encrypt the password
$encryptedPassword = md5($password); // You can use other encryption methods for better security

// Insert the user data into the database
$sql = "INSERT INTO registered (name, email, password) VALUES ('$name', '$email', '$encryptedPassword')";

if ($conn->query($sql) === TRUE) {
    echo "Registration successful";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
