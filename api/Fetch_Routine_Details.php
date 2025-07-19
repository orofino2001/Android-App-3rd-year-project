<?php
header('Content-Type: application/json');

ini_set('log_errors', 1);
ini_set('error_log', __DIR__ . '/error_log');

// Log incoming request parameters
error_log("Incoming request: " . json_encode($_GET));

// Database connection
$host = getenv('DB_HOST') ?: "165.227.235.122";
$db = getenv('DB_NAME') ?: "ado19_GymApp";
$user = getenv('DB_USER') ?: "ado19_gym";
$pass = getenv('DB_PASS') ?: "Rachel-1971";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Get Routine_ID from the request
    $routineId = isset($_GET['routine_id']) ? intval($_GET['routine_id']) : -1;

    // Log the Routine_ID being processed
    error_log("Routine_ID: " . $routineId);

    if ($routineId <= 0) {
        echo json_encode(['success' => false, 'error' => 'Invalid Routine_ID']);
        exit;
    }

    // Query to fetch exercises with additional details for the given Routine_ID
    $stmt = $pdo->prepare("
        SELECT 
            re.Routine_Exercise_ID, 
            re.Routine_ID, 
            re.Exercise_ID, 
            re.Set_Count,
            e.Exercise_Name,
            e.Description,
            re.Rest_Timer
        FROM Routine_Exercises re
        INNER JOIN Exercise e ON re.Exercise_ID = e.Exercise_ID
        WHERE re.Routine_ID = :Routine_ID
    ");
    $stmt->bindParam(':Routine_ID', $routineId, PDO::PARAM_INT);
    $stmt->execute();

    $exercises = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (empty($exercises)) {
        echo json_encode(['success' => false, 'error' => 'No exercises found for this routine']);
        exit;
    }

    echo json_encode(['success' => true, 'data' => $exercises]);
} catch (PDOException $e) {
    error_log("Database error: " . $e->getMessage());
    echo json_encode(['success' => false, 'error' => 'A server error occurred.']);
}
?>