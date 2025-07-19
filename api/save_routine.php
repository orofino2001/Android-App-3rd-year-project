<?php
// Enable error logging to a file
ini_set("log_errors", 1);
ini_set("error_log", __DIR__ . "/save_error_log");

// Database connection
$host = "165.227.235.122";
$username = "ado19_gym";
$password = "Rachel-1971";
$dbname = "ado19_GymApp";

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    error_log("[DEBUG] Database connection established successfully.");
} catch (PDOException $e) {
    error_log("[ERROR] Database connection failed: " . $e->getMessage());
    echo json_encode(["status" => "error", "message" => "An error occurred. Please try again later."]);
    exit;
}

// Get JSON input
$data = json_decode(file_get_contents("php://input"), true);
error_log("[DEBUG] Received input: " . json_encode($data));

// Validate input
if (isset($data["user_ID"], $data["routine_Name"], $data["routine_Description"], $data["exercises"]) && is_array($data["exercises"])) {
    $userId = $data["user_ID"];
    $routineName = $data["routine_Name"];
    $routineDescription = $data["routine_Description"];
    $exercises = $data["exercises"];

    if (!is_numeric($userId) || empty($routineName) || empty($routineDescription)) {
        error_log("[ERROR] Invalid input data: User ID, Routine Name, or Routine Description is invalid.");
        echo json_encode(["status" => "error", "message" => "Invalid input data."]);
        exit;
    }

    error_log("[DEBUG] Input validated. User ID: $userId, Routine Name: $routineName, Routine Description: $routineDescription, Exercises: " . json_encode($exercises));

    try {
        // Start a transaction
        $conn->beginTransaction();

        // Insert into the Routine table
        $stmt = $conn->prepare("INSERT INTO Routine (User_ID, Routine_Name, Routine_Description) VALUES (:User_ID, :Routine_Name, :Routine_Description)");
        $stmt->bindParam(":User_ID", $userId, PDO::PARAM_INT);
        $stmt->bindParam(":Routine_Name", $routineName, PDO::PARAM_STR);
        $stmt->bindParam(":Routine_Description", $routineDescription, PDO::PARAM_STR);

        if ($stmt->execute()) {
            $lastInsertId = $conn->lastInsertId();
            error_log("[DEBUG] Routine saved successfully. Routine ID: $lastInsertId");

            // Insert exercises into the Routine_Exercises table
            $exerciseStmt = $conn->prepare("INSERT INTO Routine_Exercises (Routine_ID, Exercise_ID, Set_Count, Rest_Timer) VALUES (:Routine_ID, :Exercise_ID, :Set_Count, :Rest_Timer)");

            foreach ($exercises as $exercise) {
                if (isset($exercise["exercise_ID"], $exercise["set_count"]) && is_numeric($exercise["exercise_ID"]) && is_numeric($exercise["set_count"])) {
                    $restTimer = isset($exercise["rest_timer"]) ? ($exercise["rest_timer"] ? 1 : 0) : 0; // Default to 0 if not provided
                    $exerciseStmt->bindValue(":Routine_ID", $lastInsertId, PDO::PARAM_INT);
                    $exerciseStmt->bindValue(":Exercise_ID", $exercise["exercise_ID"], PDO::PARAM_INT);
                    $exerciseStmt->bindValue(":Set_Count", $exercise["set_count"], PDO::PARAM_INT);
                    $exerciseStmt->bindValue(":Rest_Timer", $restTimer, PDO::PARAM_BOOL);

                    if ($exerciseStmt->execute()) {
                        error_log("[DEBUG] Exercise added to routine. Exercise ID: " . $exercise["exercise_ID"]);
                    } else {
                        error_log("[ERROR] Failed to add exercise to routine. Exercise_ID: " . $exercise["exercise_ID"]);
                        throw new Exception("Failed to add exercise to routine.");
                    }
                } else {
                    error_log("[ERROR] Invalid exercise data: " . json_encode($exercise));
                    throw new Exception("Invalid exercise data.");
                }
            }

            // Commit the transaction
            $conn->commit();
            echo json_encode(["status" => "success", "Routine_ID" => $lastInsertId]);
        } else {
            error_log("[ERROR] Failed to save routine.");
            echo json_encode(["status" => "error", "message" => "Failed to save routine."]);
        }
    } catch (Exception $e) {
        // Rollback the transaction on error
        $conn->rollBack();
        error_log("[ERROR] Transaction failed: " . $e->getMessage());
        echo json_encode(["status" => "error", "message" => "An error occurred. Please try again later."]);
    }
} else {
    error_log("[ERROR] Invalid input: " . json_encode($data));
    echo json_encode(["status" => "error", "message" => "Invalid input. Required fields are missing or malformed."]);
}
?>