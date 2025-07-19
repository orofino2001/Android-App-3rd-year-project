<?php
// Database connection
$host = "165.227.235.122";
$user = "ado19_gym";
$password = "Rachel-1971";
$database = "ado19_GymApp";

$conn = new mysqli($host, $user, $password, $database);

// Check connection
if ($conn->connect_error) {
    error_log("Connection failed: " . $conn->connect_error);
    die("Connection failed: " . $conn->connect_error);
}

// Get POST data
$user_id = isset($_POST['user_id']) ? intval($_POST['user_id']) : null;
$rest_timer = isset($_POST['rest_time']) ? intval($_POST['rest_time']) : null;
$theme = isset($_POST['theme']) ? intval($_POST['theme']) : null;
$kg_or_lbs = isset($_POST['kg_or_lbs']) ? intval($_POST['kg_or_lbs']) : null;

// Validate input
if ($user_id === null || $rest_timer === null || $theme === null || $kg_or_lbs === null) {
    error_log("Invalid input: user_id=$user_id, rest_time=$rest_timer, theme=$theme, kg_or_lbs=$kg_or_lbs");
    echo json_encode(["status" => "error", "message" => "Invalid input"]);
    exit;
}

// Update query
$sql = "UPDATE User SET Rest_Timer = ?, Theme = ?, Kg_Or_Lbs = ? WHERE User_ID = ?";
error_log("Preparing SQL: $sql");

$stmt = $conn->prepare($sql);

if ($stmt) {
    $stmt->bind_param("iiii", $rest_timer, $theme, $kg_or_lbs, $user_id);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Preferences updated successfully"]);
    } else {
        error_log("Failed to execute statement: " . $stmt->error);
        echo json_encode(["status" => "error", "message" => "Failed to update preferences: " . $stmt->error]);
    }

    $stmt->close();
} else {
    error_log("Failed to prepare statement: " . $conn->error);
    echo json_encode(["status" => "error", "message" => "Failed to prepare statement: " . $conn->error]);
}

$conn->close();
?>