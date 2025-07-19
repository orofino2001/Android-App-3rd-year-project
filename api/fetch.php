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
if (!isset($data['username']) || !isset($data['password'])) {
    echo json_encode(["error" => "Username and password are required"]);
    exit;
}

$username = $conn->real_escape_string(trim($data['username']));
$password = $data['password']; // Don't trim passwords

// Get user from database
$stmt = $conn->prepare("SELECT User_ID, Username, Password_Hash, Rest_Timer FROM User WHERE Username = ?");
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo json_encode(["error" => "Invalid credentials"]);
    exit;
}

$user = $result->fetch_assoc();

// Verify password against stored hash
if (password_verify($password, $user['Password_Hash'])) {
    // Login successful - remove password hash from response
    unset($user['Password_Hash']);
    echo json_encode([
        "status" => "success",
        "user" => $user
    ]);
} else {
    echo json_encode(["error" => "Invalid credentials"]);
}

$stmt->close();
$conn->close();
?>