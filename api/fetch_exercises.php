<?php
$host = "165.227.235.122";
$db_name = "ado19_GymApp";
$db_user = "ado19_gym";
$db_pass = "Rachel-1971";


// Create connection
$conn = new mysqli($host, $db_user, $db_pass, $db_name);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT Exercise_ID, Exercise_Name, Category_ID, Description, Difficulty_Level, Diagram FROM Exercise";
$result = $conn->query($sql);

$exercises = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $exercises[] = $row;
    }
}

echo json_encode($exercises);

$conn->close();
?>