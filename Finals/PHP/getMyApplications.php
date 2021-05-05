<?php
	// return all pending or processed application

	include "server.php";
	
	session_start();
	$id = $_SESSION['user'];
	
	$sql = "SELECT * FROM APPLICATION 
			WHERE studentID = $id";
	
	$response = array();
	
	$result = $con->query($sql);

	while($row = $result->fetch_assoc()){
		$appObject = new \stdClass();
		$appObject->applicationID = $row['applicationID'];
		$appObject->requestTime = $row['requestTime'];
		$appObject->processedTime = $row['processedTime'];
		$appObject->applicationStatus = $row['applicationStatus'];
		array_push($response, $appObject);
	}
	
	echo json_encode($response);
	exit();
	
?>