-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 09, 2025 at 10:10 AM
-- Server version: 8.0.42
-- PHP Version: 8.3.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ado19_GymApp`
--

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `Category_ID` int NOT NULL,
  `Category_Name` varchar(225) NOT NULL,
  `Description` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`Category_ID`, `Category_Name`, `Description`) VALUES
(1, 'Chest', 'Muscles involved in pressing movements, including the pectoralis major and minor.'),
(2, 'Back', 'Muscles responsible for pulling movements, including the latissimus dorsi, traps, and rhomboids.'),
(3, 'Shoulders', 'Deltoid muscles responsible for overhead pressing and lateral movements.'),
(4, 'Biceps', 'Front upper arm muscles involved in curling movements.'),
(5, 'Triceps', 'Back upper arm muscles responsible for extending the elbow joint.'),
(6, 'Legs', 'Includes quadriceps, hamstrings, glutes, and calves, responsible for lower body movement.'),
(7, 'Core', 'Abdominal muscles including rectus abdominis, obliques, and transverse abdominis.'),
(9, 'neck', 'neck muscles upper trapezius and the SCM');

-- --------------------------------------------------------

--
-- Table structure for table `Exercise`
--

CREATE TABLE `Exercise` (
  `Exercise_ID` int NOT NULL,
  `Exercise_Name` varchar(225) NOT NULL,
  `Category_ID` int NOT NULL,
  `Description` text,
  `Difficulty_Level` varchar(225) DEFAULT NULL,
  `Diagram` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Exercise`
--

