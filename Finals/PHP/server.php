<?php
	$hostname = 'mars.cs.qc.cuny.edu';
	
	$filename = "secret.txt";
	$handle = fopen($filename, "r");
	$contents = fread($handle, filesize($filename));
	$details = explode(';', $contents);
	
	$username = trim($details[0]);
	$password = trim($details[1]);
	$dbname = trim($details[0]);
	
	fclose($handle);
	
	$con = new mysqli($hostname,$username,$password,$dbname);
	
	if($con -> connect_errno){
		trigger_error('Database connecion failed: ' . $con->connect_error);
		exit();
	}
?>