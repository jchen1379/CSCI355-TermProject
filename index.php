<?php
	session_start();
	session_destroy();
	header("Location: Finals/HTML/loginPage.html");
	exit();
?>