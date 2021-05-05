<?php
	include "server.php";
	
	$username = strtolower($_REQUEST['username']);
	$password = $_REQUEST['password'];
	$hash = hash('sha256' ,$password);
	$role = $_REQUEST['role'];
	
	if($role == "student"){
		$stmt = $con->prepare("SELECT ID, firstName, lastName from STUDENT WHERE email = ? and password = ?");
	}else{
		$stmt = $con->prepare("SELECT ID, firstName, lastName, title from STAFF WHERE email = ? and password = ?");
	}
	
	$stmt->bind_param("ss", $username, $hash);
	$stmt->execute();
	$result = $stmt->get_result();

	$response = new \stdClass();
	
	// if the username & password combination is found, return user's role
	// And start the session, save user information into session
	if($result->num_rows > 0){
		$row = $result->fetch_assoc();
		$response->id = $row['ID'];
		$response->firstName = $row['firstName'];
		$response->lastName = $row['lastName'];
		if($role == "student"){
			$response->role = $role;
		}else{
			$response->role = $row['title'];
		}
		
		session_start();
		$_SESSION['login'] = true;
		$_SESSION['user'] = $row['ID'];
		$_SESSION['role'] = $response->role;
		$_SESSION['firstName'] = $response->firstName;
		$_SESSION['lastName'] = $response->lastName;
	}else{
		$response->role = "unauthorized";
	}
	
	echo json_encode($response);
	
	exit();
?>