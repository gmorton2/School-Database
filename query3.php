<!DOCTYPE html>
<html>
<body>
    Your Course ID is: <?php echo $_POST['ssn']; ?>
    <br><br>
<?php
$SSN = $_POST["ssn"];
$hostName = "localhost";
$userName = "cs332s29";
$password = "phaeg5Ku";
$dbName = $userName;

$conn = new mysqli($hostName, $userName, $password, $dbName);

if($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$query3 = "select c.course_section_number, c.classroom,meeting_days, c.beginning_time,c.ending_time, count(e.student_cwid)
from Course_Sections c
join enrollment_record e
on e.course_section_number = c.course_section_number and c.course_id='$SSN'
group by e.course_section_number;";
$result = $conn->query($query3);

if($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "COurse Section Number: " . $row["course_section_number"] . " | ";
        echo "\t";
        echo "Classroom: " . $row["classroom"] . " | ";
        echo "\t";
        echo "Meeting Days: " . $row["meeting_days"] . " | ";
        echo "\t";
        echo "Class Time: " . $row["beginning_time"] . ' - ' . $row["ending_time"] . " | ";
        echo "\t";
        echo "Number Of Students: " . $row["count(e.student_cwid)"] . " | ";
        echo "<br>";
    }
}
else {
    echo "0 results";
}

$conn->close();
?>
</body>
</html>

