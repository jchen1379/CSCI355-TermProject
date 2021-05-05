<?php
	session_start();
	$response = new \stdClass();
	
	if(!(isset($_SESSION['login']) && $_SESSION['login']==true)){
		$response->loggedIn = false;
		session_destroy();
	}else{
		$response->loggedIn = true;
		$response->user = $_SESSION['user'];
		$response->firstName = $_SESSION['firstName'];
		$response->lastName = $_SESSION['lastName'];
		$response->role = $_SESSION['role'];
	}
	
	echo json_encode($response);
	exit();
?>