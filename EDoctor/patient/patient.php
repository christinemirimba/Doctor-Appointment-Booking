<?php
session_start();
include '../connection.php';

// Check if the user is authenticated and is a patient
if (!isset($_SESSION['authenticated']) || $_SESSION['usertype'] !== 'p') {
    header('Location: ../login.php');
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="patient.css">
    <style>
        .landing {
            background-image: url('../images/home.png');
            background-size: contain; /* Ensures the entire image fits within the container */
            background-repeat: no-repeat; /* Prevents the image from repeating */
            background-position: center; /* Centers the image within the container */
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .landing-content {
            text-align: center;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            position: absolute;
            top: 10%;
            transform: translate(-50%, -50%);
            left: 60%;
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div class="date">
                <?php echo date("F j, Y"); ?>
            </div>
            <div class="profile-container">
                <img src="../images/user.png" alt="User" class="user-icon">
                <p class="profile-email"><?php echo $_SESSION['email']; ?></p>
                <a href="logout.php" class="logout-btn">Logout</a>
            </div>
            <nav>
                <ul>
                    <li><a href="patient.php">Home</a></li>
                    <li><a href="mybookings.php">My Bookings</a></li>
                    <li><a href="appointment.php">Make Appointment</a></li>
                    <li><a href="settings.php">Settings</a></li>
                    <li><a href="notifications.php">Notifications</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="container landing">
    <div class="landing-content">
            <h1>Welcome to CUEA Infirmary</h1>
        </div>
    </div>
</body>
</html>
