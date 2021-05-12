window.addEventListener('load', ()=>{
	var httpRequest = new XMLHttpRequest();
	httpRequest.open("GET", "../PHP/verifyUser.php");
	httpRequest.send();
	httpRequest.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var json = JSON.parse(httpRequest.responseText);
			if (json['loggedIn'] == false || json['role'] != 'admin') {
				window.location.replace("../HTML/loginPage.html");
			} else {
				document.querySelector("#staff-name").innerHTML = json['firstName'] + " " + json['lastName'];
				document.querySelector("#staff-id").innerHTML = json['user'];
			}
		}
	}
})