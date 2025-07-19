<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Database configuration
$host = "165.227.235.122";
$db_name = "ado19_GymApp";
$db_user = "ado19_gym";
$db_pass = "Rachel-1971";

// Create connection
$conn = new mysqli($host, $db_user, $db_pass, $db_name);

// Check connection
if ($conn->connect_error) {
    die(json_encode(["error" => "Database connection failed"]));
}

// Get POST data
$json = file_get_contents('php://input');
$data = json_decode($json, true);

// Validate input
if (!isset($data['username']) || !isset($data['email']) || !isset($data['password'])) {
    echo json_encode(["error" => "All fields are required"]);
    exit;
}

$username = trim($data['username']);
$email = trim($data['email']);
$password = $data['password']; // Get plaintext password

// Validate password strength
if (strlen($password) < 8) {
    echo json_encode(["error" => "Password must be at least 8 characters"]);
    exit;
}

// Hash the password (PHP will handle the secure hashing)
$password_hash = password_hash($password, PASSWORD_BCRYPT);

// Check if user exists
$stmt = $conn->prepare("SELECT User_ID FROM User WHERE Username = ? OR Email = ?");
$stmt->bind_param("ss", $username, $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    echo json_encode(["error" => "Username or email already exists"]);
    exit;
}

// Insert new user
$stmt = $conn->prepare("INSERT INTO User (Username, Email, Password_Hash, Join_Date) VALUES (?, ?, ?, NOW())");
$stmt->bind_param("sss", $username, $email, $password_hash);

if ($stmt->execute()) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["error" => "Registration failed"]);
}

$stmt->close();
$conn->close();
?>