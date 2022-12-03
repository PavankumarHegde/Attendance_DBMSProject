<?php
include '../Includes/dbcon.php';
$admissionNumber =  $_POST['admissionNumber'];
$admitno=$admissionNumber;
if(isset($_GET['admitno'])){
	$admitno=$_GET['admitno'];
}

echo "<h1>$admitno</h1>";
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    
	<style> .center-block { display: block;margin-left: auto;margin-right: auto; }</style>
</head>
<body>
<div class="container">
    <center>
        <div id="container"></div>
    </center>
    
<?php

//include "config.php"; // connection file with database

/**
$q="SELECT tblattendance.Id,tblattendance.status,tblattendance.dateTimeTaken,tblclass.className,
                        tblclassarms.classArmName,tblsessionterm.sessionName,tblsessionterm.termId,tblterm.termName,
                        tblstudents.firstName,tblstudents.lastName,tblstudents.otherName,tblstudents.admissionNumber
                        FROM tblattendance
                        INNER JOIN tblclass ON tblclass.Id = tblattendance.classId
                        INNER JOIN tblclassarms ON tblclassarms.Id = tblattendance.classArmId
                        INNER JOIN tblsessionterm ON tblsessionterm.Id = tblattendance.sessionTermId
                        INNER JOIN tblterm ON tblterm.Id = tblsessionterm.termId
                        INNER JOIN tblstudents ON tblstudents.admissionNumber = tblattendance.admissionNo
                        where tblattendance.admissionNo = '$admissionNumber' and tblattendance.classId = '$_SESSION[classId]' and tblattendance.classArmId = '$_SESSION[classArmId]'";
**/
//$query="SELECT tblattendance.Id,tblattendance.status,tblattendance.dateTimeTaken,tblclass.className, tblclassarms.classArmName,tblsessionterm.sessionName,tblsessionterm.termId,tblterm.termName, tblstudents.firstName,tblstudents.lastName,tblstudents.otherName,tblstudents.admissionNumber FROM tblattendance INNER JOIN tblclass ON tblclass.Id = tblattendance.classId INNER JOIN tblclassarms ON tblclassarms.Id = tblattendance.classArmId INNER JOIN tblsessionterm ON tblsessionterm.Id = tblattendance.sessionTermId INNER JOIN tblterm ON tblterm.Id = tblsessionterm.termId INNER JOIN tblstudents ON tblstudents.admissionNumber = tblattendance.admissionNo where tblattendance.admissionNo = 'PES1UG20CS823'";

$query="SELECT firstName, status, COUNT(*) AS Attendance FROM tblattendance INNER JOIN tblclass ON tblclass.Id = tblattendance.classId INNER JOIN tblclassarms ON tblclassarms.Id = tblattendance.classArmId INNER JOIN tblsessionterm ON tblsessionterm.Id = tblattendance.sessionTermId INNER JOIN tblterm ON tblterm.Id = tblsessionterm.termId INNER JOIN tblstudents ON tblstudents.admissionNumber = tblattendance.admissionNo where tblattendance.admissionNo = '$admitno' and tblattendance.classId = '$_SESSION[classId]' and tblattendance.classArmId = '$_SESSION[classArmId]' group by tblattendance.status;";

$query1="SELECT firstName, COUNT(*) AS Attendance FROM tblattendance INNER JOIN tblclass ON tblclass.Id = tblattendance.classId INNER JOIN tblclassarms ON tblclassarms.Id = tblattendance.classArmId INNER JOIN tblsessionterm ON tblsessionterm.Id = tblattendance.sessionTermId INNER JOIN tblterm ON tblterm.Id = tblsessionterm.termId INNER JOIN tblstudents ON tblstudents.admissionNumber = tblattendance.admissionNo where tblattendance.admissionNo = 'PES1UG20CS823' and tblattendance.classId = '$_SESSION[classId]' and tblattendance.classArmId = '$_SESSION[classArmId]' group by tblattendance.status;";
/**
$query1="SELECT COUNT(*) FROM tblattendance
                        INNER JOIN tblclass ON tblclass.Id = tblattendance.classId
                        INNER JOIN tblclassarms ON tblclassarms.Id = tblattendance.classArmId
                        INNER JOIN tblsessionterm ON tblsessionterm.Id = tblattendance.sessionTermId
                        INNER JOIN tblterm ON tblterm.Id = tblsessionterm.termId
                        INNER JOIN tblstudents ON tblstudents.admissionNumber = tblattendance.admissionNo
                        where tblattendance.admissionNo = 'PES1UG20CS823' and tblattendance.classId = '$_SESSION[classId]' and tblattendance.classArmId = '$_SESSION[classArmId]' and status=1";

**/

//$query = "SELECT * FROM tblstudents"; // get the records on which pie chart is to be drawn
$getData1 = $conn->query($query);
$getData = $conn->query($query);
?>
<script>
    // Build the chart
    Highcharts.chart('container', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Student Attendance :<?php
                if ($getData1->num_rows>0){
                    if ($row = $getData1->fetch_object()){
						echo $row->firstName;
                    }
                }?>'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        accessibility: {
            point: {
                valueSuffix: '%'
            }
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
            name: 'Attendance',
            colorByPoint: true,
            data: [
                <?php
                $data = '';
                if ($getData->num_rows>0){
                    while ($row = $getData->fetch_object()){
						if($row->status=='1'){
							$data.='{ name:"present",y:'.$row->Attendance.'},';
						}else{
							$data.='{ name:"absent",y:'.$row->Attendance.'},';
						}
                    }
                }
                echo $data;
                ?>
            ]
        }]
    });
</script>
</body>
</html>