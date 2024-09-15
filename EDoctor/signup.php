<?php
session_start();
include 'connection.php'; // This includes the connection file where $database is defined

$_SESSION["user"] = "";
$_SESSION["usertype"] = "";

// Set the new timezone
date_default_timezone_set('Africa/Nairobi');
$date = date('Y-m-d');
$_SESSION["date"] = $date;

if ($_POST) {
    // Retrieve form data from POST request
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $dob = $_POST['dob'];
    $email = $_POST['email'];
    $mobile_number = $_POST['mobile_number'];
    $admission_number = $_POST['admission_number'];
    $password = $_POST['password']; // No hashing here

    // Prepare the SQL statement to insert data into the database
    $sql = "INSERT INTO patients (first_name, last_name, dob, email, password, mobile_number, admission_number) 
            VALUES ('$first_name', '$last_name', '$dob', '$email', '$password', '$mobile_number', '$admission_number')";

    // Execute the query and check for success
    if ($database->query($sql) === TRUE) { // Use $database for the connection
        // Redirect to a login page or another page if the insertion is successful
        header("location: login.php");
        exit();
    } else {
        // Display an error message if something goes wrong
        echo "Error: " . $sql . "<br>" . $database->error;
    }

    $database->close(); // Close the connection
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Signup</title>
    <link rel="stylesheet" href="signup.css">
</head>
<body>
    <div class="container">
        <h2>Signup</h2>
        <form action="signup.php" method="POST">
            <label for="first_name">First Name</label>
            <input type="text" id="first_name" name="first_name" required>
            
            <label for="last_name">Last Name</label>
            <input type="text" id="last_name" name="last_name" required>
            
            <label for="dob">Date of Birth</label>
            <input type="date" id="dob" name="dob" required>
            
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
            
            <label for="mobile_number">Mobile Number</label>
            <input type="text" id="mobile_number" name="mobile_number" required>
            
            <label for="admission_number">Admission Number</label>
            <input type="text" id="admission_number" name="admission_number" required>
            
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
            
            <label for="confirm_password">Confirm Password</label>
            <input type="password" id="confirm_password" name="confirm_password" required>
            
            <button type="submit" name="submit">Sign Up</button>
            <button type="reset">Reset</button>
            <p>Already have an account? <a href="login.php">Login</a></p>
        </form>
    </div>
</body>
</html>
