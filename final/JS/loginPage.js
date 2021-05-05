window.addEventListener('load', () => {
	let alert = document.getElementById("alert");
	let alertHeading = document.getElementById("alert-heading");
	let alertContent = document.getElementById("alert-content");
	let alertEmail = document.getElementById("alert-email");
	let inputField = document.getElementsByTagName("input");
	let signUpPassword = document.getElementById("password");
	let confirmPassword = document.getElementById("confirm-password");
	let signUpBtn = document.getElementById("sign-up-btn");
	let firstName = document.getElementById("first");
	let lastName = document.getElementById("last");
	let studentID = document.getElementById("id");
	let ssn = document.getElementById("ssn");
	let password = document.getElementById("password");


	firstName.addEventListener('blur', checkName);
	firstName.addEventListener('input', resetWarning);
	lastName.addEventListener('blur', checkName);
	lastName.addEventListener('input', resetWarning);
	studentID.addEventListener('blur', checkStudentID);
	studentID.addEventListener('input', resetWarning);
	ssn.addEventListener('blur', checkSSN);
	ssn.addEventListener('input', resetWarning);
	signUpPassword.addEventListener('blur', checkPassword);
	signUpPassword.addEventListener('input', resetWarning);
	confirmPassword.addEventListener('blur', checkPassword);
	confirmPassword.addEventListener('input', resetWarning);

	// reset the alert information once user is putting new input
	for (let i = 0; i < inputField.length; i++) {
		inputField[i].addEventListener('click', resetSignUpAlert);
	}


	// check the username and password combination in the table corresponding to the role user chooses
	document.querySelector("#login-form").onsubmit = function(event) {
		event.preventDefault();

		var username = document.getElementById("login-username").value;
		var password = document.getElementById("login-password").value;
		var roleInput = document.getElementsByName("login-role");
		let role = roleInput[0].value;
		if (roleInput[1].checked)
			role = roleInput[1].value;

		var httpRequest = new XMLHttpRequest();
		httpRequest.open("POST", "../PHP/login.php?" + "username=" + username + "&password=" + password + "&role=" + role);
		httpRequest.send();

		httpRequest.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var json = JSON.parse(httpRequest.responseText);
				let loginRole = json['role'];

				// if the login credential is not recognized, show alert
				if (loginRole == "unauthorized") {
					alert.classList.add("alert-danger");
					alert.classList.add("show");
					alertHeading.innerHTML = "Wrong username/password!";
				} else {
					// redirect the user to different pages base on their role
					if (loginRole == "student") {
						window.location.replace("../HTML/studentPortal.html");
					} else {
						if (loginRole == "staff") {
							window.location.replace("../HTML/staffPortal.html");
						} else if (loginRole == "admin") {
							window.location.replace("../HTML/adminPortal.html");
						}
					}
				}
			}
		}
	}


	// submit the sign up information to database
	document.querySelector("#sign-up-form").onsubmit = function(event) {
		event.preventDefault();

		var httpRequest = new XMLHttpRequest();
		httpRequest.open("POST", "../PHP/signUp.php?" + "role=student" + "&first=" + formatName(firstName.value) + "&last=" + formatName(lastName
			.value) + "&id=" + studentID.value + "&ssn=" + ssn.value + "&password=" + password.value);
		httpRequest.send();
		httpRequest.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var json = JSON.parse(httpRequest.responseText);
				let result = json['result'];

				if (result == true) {
					alert.classList.add("alert-success");
					alertHeading.innerHTML = "Sign Up Successfully!";
					alertContent.innerHTML = "Your username & email address is:";
					alertEmail.innerHTML = json['email'];
				} else {
					alert.classList.add("alert-danger");
					alertHeading.innerHTML = "Failed to Sign Up!";
					alertContent.innerHTML = "";
					alertEmail.innerHTML = "";
				}
				alert.classList.add("show");
			}
		}
		$("#signUp").modal('hide');
	}


	function resetSignUpAlert() {
		if (alert.classList.contains("alert-danger")) {
			alert.classList.remove("show");
			alert.classList.remove("alert-danger");
			alertContent.innerHTML = "";
			alertEmail.innerHTML = "";
		}
	}

	function checkName() {
		var letters = /^[A-Za-z]+$/;

		if (!firstName.value.match(letters)) {
			firstName.classList.add("is-invalid");
			signUpBtn.disabled = true;
		}

		if (!lastName.value.match(letters)) {
			lastName.classList.add("is-invalid");
			signUpBtn.disabled = true;
		}
	}

	function checkSSN() {
		if (ssn.value.length != 4) {
			ssn.classList.add("is-invalid");
			signUpBtn.disabled = true;
		}
	}

	function checkStudentID() {
		if(studentID.value.length != 8 || studentID.value.toString()[0] == '0'){
			studentID.classList.add("is-invalid");
			signUpBtn.disabled = true;
		}
	}

	function checkPassword() {
		if (signUpPassword.value.length < 8) {
			signUpPassword.classList.add("is-invalid");
			signUpBtn.disabled = true;
		}

		if (signUpPassword.value != confirmPassword.value) {
			confirmPassword.classList.add("is-invalid");
			signUpBtn.disabled = true;
		}
	}

	function resetWarning() {
		this.classList.remove("is-invalid");
		signUpBtn.disabled = false;
	}

	function formatName(name) {
		var sentence = name.toLowerCase().split(" ");
		for (var i = 0; i < sentence.length; i++) {
			sentence[i] = sentence[i][0].toUpperCase() + sentence[i].slice(1);
		}
		return sentence;
	}

});