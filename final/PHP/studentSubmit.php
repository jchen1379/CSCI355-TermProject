<?php
	include "server.php";
	
	session_start();
	$id = $_SESSION['user'];
	
	$response = new \stdClass();
	
	if($_SERVER['REQUEST_METHOD'] === 'GET'){
		
		$sql = "select ID, firstName, lastName, email from STUDENT where ID = $id";
		$result = $con->query($sql);
		$row = $result->fetch_assoc();
		
		$response->id = $row['ID'];
		$response->firstName = $row['firstName'];
		$response->lastName = $row['lastName'];
		$response->email = $row['email'];
		
	}else if($_SERVER['REQUEST_METHOD'] === 'POST'){
		
		$semester = $_REQUEST['semester'];
		$year = $_REQUEST['year'];
		$career = $_REQUEST['career'];
		$reason = $_REQUEST['reason'];
		$phone = $_REQUEST['phone'];
		$status = "Pending";
		
		$stmt = $con->prepare("INSERT INTO APPLICATION VALUES (NULL, now(), ?, NULL, ?, ?, ?, ?, ?, ?, NULL, NULL)");
		$stmt->bind_param("sisisss", $status, $id, $semester, $year, $career, $reason, $phone);
		
		if($stmt->execute()) {
			$response->result = true;
		}else{
			$response->result = $con->error;
		}
	}
	
	echo json_encode($response);
	exit();
?>