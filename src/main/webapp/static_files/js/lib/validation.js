/* helper functions */
function resetErrors(inputs, errorText, errorInfo) {
	for (let i = 0; i < inputs.length; i++) {
		inputs[i].classList.remove("has-error");
	}
	for (let i = 0; i < errorText.length; i++) {
		errorText[i].innerText = "";
	}
	errorInfo.innerText = "";
}

function resetErrors(inputs, errorText) {
	for (let i = 0; i < inputs.length; i++) {
		inputs[i].classList.remove("has-error");
	}
	for (let i = 0; i < errorText.length; i++) {
		errorText[i].innerText = "";
	}
}
function checkPesel(pesel) {
	const numbers = /[0-9]/g;

	if (!pesel.match(numbers))
		return false;

	return true;
}
function checkZip(value) {
	if (!value.match(/^\d\d-\d\d\d$/)) {
		return false;
	}
	return true;
}
function checkLetters(value) {
	const letters = /[a-z]/i;

	if (!value.match(letters)) {
		return false;
	}
	return true;
}

function checkRequired(value) {
	if (!value) {
		return false;
	}
	value = value.toString().trim();
	if (value === "") {
		return false;
	}
	return true;
}

function checkTextLengthRange(value, min, max) {
	console.log("checktext" + value);
	if (!value) {
		return false;
	}
	value = value.toString().trim();
	const length = value.length;
	if (max && length > max) {
		return false;
	}
	if (min && length < min) {
		return false;
	}
	return true;
}

// function checkIfNumber(value) {
// 	if (!value) {
// 		return false;
// 	}
// 	value = value.toString().trim();
// 	const length = value.length;
// 	if (isNaN(!value)) {
// 		return false;
// 	}
// 	return true;
// }


// function allLetter(value) {
// 	if (!value) {
// 		return false;
// 	}
// 	value = value.toString().trim();
// 	if (inputtxt.value.match(letters)) {
// 		return false;
// 	}
// 	return true;
// }

function ifLetters(value) {
	let regex = /^\d*$/
	if (regex.test(value)) {
		return true;
	}
	return false;
}

/* * * Validate create new user  * * */

function validateTaskForm() {
	let valid = true;

	const nameInput = document.getElementById("name");

	const nameDiv = document.getElementById("nameDiv");

	const nameError = document.getElementById("nameError");

	const summaryErrors = document.getElementById("errors");
	resetErrors([nameError, summaryErrors],
		[nameError], summaryErrors);


	if (!checkRequired(nameInput.value)) {
		nameError.innerText = "Pole nie może być puste";
		nameError.classList.add("has-error");
		valid = false;

	} else if (!checkTextLengthRange(nameInput.value, 2, 30)) {
		nameError.innerText = "Długość pola od 2 do 30 znaków";
		nameError.classList.add("has-error");
		valid = false;
	}




	if (!valid) {
		return false;
	} else {
		form.submit();
		return false;
	}

}

function validateOrderForm() {
	let valid = true;

	const reservationIdInput = document.getElementById("reservationId");

	const reservationIdDiv = document.getElementById("reservationIdDiv");

	const reservationIdError = document.getElementById("reservationIdError");

	const summaryErrors = document.getElementById("errors");
	resetErrors([reservationIdError, summaryErrors],
		[reservationIdError], summaryErrors);



	if (!checkRequired(reservationIdInput.value)) {
		reservationIdError.innerText = "Pole nie może być puste";
		reservationIdError.classList.add("has-error");
		valid = false;
	}
	else if (!ifLetters(reservationIdInput.value)) {
		reservationIdError.innerText = "Pole musi być liczbą";
		reservationIdError.classList.add("has-error");
		valid = false;

	} else if (reservationIdInput.value < 1 || reservationIdInput.value % 1 !== 0) {
		reservationIdError.innerText = "Podaj nr rezerwacji - liczba dodatnia całkowita";
		reservationIdError.classList.add("has-error");
		valid = false;
	}


 

	if (!valid) {
		return false;
	} else {
		form.submit();
		return false;
	}

}


