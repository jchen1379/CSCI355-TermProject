<?php
	include "server.php";
	
	session_start();
	
	$id = $_REQUEST['id'];
	$firstName = $_REQUEST['first'];
	$lastName = $_REQUEST['last'];
	$password = $_REQUEST['password'];
	$hash = hash('sha256', $password);
	$isStaff = FALSE;
	
	if(isset($_SESSION['login']) && $_SESSION['login'] == true && $_SESSION['role']=="admin"){
		$isStaff = TRUE;
		$role = $_REQUEST['role'];
		$email = "$firstName.$lastName" . substr((string) $id, -2). "@qc.cuny.edu";
		$stmt = $con->prepare("INSERT INTO STAFF VALUES (?, ?, ?, ?, ?, ?);");
		$stmt->bind_param("isssss", $id, $firstName, $lastName, $hash, $role, $email);
	}else{
		session_destroy();
		$ssn = $_REQUEST['ssn'];
		$email = "$firstName.$lastName" . substr((string) $id, -2) . "@qmail.cuny.edu";
		$stmt = $con->prepare("INSERT INTO STUDENT VALUES (?, ?, ?, ?, ?, ?);");
		$stmt->bind_param("ississ", $id, $firstName, $lastName, $ssn, $email, $hash);
	}
	
	$response = new \stdClass();

	if($stmt->execute()){
		$response->result = true;
		$response->email = $email;
		if($isStaff)
			$response->role = $role;
	}else{
		$response->result = false;
	}
	
	echo json_encode($response);
	
	$con->close();
	
	exit();
?>