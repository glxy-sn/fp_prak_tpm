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

// Retrieve data from the login form
$email = $_POST['email'];
$password = $_POST['password'];

// Encrypt the password
$encryptedPassword = md5($password); // You can use other encryption methods for better security

// Check if the email and password match any user in the database
$sql = "SELECT * FROM registered WHERE email='$email' AND password='$encryptedPassword'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Login successful
    echo "Login successful";
} else {
    // Login failed
    echo "Invalid email or password";
}

$conn->close();
?>
