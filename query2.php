<!DOCTYPE html>
<html>
<body>
Your Course ID  is: <?php echo $_POST['cnum']; ?>
    <br><br>
<?php

$CSN = $_POST["snum"];
$CID = $_POST["cnum"];
$hostName = "localhost";
$userName = "cs332s29";
$password = "phaeg5Ku";
$dbName = $userName;

$conn = new mysqli($hostName, $userName, $password, $dbName);

if($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "select E.grade, COUNT(grade) as grades FROM enrollment_record E WHERE E.course_section_number = $CSN AND E.course_id = '$CID' GROUP BY grade;";
$result = $conn->query($sql);

if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "Grade Value: " . $row["grade"] . " | ";
        echo "\t";
        echo "Number Of Students with Distinct Grade: " . $row["grades"] . " | ";
        echo "\t";
        echo "<br>";
    }
}
else {
    echo "0 results";
}
$conn->close();

