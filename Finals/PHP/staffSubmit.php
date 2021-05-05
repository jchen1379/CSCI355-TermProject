<?php
	include "server.php";
	
	session_start();
	$id = $_SESSION['user'];
	$applicationID = $_REQUEST['applicationID'];
	$decision = $_REQUEST['decision'];
	$feedback = $_REQUEST['feedback'];
	
	
	$stmt = $con->prepare("UPDATE APPLICATION
			SET staffID = ?, applicationStatus = ?, feedback = ?, processedTime = now() WHERE applicationID = ?;");

	$stmt->bind_param("issi", $id, $decision, $feedback, $applicationID);
			
	$response = new \stdClass();
	if($stmt->execute()) {
		$response->result = true;
	}else{
		$response->result = $con->error;
	}
	
	echo json_encode($response);
	exit();
?>