function validateBookForm() {
	let valid = true;

	const nameInput = document.getElementById("name");
	const last_nameInput = document.getElementById("last_name");
	const peselInput = document.getElementById("pesel");
	const document_numberInput = document.getElementById("document_number");
	const document_typeInput = document.getElementById("document_type");
	const roomInput = document.getElementById("roomSelect");
	const startInput = document.getElementById("start");
	const endInput = document.getElementById("end");

	const nameDiv = document.getElementById("nameDiv");
	const last_nameDiv = document.getElementById("last_nameDiv");
	const peselDiv = document.getElementById("peselDiv");
	const document_numberDiv = document.getElementById("document_numberDiv");
	const document_typeDiv = document.getElementById("document_typeDiv");
	const roomDiv = document.getElementById("roomDiv");
	const startDiv = document.getElementById("startDiv");
	const endDiv = document.getElementById("endDiv");

	const nameError = document.getElementById("nameError");
	const last_nameError = document.getElementById("last_nameError");
	const peselError = document.getElementById("peselError");
	const document_numberError = document.getElementById("document_numberError");
	const document_typeError = document.getElementById("document_typeError");
	const roomError = document.getElementById("roomError");
	const startError = document.getElementById("startError");
	const endError = document.getElementById("endError");

	const summaryErrors = document.getElementById("errors");
	resetErrors([nameDiv, last_nameDiv, peselDiv, document_numberDiv, document_typeDiv, /*roomInput,*/ startDiv, endDiv, summaryErrors],
		[nameError, last_nameError, peselError, document_numberError, document_typeError, /*roomError,*/ startError, endError], summaryErrors);


	if (!checkRequired(nameInput.value)) {
		nameError.innerText = "Pole nie może być puste";
		nameDiv.classList.add("has-error");
		valid = false;

	} else if (!checkTextLengthRange(nameInput.value, 2, 60)) {
		nameError.innerText = "Długość pola od 2 do 60 znaków";
		nameDiv.classList.add("has-error");
		valid = false;
	}

	if (!checkRequired(last_nameInput.value)) {
		last_nameError.innerText = "Pole nie może być puste";
		last_nameDiv.classList.add("has-error");
		valid = false;
	} else if (!checkTextLengthRange(last_nameInput.value, 2, 60)) {
		last_nameError.innerText = "Długość pola od 2 do 60 znaków";
		last_nameDiv.classList.add("has-error");
		valid = false;
	}

	if (!checkRequired(peselInput.value)) {
		peselError.innerText = "Pole nie może być puste";
		peselDiv.classList.add("has-error");
		valid = false;
	}

	// else if (!checkIfNumber(peselInput.value)) {
	// 	peselError.innerText = "Pole nie może być z liter!";
	// 	peselDiv.classList.add("has-error");
	// 	valid = false;
	// }


	// else if (!checkPesel(peselInput.value)) {
	// 	peselError.innerText = "Numer PESEL powinien się składać z tylko z liczb";
	// 	peselDiv.classList.add("has-error");
	// 	valid = false;
	// } 
	else if (!checkTextLengthRange(peselInput.value, 11, 11)) {
		peselError.innerText = "Długość pola PESEL 11 znaków";
		peselDiv.classList.add("has-error");
		valid = false;
	}

	else if (!ifLetters(peselInput.value)) {
		peselError.innerText = "Pesel musi składać się z samych cyfr";
		peselDiv.classList.add("has-error");
		valid = false;
	}



	if (!checkRequired(document_numberInput.value)) {
		document_numberError.innerText = "Pole nie może być puste";
		document_numberDiv.classList.add("has-error");
		valid = false;
	} else if (!checkTextLengthRange(document_numberInput.value, 2, 30)) {
		document_numberError.innerText = "Długość pola od 2 do 30 znaków";
		document_numberDiv.classList.add("has-error");
		valid = false;
	}


	if (!checkRequired(document_typeInput.value)) {
		document_typeError.innerText = "Pole nie może być puste";
		document_typeDiv.classList.add("has-error");
		valid = false;
	} else if (!checkTextLengthRange(document_typeInput.value, 2, 20)) {
		document_typeError.innerText = "Długość pola od 2 do 20 znaków";
		document_typeDiv.classList.add("has-error");
		valid = false;
	}

	// else if (!allLetter(document_typeInput.value)) {
	// 	document_typeError.innerText = "Pole powinno zawierać tylko litery";
	// 	document_typeDiv.classList.add("has-error");
	// 	valid = false;
	// }



	// else if (!checkLetters(document_typeInput.value)) {
	// 	document_typeError.innerText = "Pole powinno zawierać tylko litery";
	// 	document_typeDiv.classList.add("has-error");
	// 	valid = false;
	// }

//	if (!checkRequired(roomInput.value)) {
//		roomError.innerText = "Pole nie może być puste";
//		roomDiv.classList.add("has-error");
//		valid = false;
//	} else if (!ifLetters(roomInput.value)) {
//		roomError.innerText = "Nr pokoju musi składać się z samych cyfr";
//		roomDiv.classList.add("has-error");
//		valid = false;
//	} else if (roomInput.value < 1 || roomInput.value > 12 || roomInput.value % 1 !== 0) {
//		roomError.innerText = "Podaj nr pokoju z zakresu 1-12 (liczba całkowita)";
//		roomDiv.classList.add("has-error");
//		valid = false;
//	}
	
	
	if (roomInput.selectedIndex === 0) {
		roomError.innerText = "Pole nie może być puste";
		roomDiv.classList.add("has-error");
		valid = false;
	}

	if (!checkRequired(startInput.value)) {
		startError.innerText = "Pole nie może być puste";
		startDiv.classList.add("has-error");
		valid = false;
	}

	if (!checkRequired(endInput.value)) {
		endError.innerText = "Pole nie może być puste";
		endDiv.classList.add("has-error");
		valid = false;
	}

	if (!valid) {
		return false;
	} else {
		form.submit();
		return false;
	}

}




