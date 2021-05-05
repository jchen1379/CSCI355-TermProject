window.addEventListener('load', () => {
	let staffID = document.getElementById("sign-up-staff-ID");
	let role = document.getElementById("sign-up-role");
	let firstName = document.getElementById("sign-up-staff-first-name");
	let lastName = document.getElementById("sign-up-staff-last-name");
	let password = document.getElementById("sign-up-password");
	let password2 = document.getElementById("sign-up-password-2");
	let registerBtn = document.getElementById("register-btn");
	let deletePendingBtn = document.getElementById("delete-pending");

	let title = document.getElementById("message-title");
	let message1 = document.getElementById("message-1");
	let message2 = document.getElementById("message-2");

	deletePendingBtn.addEventListener('click', deleteApplication);

	staffID.addEventListener('blur', checkStaffID);
	staffID.addEventListener('input', resetWarning);
	firstName.addEventListener('blur', checkName);
	firstName.addEventListener('input', resetWarning);
	lastName.addEventListener('blur', checkName);
	lastName.addEventListener('input', resetWarning);
	password.addEventListener('blur', checkPassword);
	password.addEventListener('input', resetWarning);
	password2.addEventListener('blur', checkPassword);
	password2.addEventListener('input', resetWarning);

	document.getElementById("register-form").onsubmit = function(event) {
		event.preventDefault();

		var httpRequest = new XMLHttpRequest();
		httpRequest.open("POST", "../PHP/signUp.php?" + "id=" + staffID.value + "&role=" + role.value + "&first=" +
			formatName(firstName.value) + "&last=" + formatName(lastName.value) + "&password=" + password.value);
		httpRequest.send();
		httpRequest.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var json = JSON.parse(httpRequest.responseText);
				if (json.result == true) {
					title.innerHTML = "Sign Up Successfully!";
					message1.innerHTML = "Sign Up Role: " + json.role;
					message2.innerHTML = "Username/Email Address: " + json.email;
				} else {
					title.innerHTML = "Failed to Sign Up!";
					message1.innerHTML = "This staff may have registered.";
					message2.innerHTML = "Please contact the database manager for more info.";
				}
			}
		}

		staffID.value = "";
		role.value = "staff";
		firstName.value = "";
		lastName.value = "";
		password.value = "";
		password2.value = "";

		$("#register-modal").modal('hide');
		$("#message-box").modal('show');
	}


	function checkStaffID() {
		if (staffID.value.length != 8 || studentID.value.toString()[0] == '0') {
			staffID.classList.add("is-invalid");
			registerBtn.disabled = true;
		}
	}

	function checkName() {
		var letters = /^[A-Za-z]+$/;

		if (!firstName.value.match(letters)) {
			firstName.classList.add("is-invalid");
			registerBtn.disabled = true;
		}

		if (!lastName.value.match(letters)) {
			lastName.classList.add("is-invalid");
			registerBtn.disabled = true;
		}
	}

	function checkPassword() {
		if (password.value.length < 8) {
			password.classList.add("is-invalid");
			registerBtn.disabled = true;
		}

		if (password.value != password2.value) {
			password2.classList.add("is-invalid");
			registerBtn.disabled = true;
		}
	}

	function resetWarning() {
		this.classList.remove("is-invalid");
		registerBtn.disabled = false;
	}

	function deleteApplication() {
		applicationID = parseInt(document.getElementById("application-id").textContent);
		var httpRequest = new XMLHttpRequest();
		httpRequest.open("POST", "../PHP/deleteApplication.php?applicationID=" + applicationID);
		httpRequest.send();
		httpRequest.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var json = JSON.parse(httpRequest.responseText);
				if (json.result == true) {
					title.innerHTML = "Delete Successfully!";
				} else {
					title.innerHTML = "Failed to delete!";
				}
				message1.innerHTML = "Application ID: " + applicationID;
				message2.innerHTML = "";
			}
		}

		$("#application-detail").modal('hide');
		$("#message-box").modal('show');
		
		setTimeout(()=>{location.reload();}, 1500);
	}
	
	function formatName(name) {
		var sentence = name.toLowerCase().split(" ");
		for (var i = 0; i < sentence.length; i++) {
			sentence[i] = sentence[i][0].toUpperCase() + sentence[i].slice(1);
		}
		return sentence;
	}

});
