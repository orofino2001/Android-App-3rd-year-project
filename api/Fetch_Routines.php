<?php
header('Content-Type: application/json');

// Database connection
$host = "165.227.235.122";
$db = "ado19_GymApp"; // Correct variable name
$user = "ado19_gym";  // Correct variable name
$pass = "Rachel-1971"; // Correct variable name

// Enable error logging
ini_set('log_errors', 1);
ini_set('error_log', __DIR__ . '/error_log');

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Get User_ID from the request
    $userId = isset($_GET['user_id']) ? intval($_GET['user_id']) : -1;

    // Log the received User_ID
    error_log("Received User_ID: $userId");

    if ($userId == -1) {
        echo json_encode(['error' => 'Invalid User_ID']);
        exit;
    }

    // Query to fetch routines for the given User_ID
    $stmt = $pdo->prepare("
        SELECT r.Routine_ID, r.User_ID, r.Routine_Name, r.Routine_Description, re.Exercise_ID, re.Set_Count
        FROM Routine r
        LEFT JOIN Routine_Exercises re ON r.Routine_ID = re.Routine_ID
        WHERE r.User_ID = :user_id
    ");
    $stmt->bindParam(':user_id', $userId, PDO::PARAM_INT);
    $stmt->execute();

    $routines = [];
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $routineId = $row['Routine_ID'];
        if (!isset($routines[$routineId])) {
            $routines[$routineId] = [
                'Routine_ID' => $row['Routine_ID'],
                'User_ID' => $row['User_ID'],
                'Routine_Name' => $row['Routine_Name'],
                'Routine_Description' => $row['Routine_Description'],
                'Exercises' => []
            ];
        }
        if ($row['Exercise_ID']) {
            $routines[$routineId]['Exercises'][] = [
                'Exercise_ID' => $row['Exercise_ID'],
                'Set_Count' => $row['Set_Count']
            ];
        }
    }

    // Log the fetched routines and exercises
    error_log("Fetched routines: " . json_encode($routines));

    echo json_encode(array_values($routines));
} catch (PDOException $e) {
    // Log the error message
    error_log("Database error: " . $e->getMessage());
    echo json_encode(['error' => $e->getMessage()]);
}
?>