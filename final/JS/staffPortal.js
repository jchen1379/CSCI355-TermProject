window.addEventListener('load', () => {

	let pageTitle = document.querySelector("#application-title");
	let historyBtn = document.querySelector("#navigation-tab");
	let homeBtn = document.querySelector("#home-btn");
	let tableColThree = document.querySelector("#table-col-3");
	let tableColFour = document.querySelector("#table-col-4");
	let tableBody = document.querySelector("#table-body");
	let pendingDecision = document.querySelector("#pending-decision");
	let processDecision = document.querySelector("#processed-decision");

	// load all applications that are still pending to the table
	loadPending();

	historyBtn.addEventListener('click', loadHistory);
	homeBtn.addEventListener('click', loadPending);

	function loadHistory() {
		clearTable();
		pendingDecision.style.display = "none";
		processDecision.style.display = "unset";
		pageTitle.innerHTML = "Processed Applications";
		tableColThree.innerHTML = "Processed Time";
		tableColFour.innerHTML = "Result";

		var httpRequest = new XMLHttpRequest();
		httpRequest.open("GET", "../PHP/getApplications.php?application=processed");
		httpRequest.send();
		httpRequest.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var json = JSON.parse(httpRequest.responseText);

				document.querySelector("#application-amount").innerHTML = json.length;

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
					tableData2.innerHTML = json[i].studentFirst + " " + json[i].studentLast;

					tableData3 = document.createElement("td");
					tableData3.innerHTML = json[i].processedTime;

					tableData4 = document.createElement("td");
					tableData4.innerHTML = json[i].applicationStatus;

					tableRow.appendChild(tableData1);
					tableRow.appendChild(tableData2);
					tableRow.appendChild(tableData3);
					tableRow.appendChild(tableData4);

					tableBody.appendChild(tableRow);
				}
			}
		}
	}

	function loadPending() {
		clearTable();
		pendingDecision.style.display = "unset";
		processDecision.style.display = "none";
		pageTitle.innerHTML = "Pending Applications";
		tableColThree.innerHTML = "Request Time";
		tableColFour.innerHTML = "Document";

		var httpRequest = new XMLHttpRequest();
		httpRequest.open("GET", "../PHP/getApplications.php?application=pending");
		httpRequest.send();
		httpRequest.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var json = JSON.parse(httpRequest.responseText);
				document.querySelector("#application-amount").innerHTML = json.length;
				for (let i = 0; i < json.length; i++) {
					tableRow = document.createElement("tr");
					tableData1 = document.createElement("td");
					tableData1.innerHTML = json[i].applicationID;

					tableData2 = document.createElement("td");
					tableData2.innerHTML = json[i].studentFirst + " " + json[i].studentLast;

					tableData3 = document.createElement("td");
					tableData3.innerHTML = json[i].requestTime;

					tableData4 = document.createElement("td");
					linkToForm = document.createElement("a");
					linkToForm.setAttribute("data-toggle", "modal");
					linkToForm.setAttribute("data-target", "#application-detail");
					linkToForm.setAttribute("href", "#");
					linkToForm.setAttribute("id", json[i].applicationID);
					linkToForm.addEventListener('click', loadFormDetail);
					linkToForm.innerHTML = "Application Form";
					tableData4.appendChild(linkToForm);

					tableRow.appendChild(tableData1);
					tableRow.appendChild(tableData2);
					tableRow.appendChild(tableData3);
					tableRow.appendChild(tableData4);

					tableBody.appendChild(tableRow);
				}
			}
		}
	}

	function clearTable() {
		let tableBody = document.querySelector("#table-body");
		while (tableBody.hasChildNodes()) {
			tableBody.removeChild(tableBody.lastChild);
		}
	}


	function loadFormDetail(clicked) {
		let applicationID = parseInt(this.id);
		document.getElementById("application-id").innerHTML = applicationID;
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
				}else{
					let options = document.getElementsByName("decision");
					options[0].checked = true;
					document.getElementById("form-feedback").value = "";
				}
			}
		}

		// submit the application decision to database
		document.querySelector("#decision-form").onsubmit = function(event) {
			event.preventDefault();
			let decision;
			let options = document.getElementsByName("decision");
			for (let i = 0; i < options.length; i++) {
				if (options[i].checked)
					decision = options[i].value;
			}
			let feedback = document.getElementById("form-feedback").value;

			var httpRequest = new XMLHttpRequest();
			httpRequest.open("POST", "../PHP/staffSubmit.php?applicationID=" + applicationID + "&decision=" + decision +
				"&feedback=" + feedback);
			httpRequest.send();
			httpRequest.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					var json = JSON.parse(httpRequest.responseText);
					if (json.result == true) {
						loadPending();
					} else {
						console.log(json);
					}
				}
			}

			$("#application-detail").modal('hide');
		}
	}
});
