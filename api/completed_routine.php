<?php
header("Content-Type: application/json");

// Enable error logging dynamically
ini_set("log_errors", 1);
ini_set("error_log", __DIR__ . "/error.log");

// Database credentials (use environment variables in production)
$host = getenv('DB_HOST') ?: "165.227.235.122";
$username = getenv('DB_USER') ?: "ado19_gym";
$password = getenv('DB_PASS') ?: "Rachel-1971";
$dbname = getenv('DB_NAME') ?: "ado19_GymApp";

// Test error logging
error_log("Script started");

// Decode incoming JSON data
$data = json_decode(file_get_contents("php://input"), true);

if ($data) {
    $userId = $data['User_ID'] ?? null;
    $routineId = $data['Routine_ID'] ?? null;
    $sessionDate = $data['Session_date'] ?? null;
    $duration = $data['Duration'] ?? null;
    $exerciseHistory = $data['Exercise_History'] ?? [];

    // Validate required fields
    if (!$userId || !$routineId || !$sessionDate || !$duration || !is_array($exerciseHistory)) {
        error_log("Invalid or missing input data: " . json_encode($data));
        echo json_encode(["status" => "error", "message" => "Invalid or missing input data"]);
        exit;
    }

    // Connect to the database
    $conn = new mysqli($host, $username, $password, $dbname);

    if ($conn->connect_error) {
        error_log("Database connection failed: " . $conn->connect_error);
        echo json_encode(["status" => "error", "message" => "Database connection failed"]);
        exit;
    }

    // Start transaction
    $conn->begin_transaction();

    try {
        // Insert into Session table
        $stmt = $conn->prepare("INSERT INTO Session (User_ID, Routine_ID, Session_date, Duration) VALUES (?, ?, ?, ?)");
        if (!$stmt) {
            throw new Exception("Failed to prepare Session query: " . $conn->error);
        }

        $stmt->bind_param("iisi", $userId, $routineId, $sessionDate, $duration);
        if (!$stmt->execute()) {
            throw new Exception("Failed to save Session: " . $stmt->error);
        }

        $sessionId = $stmt->insert_id;

        // Insert into Exercise_History table
        $stmt = $conn->prepare("INSERT INTO Exercise_History (Routine_Exercise_ID, Date, Weight, Reps, Set_Number, User_ID) VALUES (?, ?, ?, ?, ?, ?)");
        if (!$stmt) {
            throw new Exception("Failed to prepare Exercise_History query: " . $conn->error);
        }

        error_log("Exercise History Data: " . json_encode($exerciseHistory));
        foreach ($exerciseHistory as $history) {
            $routineExerciseId = $history['Routine_Exercise_ID'] ?? null;
            $date = $history['Date'] ?? null;
            $weight = $history['Weight'] ?? null;
            $reps = $history['Reps'] ?? null;
            $setNumber = $history['Set_Number'] ?? null;

            // Validate and log invalid data
            if (!$routineExerciseId || !$date || !$weight || !$reps || !$setNumber) {
                error_log("Invalid exercise history data: " . json_encode($history));
                continue;
            }

            // Ensure date format is correct
            $date = date('Y-m-d', strtotime($date));
            if (!$date) {
                error_log("Invalid date format: " . $history['Date']);
                continue;
            }

            $stmt->bind_param("isiiii", $routineExerciseId, $date, $weight, $reps, $setNumber, $userId);
            if (!$stmt->execute()) {
                error_log("Failed to insert Exercise_History: " . $stmt->error);
                error_log("Routine_Exercise_ID: $routineExerciseId, Date: $date, Weight: $weight, Reps: $reps, Set_Number: $setNumber, User_ID: $userId");
            } else {
                error_log("Successfully inserted Exercise_History entry: " . json_encode($history));
            }
        }

        // Commit transaction
        $conn->commit();
        echo json_encode(["status" => "success", "message" => "Data saved successfully"]);
    } catch (Exception $e) {
        // Rollback transaction on error
        $conn->rollback();
        error_log("Transaction failed: " . $e->getMessage());
        echo json_encode(["status" => "error", "message" => "An error occurred while saving data"]);
    } finally {
        $stmt->close();
        $conn->close();
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid input"]);
}
?>