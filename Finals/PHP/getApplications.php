<?php
	// return all pending or processed application
	// while returning the processed application, if the user is a staff, only return the
	// applications that were processed by them. If the user is an admin, return all
	

	include "server.php";
	
	session_start();
	$applicationType = $_REQUEST['application'];
	$role = $_SESSION['role'];
	$id = $_SESSION['user'];
	
	if($applicationType == "pending"){
		$sql = "SELECT applicationID, requestTime, firstName, lastName 
				FROM APPLICATION
				JOIN STUDENT
				WHERE UPPER(applicationStatus) = 'PENDING' AND STUDENT.ID = studentID;";
	}else if($applicationType == "processed"){
		$sql = "SELECT applicationID, firstName, lastName, processedTime, applicationStatus
				FROM APPLICATION
				JOIN STUDENT
				WHERE UPPER(applicationStatus) != 'PENDING' AND ID = studentID";
		if($role == "staff"){
			$sql = $sql . " AND staffID = $id";
		}
	}
	
	$response = array();
	
	$result = $con->query($sql);

	while($row = $result->fetch_assoc()){
		$appObject = new \stdClass();
		$appObject->applicationID = $row['applicationID'];
		$appObject->studentLast = $row['lastName'];
		$appObject->studentFirst = $row['firstName'];
		if($applicationType == "pending"){
			$appObject->requestTime = $row['requestTime'];
		}else if($applicationType == "processed"){
			$appObject->processedTime = $row['processedTime'];
			$appObject->applicationStatus = $row['applicationStatus'];
		}
		array_push($response, $appObject);
	}
	
	echo json_encode($response);
	
	exit();
	
?>