INSERT INTO `Exercise` (`Exercise_ID`, `Exercise_Name`, `Category_ID`, `Description`, `Difficulty_Level`, `Diagram`) VALUES
(1, 'Barbell curl', 4, 'The barbell curl is a biceps exercise where you lift a barbell from a straight-arm position to your shoulders while keeping your elbows close to your body. It helps build arm strength and muscle definition.', 'Beginner', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/Barbellcurl.gif'),
(2, 'Overhead Cable Triceps extension', 5, 'This exercise targets the triceps by extending the arms overhead using a cable machine. Stand facing away from the machine, grip the handle with both hands, and extend your arms fully before slowly lowering back.\r\n\r\n', 'Intermediate', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/CableOverheadTricepExtension.gif'),
(3, 'Lever Chest Press', 1, 'This machine-based exercise mimics a bench press by pressing weighted levers forward to target the chest, shoulders, and triceps. Sit with your back against the pad, grip the handles, and push forward until your arms are extended, then return slowly.', 'Beginner', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/ChestPress.gif'),
(4, 'Dumbell Shoulder raise', 3, 'This exercise targets the shoulder muscles by lifting dumbbells to the front or sides while keeping the arms straight. Stand tall, hold a dumbbell in each hand, and raise them to shoulder height before lowering slowly make sure to start with minimum weight.', 'Intermediate', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/DumbellShoulderRaise.gif'),
(5, 'dumbell bicep curl', 4, 'A classic biceps exercise where you lift dumbbells from a straight-arm position to your shoulders while keeping your elbows close to your body. Slowly lower the weights back down to complete the movement, there is also variations of this like seated bicep curls.', 'beginner', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/Dumbellbicepcurl.gif'),
(6, 'full squat ', 6, 'A lower-body exercise where you squat down until your hips are below your knees, then stand back up. It targets the legs, glutes, and core while improving mobility and strength.', 'Advanced', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/FullSquat.gif'),
(7, 'Hammer Curl', 4, 'A biceps and forearm exercise where you lift dumbbells with a neutral grip (palms facing inward) from a straight-arm position to your shoulders. Lower the weights slowly to complete the movement.', 'Beginner', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/HammerCurl.gif'),
(8, 'Incline Barbell Bench-press', 1, 'This exercise targets the upper chest and shoulders by pressing a barbell upward while lying on an inclined bench. Lower the barbell to your upper chest and press it back up.', 'Intermediate', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/InclineBarbellBenchpress.gif'),
(9, 'Incline Dumbbell Bench-press', 1, 'This exercise targets the upper chest and shoulders by pressing dumbbells upward while lying on an inclined bench. Lower the dumbbells to chest level and then press them back up.', 'Intermediate', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/InclineDumbellBenchpress.gif'),
(10, 'Incline Smith Machine Bench Press', 1, 'This exercise targets the upper chest and shoulders by pressing a barbell on an inclined bench using the Smith machine. The machine guides the barbell along a fixed path, allowing for a controlled movement.', 'Beginner ', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/InclineSmithmachineBenchpress.gif'),
(11, 'Lat pull-down', 2, 'This exercise targets the back muscles, specifically the latissimus dorsi, by pulling a weighted bar down towards your chest while seated. Keep your torso upright and pull the bar smoothly, then slowly return it to the starting position', 'Beginner', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/LatPulldown.gif'),
(12, 'Lying Leg Curl', 6, 'This exercise targets the hamstrings by lying face down on a machine and curling a weighted pad towards your glutes by bending your knees. Slowly return to the starting position.', 'beginner', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/LayingLegcurl.gif'),
(17, 'Preacher Curl', 4, 'This exercise isolates the biceps by curling a barbell or dumbbells while seated on a preacher bench, which supports the arms and minimizes swinging. Lower the weights slowly and then curl them up to full contraction.', 'Intermediate', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/PreacherCurl.gif'),
(18, 'Romanian Deadlift', 6, 'This exercise targets the hamstrings, glutes, and lower back. Stand with a barbell in front of you, hinge at the hips while keeping your back straight, lower the barbell along your legs, then return to the standing position.', 'Advanced', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/RomanianDeadlift.gif'),
(19, 'Seated Dumbbell Shoulder Press', 3, ' This exercise targets the shoulders, particularly the deltoids. While seated, hold a dumbbell in each hand at shoulder height, then press the dumbbells upward until your arms are fully extended. Lower the weights back down to shoulder height and repeat.', 'Intermediate', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/SeatedDumbellShoulderPress.gif'),
(20, 'Seated Leg Curl', 6, 'This exercise targets the hamstrings by sitting on a machine with your legs extended and placing your feet under the padded lever. Curl the lever towards your glutes by bending your knees, then slowly return to the starting position.', 'Beginner', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/SeatedLegcurl.gif'),
(21, 'Seated lever row', 2, 'A seated lever row is a back exercise using a machine. You sit with your feet on footrests, grasp handles, and pull them towards your torso, engaging the back muscles. It targets the lats, rhomboids, and traps.', 'beginner', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/SeatedLeverRow.gif'),
(23, 'Seated Row', 2, 'The seated row is a back exercise performed on a machine where you pull a set of handles towards your torso. It targets the lats, traps, and rhomboids', 'Intermediate', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/SeatedRow.gif'),
(25, 'Tricep Pushdown', 5, 'The tricep pushdown is an exercise performed on a cable machine, where you push a rope or bar attachment downward, extending your arms fully while keeping your elbows stationary. It primarily targets the triceps.', 'Beginner', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/TricepPushdown.gif'),
(27, 'hip Thrusts', 6, 'Hip thrusts are a lower-body exercise where you sit on the ground with your upper back against a bench, placing a barbell or weight plate over your hips. You then drive through your heels, thrusting your hips upward while squeezing your glutes at the top.', 'Intermediate', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/hipTrusts.gif'),
(30, 'Neck flexion', 9, 'Neck flexion is the movement where the head tilts forward, bringing the chin toward the chest. This action is primarily driven by the sternocleidomastoid and scalene muscles, along with other neck muscles, and is important for actions like nodding or looking down add weight slowly.', 'Intermediate', 'https://github.com/orofino2001/gymapp_DB/blob/main/neck%20flextion.mp4'),
(31, 'Weighted pull ups', 2, 'A weighted pull-up is a variation of the classic pull-up where extra weight is added to the body to increase the intensity and challenge of the exercise', 'Intermediate', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/WeightedPullUps.gif'),
(33, 'Pull Up', 2, 'A pull-up is an upper-body strength training exercise where you hang from a bar and pull yourself up until your chin is above the bar, then lower yourself back down', 'beginner', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/pullUp.gif'),
(35, 'Bench Press', 1, 'The bench press is a weight training exercise where a person presses a weight upwards while lying horizontally on a weight training bench', 'beginner', 'https://raw.githubusercontent.com/orofino2001/gymapp_DB/refs/heads/main/benchPress.gif');

-- --------------------------------------------------------

--
-- Table structure for table `Exercise_History`
--

CREATE TABLE `Exercise_History` (
  `History_ID` int NOT NULL,
  `Routine_Exercise_ID` int NOT NULL,
  `Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Weight` double DEFAULT NULL,
  `Reps` int DEFAULT NULL,
  `Set_Number` int DEFAULT NULL,
  `User_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Exercise_History`
--

INSERT INTO `Exercise_History` (`History_ID`, `Routine_Exercise_ID`, `Date`, `Weight`, `Reps`, `Set_Number`, `User_ID`) VALUES
(3, 37, '2025-05-09 00:00:00', 50, 10, 1, 11),
(4, 37, '2025-05-09 00:00:00', 50, 10, 2, 11),
(5, 38, '2025-05-09 00:00:00', 50, 10, 1, 11),
(6, 38, '2025-05-09 00:00:00', 50, 10, 2, 11),
(7, 38, '2025-05-09 00:00:00', 50, 10, 3, 11);

-- --------------------------------------------------------

--
-- Table structure for table `Routine`
--

CREATE TABLE `Routine` (
  `Routine_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  `Routine_Name` varchar(225) NOT NULL,
  `Routine_Description` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Routine`
--

INSERT INTO `Routine` (`Routine_ID`, `User_ID`, `Routine_Name`, `Routine_Description`) VALUES
(1, 1, 'Full Body Strength', NULL),
(2, 2, 'Weight Loss Blast', NULL),
(3, 3, 'Muscle Building Split', NULL),
(4, 4, 'Endurance Run', NULL),
(5, 5, 'Powerlifting Program', NULL),
(6, 6, ' upper body', NULL),
(7, 6, ' upper body', NULL),
(66, 11, 'test', 'test'),
(67, 11, 'legday', 'legday');

-- --------------------------------------------------------

--
-- Table structure for table `Routine_Exercises`
--

CREATE TABLE `Routine_Exercises` (
  `Routine_Exercise_ID` int NOT NULL,
  `Routine_ID` int NOT NULL,
  `Exercise_ID` int NOT NULL,
  `Set_Count` int NOT NULL,
  `Rest_Timer` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Routine_Exercises`
--

INSERT INTO `Routine_Exercises` (`Routine_Exercise_ID`, `Routine_ID`, `Exercise_ID`, `Set_Count`, `Rest_Timer`) VALUES
(37, 66, 1, 2, 0),
(38, 66, 2, 3, 0),
(39, 67, 6, 3, 0),
(40, 67, 12, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Session`
--

CREATE TABLE `Session` (
  `Session_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  `Routine_ID` int NOT NULL,
  `Session_date` datetime NOT NULL,
  `Duration` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Session`
--

INSERT INTO `Session` (`Session_ID`, `User_ID`, `Routine_ID`, `Session_date`, `Duration`) VALUES
(29, 11, 66, '2025-05-09 00:00:00', 7);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `User_ID` int NOT NULL,
  `Username` varchar(225) NOT NULL,
  `Email` varchar(225) NOT NULL,
  `Password_hash` binary(60) NOT NULL,
  `Sex` enum('Male','Female','Other') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Age` tinyint UNSIGNED DEFAULT NULL,
  `Join_date` datetime DEFAULT NULL,
  `Last_Login` datetime DEFAULT NULL,
  `Rest_Timer` int DEFAULT '0',
  `Theme` tinyint(1) DEFAULT '0',
  `Kg_Or_Lbs` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`User_ID`, `Username`, `Email`, `Password_hash`, `Sex`, `Age`, `Join_date`, `Last_Login`, `Rest_Timer`, `Theme`, `Kg_Or_Lbs`) VALUES
(1, 'johndoe', 'johndoe@example.com', 0x6368616e67656c6174657200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'Male', 28, '2023-01-15 00:00:00', '2024-02-24 14:30:00', 0, 0, 1),
(2, 'janedoe', 'janedoe@example.com', 0x6368616e67656c6174657200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'Female', 25, '2023-02-20 00:00:00', '2024-02-23 10:45:00', 0, 0, 1),
(3, 'gymbro', 'gymbro@example.com', 0x6368616e67656c6174657200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'Male', 30, '2022-11-10 00:00:00', '2024-02-22 18:15:00', 0, 0, 1),
(4, 'fitgirl', 'fitgirl@example.com', 0x6368616e67656c6174657200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'Female', 27, '2023-06-05 00:00:00', '2024-02-24 08:55:00', 0, 0, 1),
(5, 'powerlifter', 'powerlifter@example.com', 0x6368616e67656c6174657200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'Male', 35, '2021-09-30 00:00:00', '2024-02-20 21:10:00', 0, 0, 1),
(6, 'bjjguy', 'bjjguy@email.com', 0x2cbdfd547a2fc9b300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 'Male', 23, '2025-03-01 21:05:23', '2025-02-12 21:05:21', 0, 0, 1),
(11, 'test', 'Test@test.com', 0x243279243130244f52446a702e5267795a354a627162635338376264655950515a7443446f2f44477652434a4d52394955375433575774435830642e, NULL, NULL, '2025-03-24 14:46:09', NULL, 360, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `User_Custom_Exercises`
--

CREATE TABLE `User_Custom_Exercises` (
  `User_ID` int NOT NULL,
  `Exercise_ID` int NOT NULL,
  `Category_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `User_Custom_Exercises`
--

INSERT INTO `User_Custom_Exercises` (`User_ID`, `Exercise_ID`, `Category_ID`) VALUES
(6, 30, 9);

-- --------------------------------------------------------

--
-- Table structure for table `User_Measurement`
--

CREATE TABLE `User_Measurement` (
  `measurement_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  `Height` float DEFAULT NULL,
  `Body_Weight` smallint DEFAULT NULL,
  `Neck` tinyint DEFAULT NULL,
  `Waist` tinyint DEFAULT NULL,
  `Shoulders` tinyint DEFAULT NULL,
  `Chest` tinyint DEFAULT NULL,
  `Left_Bicep` tinyint DEFAULT NULL,
  `Right_Bicep` tinyint DEFAULT NULL,
  `Left_Forearm` tinyint DEFAULT NULL,
  `Right_Forearm` tinyint DEFAULT NULL,
  `Abdomen` tinyint DEFAULT NULL,
  `Hips` tinyint DEFAULT NULL,
  `Left_Thigh` tinyint DEFAULT NULL,
  `Right_Thigh` tinyint DEFAULT NULL,
  `Left_Calf` tinyint DEFAULT NULL,
  `Right_Calf` tinyint DEFAULT NULL,
  `Fitness_Level` varchar(50) DEFAULT NULL,
  `Join_date` datetime NOT NULL,
  `Last_Login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `User_Measurement`
--

INSERT INTO `User_Measurement` (`measurement_ID`, `User_ID`, `Height`, `Body_Weight`, `Neck`, `Waist`, `Shoulders`, `Chest`, `Left_Bicep`, `Right_Bicep`, `Left_Forearm`, `Right_Forearm`, `Abdomen`, `Hips`, `Left_Thigh`, `Right_Thigh`, `Left_Calf`, `Right_Calf`, `Fitness_Level`, `Join_date`, `Last_Login`) VALUES
(1, 1, 177.8, 82, 15, 32, 18, 40, 14, 15, 12, 13, 34, 38, 24, 25, 14, 15, 'Intermediate', '2023-01-15 00:00:00', '2024-02-24 14:30:00'),
(2, 2, 167.64, 64, 13, 28, 16, 36, 12, 12, 10, 10, 30, 36, 22, 23, 13, 13, 'Beginner', '2023-02-20 00:00:00', '2024-02-23 10:45:00'),
(3, 3, 180.34, 91, 16, 34, 19, 44, 15, 15, 13, 13, 36, 40, 25, 25, 15, 15, 'Advanced', '2022-11-10 00:00:00', '2024-02-22 18:15:00'),
(4, 4, 165.1, 57, 12, 26, 15, 34, 11, 11, 9, 9, 28, 34, 21, 21, 12, 12, 'Intermediate', '2023-06-05 00:00:00', '2024-02-24 08:55:00'),
(5, 5, 182.88, 113, 17, 38, 20, 46, 16, 16, 14, 14, 38, 42, 26, 26, 16, 16, 'Advanced', '2021-09-30 00:00:00', '2024-02-20 21:10:00'),
(6, 6, 175.26, 73, 14, 30, 17, 42, 13, 13, 11, 11, 32, 37, 23, 23, 14, 14, 'Intermediate', '2025-03-01 21:05:23', '2025-02-12 21:05:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Indexes for table `Exercise`
--
ALTER TABLE `Exercise`
  ADD PRIMARY KEY (`Exercise_ID`),
  ADD KEY `Category_ID` (`Category_ID`);

--
-- Indexes for table `Exercise_History`
--
ALTER TABLE `Exercise_History`
  ADD PRIMARY KEY (`History_ID`),
  ADD KEY `Routine_Exercise_ID` (`Routine_Exercise_ID`),
  ADD KEY `fk_user_id` (`User_ID`);

--
-- Indexes for table `Routine`
--
ALTER TABLE `Routine`
  ADD PRIMARY KEY (`Routine_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `Routine_Exercises`
--
ALTER TABLE `Routine_Exercises`
  ADD PRIMARY KEY (`Routine_Exercise_ID`),
  ADD KEY `fk_routine` (`Routine_ID`),
  ADD KEY `fk_exercise` (`Exercise_ID`);

--
-- Indexes for table `Session`
--
ALTER TABLE `Session`
  ADD PRIMARY KEY (`Session_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Routine_ID` (`Routine_ID`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `User_Custom_Exercises`
--
ALTER TABLE `User_Custom_Exercises`
  ADD PRIMARY KEY (`User_ID`,`Exercise_ID`),
  ADD KEY `Exercise_ID` (`Exercise_ID`),
  ADD KEY `fk_category` (`Category_ID`);

--
-- Indexes for table `User_Measurement`
--
ALTER TABLE `User_Measurement`
  ADD PRIMARY KEY (`measurement_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
  MODIFY `Category_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Exercise`
--
ALTER TABLE `Exercise`
  MODIFY `Exercise_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `Exercise_History`
--
ALTER TABLE `Exercise_History`
  MODIFY `History_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Routine`
--
ALTER TABLE `Routine`
  MODIFY `Routine_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `Routine_Exercises`
--
ALTER TABLE `Routine_Exercises`
  MODIFY `Routine_Exercise_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `Session`
--
ALTER TABLE `Session`
  MODIFY `Session_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `User_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `User_Measurement`
--
ALTER TABLE `User_Measurement`
  MODIFY `measurement_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Exercise`
--
ALTER TABLE `Exercise`
  ADD CONSTRAINT `Exercise_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `Category` (`Category_ID`);

--
-- Constraints for table `Exercise_History`
--
ALTER TABLE `Exercise_History`
  ADD CONSTRAINT `Exercise_History_ibfk_1` FOREIGN KEY (`Routine_Exercise_ID`) REFERENCES `Routine_Exercises` (`Routine_Exercise_ID`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`User_ID`) REFERENCES `User` (`User_ID`);

--
-- Constraints for table `Routine`
--
ALTER TABLE `Routine`
  ADD CONSTRAINT `Routine_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `User` (`User_ID`);

--
-- Constraints for table `Routine_Exercises`
--
ALTER TABLE `Routine_Exercises`
  ADD CONSTRAINT `fk_exercise` FOREIGN KEY (`Exercise_ID`) REFERENCES `Exercise` (`Exercise_ID`),
  ADD CONSTRAINT `fk_routine` FOREIGN KEY (`Routine_ID`) REFERENCES `Routine` (`Routine_ID`);

--
-- Constraints for table `Session`
--
ALTER TABLE `Session`
  ADD CONSTRAINT `Session_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `User` (`User_ID`),
  ADD CONSTRAINT `Session_ibfk_2` FOREIGN KEY (`Routine_ID`) REFERENCES `Routine` (`Routine_ID`);

--
-- Constraints for table `User_Custom_Exercises`
--
ALTER TABLE `User_Custom_Exercises`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`Category_ID`) REFERENCES `Category` (`Category_ID`),
  ADD CONSTRAINT `User_Custom_Exercises_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `User` (`User_ID`),
  ADD CONSTRAINT `User_Custom_Exercises_ibfk_2` FOREIGN KEY (`Exercise_ID`) REFERENCES `Exercise` (`Exercise_ID`);

--
-- Constraints for table `User_Measurement`
--
ALTER TABLE `User_Measurement`
  ADD CONSTRAINT `User_Measurement_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `User` (`User_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
