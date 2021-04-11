window.addEventListener('load', () => {
	let ID = document.querySelector("#studentID");
	let IDAlert = document.querySelector("#IDAlert");
	let firstName = document.querySelector("#firstName");
	let lastName = document.querySelector("#lastName");
	let middleName = document.querySelector("#middleName");
	let fullName = document.querySelector("#fullName");
	let fullNameAlert = document.querySelector("#fullNameAlert");
	let QCEmail = document.querySelector("#email");
	let year = document.querySelector("#year");
	let submit = document.querySelector("#submit");

	ID.addEventListener("blur", () => {
		if (ID.value.length != 8) {
			IDAlert.innerHTML = "Must be 8 digits!";
			ID.classList.add("is-invalid");
			submit.disabled = true;
		} else {
			IDAlert.innerHTML = "";
			ID.classList.remove("is-invalid");
			submit.disabled = false;
		}
	})

	firstName.addEventListener("change", clearFullNameField);
	lastName.addEventListener("change", clearFullNameField);
	middleName.addEventListener("change", clearFullNameField);

	fullName.addEventListener("input", () => {
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
	})
	
	let currentTime = new Date();
	let currentYear = currentTime.getFullYear();
	
	for(let i = 0; i < 4; i++){
		let yearOption = document.createElement("option");
		yearOption.setAttribute("value", currentYear+i)
		yearOption.innerHTML = currentYear+i;
		year.appendChild(yearOption);
	}
})


function clearFullNameField() {
	fullName.value = "";
}
