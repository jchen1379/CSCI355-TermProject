<?php
	include "server.php";
	
	session_start();
	$applicationID = $_REQUEST['applicationID'];
	
	// run a search to see if the application is still pending or is already processed
	$sql = "SELECT * FROM APPLICATION WHERE applicationID = $applicationID;";
	$result = $con->query($sql);
	$row = $result->fetch_assoc();
	$applicationType = $row['applicationStatus'];
	
	
	if($applicationType != "Pending"){
		// the application that is already processed
		$sql = "SELECT 
				studentID, 
				s.firstName studentFirst, 
				s.lastName studentLast, 
				semester,
				year,
				career,
				reason,
				phone,
				s.email,
				st.firstName staffFirst, 
				st.lastName staffLast,
				applicationStatus,
				feedback
				FROM APPLICATION
				JOIN STUDENT s
				JOIN STAFF st
				WHERE applicationID = $applicationID AND s.ID = studentID AND st.ID = staffID;";
	}else if($applicationType == "Pending"){
		// the application that is still pending
		$sql = "SELECT 
				studentID, 
				s.firstName studentFirst, 
				s.lastName studentLast, 
				semester,
				year,
				career,
				reason,
				phone,
				s.email
				FROM APPLICATION
				JOIN STUDENT s
				WHERE applicationID = $applicationID AND s.ID = studentID;";
	}
	
	
	// putting form data into an object and return with a json format
	$result = $con->query($sql);
	$row = $result->fetch_assoc();
	$response = new \stdClass();
	$response->applicationType = $applicationType;
	$response->studentID = $row['studentID'];
	$response->studentFirst = $row['studentFirst'];
	$response->studentLast = $row['studentLast'];
	$response->semester = $row['semester'];
	$response->year = $row['year'];
	$response->career = $row['career'];
	$response->reason = $row['reason'];
	$response->phone = $row['phone'];
	$response->email = $row['email'];
		
	if($applicationType != "Pending"){
		$response->staffFirst = $row['staffFirst'];
		$response->staffLast = $row['staffLast'];
		$response->applicationStatus = $row['applicationStatus'];
		$response->feedback = $row['feedback'];
	}
		
	echo json_encode($response);
	exit();
?>