<?php
	include "server.php";
	
	session_start();
	$applicationID = $_REQUEST['applicationID'];
	
	$stmt = $con->prepare("DELETE FROM APPLICATION WHERE applicationID = ?");
	$stmt->bind_param("i", $applicationID);
	
	$response = new \stdClass();
	
	if($stmt->execute()){
		$response->result = true;
	}else{
		$response->result = false;
	}
	
	echo json_encode($response);
	exit();
?>