window.addEventListener('load', () => {
	checkIfLoggedIn();

	loadMyApplications();

	function checkIfLoggedIn() {
		var httpRequest = new XMLHttpRequest();
		httpRequest.open("GET", "../PHP/verifyUser.php");
		httpRequest.send();
		httpRequest.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var json = JSON.parse(httpRequest.responseText);
				if (json['loggedIn'] == false || json['role'] != 'student') {
					window.location.replace("../HTML/loginPage.html");
				} else {
					document.querySelector("#student-name").innerHTML = json['firstName'] + " " + json['lastName'];
					document.querySelector("#student-id").innerHTML = json['user'];
				}
			}
		}
	}

	function loadMyApplications() {
		var httpRequest = new XMLHttpRequest();
		httpRequest.open("GET", "../PHP/getMyApplications.php");
		httpRequest.send();
		httpRequest.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var json = JSON.parse(httpRequest.responseText);
				document.getElementById("application-amount").innerHTML = json.length;
				for (let i = 0; i < json.length; i++) {
					tableRow = document.createElement("tr");

					tableData1 = document.createElement("td");
					linkToForm = document.createElement("a");
					linkToForm.setAttribute("data-toggle", "modal");
					linkToForm.setAttribute("data-target", "#application-detail");
					linkToForm.setAttribute("href", "#");
					linkToForm.setAttribute("id", json[i].applicationID);
					linkToForm.addEventListener('click', loadFormDetail);
					linkToForm.innerHTML = json[i].applicationID;
					tableData1.appendChild(linkToForm);

					tableData2 = document.createElement("td");
					tableData2.innerHTML = json[i].requestTime;

					tableData3 = document.createElement("td");
					tableData3.innerHTML = json[i].processedTime;

					tableData4 = document.createElement("td");
					tableData4.innerHTML = json[i].applicationStatus;

					tableRow.appendChild(tableData1);
					tableRow.appendChild(tableData2);
					tableRow.appendChild(tableData3);
					tableRow.appendChild(tableData4);
					document.getElementById("table-body").appendChild(tableRow);
				}
			}
		}
	}

	function loadFormDetail(clicked) {
		let applicationID = parseInt(this.id);
		var httpRequest = new XMLHttpRequest();
		httpRequest.open("GET", "../PHP/getFormData.php?applicationID=" + applicationID);
		httpRequest.send();
		httpRequest.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var json = JSON.parse(httpRequest.responseText);
				document.getElementById("studentID").value = json.studentID;
				document.getElementById("lastName").value = json.studentLast;
				document.getElementById("firstName").value = json.studentFirst;
				document.getElementById("semester").value = json.semester;
				document.getElementById("year").value = json.year;
				document.getElementById("career").value = json.career;
				document.getElementById("reason").value = json.reason
				document.getElementById("phone").value = json.phone;
				document.getElementById("email").value = json.email;

				if (json.applicationType != "Pending") {
					document.getElementById("decision").value = json.applicationStatus;
					document.getElementById("staff").value = json.staffFirst + " " + json.staffLast;
					document.getElementById("feedback").value = json.feedback;
				} else {
					document.getElementById("decision").value = "Pending";
					document.getElementById("staff").value = "";
					document.getElementById("feedback").value = "";
				}
			}
		}
	}
});