// function validateBookEditForm() {
// 	let valid = true;

// 	const startInput = document.getElementById("start");

// 	const startDiv = document.getElementById("startDiv");

// 	const startError = document.getElementById("startError");

// 	const summaryErrors = document.getElementById("errors");
// 	resetErrors([startDiv, summaryErrors],
// 		[startError], summaryErrors);

// 	if (!checkRequired(startInput.value)) {
// 		startError.innerText = "Pole nie może być puste";
// 		startDiv.classList.add("has-error");
// 		valid = false;
// 	}

// 	if (!valid) {
// 		//summaryErrors.innerText = "Formularz zawiera błędy";
// 		return false;
// 	} else {
// 		form.edit();
// 		return false;
// 	}

// }



// function validateEmpEditForm() {
// 	let valid = true;

// 	const first_nameInput = document.getElementById("first_name");
// 	const last_nameInput = document.getElementById("last_name");

// 	const first_nameDiv = document.getElementById("first_nameDiv");
// 	const last_nameDiv = document.getElementById("last_nameDiv");

// 	const first_nameError = document.getElementById("first_nameError");
// 	const last_nameError = document.getElementById("last_nameError");

// 	const summaryErrors = document.getElementById("errors");
// 	resetErrors([first_nameDiv, last_nameDiv, summaryErrors],
// 		[first_nameError, last_nameDiv], summaryErrors);


// 	if (!checkRequired(first_nameInput.value)) {
// 		first_nameError.innerText = "Pole emp2 nie może być puste";
// 		first_nameDiv.classList.add("has-error");
// 		valid = false;

// 	} else if (!checkTextLengthRange(first_nameInput.value, 2, 30)) {
// 		first_nameError.innerText = "Długość pola emp2 od 2 do 30 znaków";
// 		first_nameDiv.classList.add("has-error");
// 		valid = false;
// 	}

// 	if (!checkRequired(last_nameInput.value)) {
// 		last_nameError.innerText = "Pole nie może być puste";
// 		last_nameDiv.classList.add("has-error");
// 		valid = false;
// 	} else if (!checkTextLengthRange(last_nameInput.value, 2, 60)) {
// 		last_nameError.innerText = "Długość pola od 2 do 60 znaków";
// 		last_nameDiv.classList.add("has-error");
// 		valid = false;
// 	}


// 	if (!valid) {
// 		//summaryErrors.innerText = "Formularz zawiera błędy";
// 		return false;
// 	} else {
// 		form.submit();
// 		return false;
// 	}

// }