//<?php
$host = "165.227.235.122";  // Usually "localhost" or your server IP
$user = "ado19_gym";
$password = "Rachel-1971";
$database = "ado19_GymApp";

// Create connection
$conn = new mysqli($host, $user, $password, $database);

// Check connection
if ($conn->connect_error) {
    die(json_encode(["status" => "error", "message" => $conn->connect_error]));
} else {
    echo json_encode(["status" => "success", "message" => "Connected .successfully"]);
}
?>
