window.addEventListener('load', () => {
	// redirect the user to the login page if they are not logged in
	checkIfLoggedIn();

	let studentID = document.querySelector("#studentID");
	let firstName = document.querySelector("#firstName");
	let lastName = document.querySelector("#lastName");
	let middleName = document.querySelector("#middleName");
	let fullName = document.querySelector("#fullName");
	let fullNameAlert = document.querySelector("#fullNameAlert");
	let semester = document.querySelector("#semester");
	let year = document.querySelector("#year");
	let career = document.querySelector("#career");
	let reason = document.querySelector("#reason");
	let phone = document.querySelector("#phone");
	let QCEmail = document.querySelector("#email");
	let submit = document.querySelector("#submit");

	autoFillStudentInfo();

	addYearOption();

	// the user must type in the full name same as the one on record
	fullName.addEventListener("input", checkFullName);


	// submit the application to the database
	document.querySelector("#application-form").onsubmit = function(event) {
		event.preventDefault();

		var httpRequest = new XMLHttpRequest();
		httpRequest.open("POST", "../PHP/studentSubmit.php?semester=" + semester.value +
			"&year=" + year.value + "&career=" + career.value + "&reason=" + reason.value + "&phone=" + phone.value);
		httpRequest.send();
		httpRequest.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var json = JSON.parse(httpRequest.responseText);
				if (json['result'] == true) {
					window.location.replace("../HTML/studentPortal.html");
				}
			}
		}
	};


	// to check if a user is logged in or not
	function checkIfLoggedIn() {
		var httpRequest = new XMLHttpRequest();
		httpRequest.open("GET", "../PHP/verifyUser.php");
		httpRequest.send();
		httpRequest.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var json = JSON.parse(httpRequest.responseText);
				if (json['loggedIn'] == false || json['role'] != 'student') {
					window.location.replace("../HTML/loginPage.html");
				}
			}
		}
	}


	// auto fill some basic information about the user in application form
	function autoFillStudentInfo() {
		var httpRequest = new XMLHttpRequest();
		httpRequest.open("GET", "../PHP/studentSubmit.php");
		httpRequest.send();
		httpRequest.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var json = JSON.parse(httpRequest.responseText);
				studentID.value = json['id'];
				firstName.value = json['firstName'];
				lastName.value = json['lastName'];
				QCEmail.value = json['email'];
			}
		}
	}


	// the user can only cancel the graduation in the following 4 years
	function addYearOption() {
		let currentTime = new Date();
		let currentYear = currentTime.getFullYear();

		for (let i = 0; i < 4; i++) {
			let yearOption = document.createElement("option");
			yearOption.setAttribute("value", currentYear + i)
			yearOption.innerHTML = currentYear + i;
			year.appendChild(yearOption);
		}
	}


	// user must type in their full name to confirm
	function checkFullName() {
		let validFullName;

		if (middleName.value != "") {
			validFullName = firstName.value + " " + middleName.value + " " + lastName.value;
		} else {
			validFullName = firstName.value + " " + lastName.value;
		}

		if (fullName.value != validFullName) {
			fullNameAlert.innerHTML = "Name Does Not Match!";
			fullName.classList.add("is-invalid");
			submit.disabled = true;
		} else {
			fullNameAlert.innerHTML = "";
			fullName.classList.remove("is-invalid");
			submit.disabled = false;
		}
	}
});
