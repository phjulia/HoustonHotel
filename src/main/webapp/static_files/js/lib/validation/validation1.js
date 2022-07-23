function validateVacationsFilter() {
	let valid = true;
	const dateFrom = document.getElementById("dateFrom");
	const dateTo = document.getElementById("dateTo");
	const filterError = document.getElementById("filterError");
	resetLoginErrors([dateFrom, dateTo], [filterError]);
	if (!checkRequired(dateFrom.value)) {
		filterError.innerText = "Wybierz daty";
		dateFrom.classList.add("has-error");
		dateTo.classList.add("has-error");
		valid = false;
	}else 
	if (!checkRequired(dateTo.value)) {
		filterError.innerText = "Wybierz daty";
		dateFrom.classList.add("has-error");
		dateTo.classList.add("has-error");
		valid = false;
	}else
	
	if (dateFrom.value >= dateTo.value) {
		filterError.innerText = "Data Do jest przed datą Od";
		dateFrom.classList.add("has-error");
		dateTo.classList.add("has-error");
		valid = false;
	}
	if (!valid) {
		return false;
	} else {
		//form.submit();
		return true;
	}
}
function validateRoom() {
	let valid = true;
	const priceInput = document.getElementById("priceInput");
	const priceError = document.getElementById("priceError");
	resetLoginErrors([priceInput], [priceError]);
	console.log(priceInput.value);
	if (!checkRequired(priceInput.value)) {
		priceError.innerText = "Pole nie może być puste";
		priceInput.classList.add("has-error");
		valid = false;
		console.log("Pole nie może być puste email");
	} else if (priceInput.value <= 0) {
		priceError.innerText = "Cena nie może być ujemna lub wynosić 0";
		priceInput.classList.add("has-error");
		valid = false;
		console.log("Pole  priceError");
	} else if (priceInput.value > 1000000) {
		priceError.innerText = "Maksymalna wartość pola 1 000 000";
		priceInput.classList.add("has-error");
		valid = false;
		console.log("Pole  priceError");
	} else if (!/^[0-9]+$/.test(priceInput.value)) {
		priceError.innerText = "Pole powinno zawierać wartość liczbową całkowitą(Np. 200)";
		priceInput.classList.add("has-error");
		valid = false;
		console.log("Pole  priceError");
	}

	if (!valid) {
		return false;
	} else {
		//form.submit();
		return true;
	}
}


/* validation of the login.jsp */
function validateLogin() {
	let valid = true;

	const emailInput = document.getElementById("emailInput");
	const form = document.getElementById("form");
	const passwordInput = document.getElementById("passwordInput");

	const emailError = document.getElementById("emailError");
	const passwordError = document.getElementById("passwordError");

	resetLoginErrors([emailInput, passwordInput], [emailError, passwordError]);

	if (!checkRequired(emailInput.value)) {
		emailError.innerText = "Pole nie może być puste";
		emailInput.classList.add("has-error");
		valid = false;

	} else if (!validateEmail(emailInput.value)) {
		emailError.innerText = "Pole email jest niepoprawne";
		emailInput.classList.add("has-error");
		valid = false;
	}

	if (!checkRequired(passwordInput.value)) {
		passwordError.innerText = "Pole nie może być puste";
		passwordInput.classList.add("has-error");
		valid = false;
	}
	if (!valid) {
		return false;
	} else {
		form.submit();
		return true;
	}


}

function resetLoginErrors(inputs, errorText) {
	for (let i = 0; i < inputs.length; i++) {
		inputs[i].classList.remove("has-error");
	}
	for (let i = 0; i < errorText.length; i++) {
		errorText[i].innerText = "";
	}

}


/* validation of the forgot_password.jsp */
function forgot_password_validation() {
	let valid = true;
	const email = document.getElementById("email");
	const error = document.getElementById("error");
	resetErrors([email], [error]);
	if (!checkRequired(email.value)) {
		error.innerText = "Pole nie może być puste";
		email.classList.add("has-error");
		valid = false;
	}
	return valid;
}
/*validation of the email functionallity*/
function validateEmailForm() {
	let valid = true;
	const emailInput = document.getElementById("emailInput");
	const messageInput = document.getElementById("messageInput");
	const subject = document.getElementById("subject");

	const emailError = document.getElementById("emailError");
	const messageError = document.getElementById("messageError");//messageError
	const subjectError = document.getElementById("titleError");

	resetErrors([emailInput, messageInput], [emailError, messageError]);
	if (!checkRequired(emailInput.value)) {
		emailError.innerText = "Pole nie może być puste";
		emailInput.classList.add("has-error");
		valid = false;
		console.log("error in the email");
	}
	else if (!validateEmail(emailInput.value)) {
		emailError.innerText = "Niepoprawny adres email";
		emailInput.classList.add("has-error");
		valid = false;
	}
	if (!checkRequired(messageInput.value)) {
		messageError.innerText = "Pole nie może być puste";
		messageInput.classList.add("has-error");
		valid = false;
	} else if (!checkTextLengthRange(messageInput.value, 0, 1000)) {
		messageError.innerText = "Zawartość powiadomienia nie może zawierać więcej niż 1000 znaków";
		messageInput.classList.add("has-error");
		valid = false;
	}
	if (!checkMaxLength(subject.value, 30)) {
		subjectError.innerText = "Tytuł nie może być dłuższy niż 30 znaków";
		subject.classList.add("has-error");
		valid = false;
	}
	if (!valid) {
		return false;
	} else {
		form.submit();
		return true;
	}
}



/* validation of the reset_password.jsp */

function validateForm() {
	let valid = true;
	let form = document.getElementById("reset_password_form");
	const password = document.getElementById("password");
	const repeat_password = document.getElementById("repeat_password");

	const passwordErrorText = document.getElementById("password-err");
	const repeatPasswordErrorText = document.getElementById("repeatPass-error");
	const summaryError = document.getElementById("summaryError");
	const input_div = document.getElementById("summaryErrorDiv");
	resetErrors([password, repeat_password, input_div], [passwordErrorText, repeatPasswordErrorText], summaryError);
	if (!checkRequired(password.value)) {
		passwordErrorText.innerText = "Pole nie może być puste";
		password.classList.add("has-error");
		valid = false;
		console.log("Pole nie może być puste password");
	}
	else if (!checkRequired(repeat_password.value)) {
		repeatPasswordErrorText.innerText = "Pole nie może być puste";
		repeat_password.classList.add("has-error");
		valid = false;
		console.log("Pole nie może być puste reset_password");
	} else if (!checkPasswords(password.value, repeat_password.value)) {
		summaryError.innerText = "Hasła różnią się";
		password.classList.add("has-error");
		repeat_password.classList.add("has-error");
		valid = false;
		console.log("passwords do not match");
	} else if (!checkPassword(password.value)) {
		summaryError.innerText = "Hasło powinno zawierać przynajmniej 1 dużą, 1 malą literę i 1 liczbę. Długość hasła powinna być od 6 do 20 znaków.";
		input_div.classList.add("has-error");
		valid = false;
	}
	if (!valid) {
		return false;
	} else {
		form.submit();

		return true;
	}
}

/* * * Validate create new user  * * */

function validateEmpForm() {
	let valid = true;

	const nameInput = document.getElementById("name");
	const last_nameInput = document.getElementById("last_name");
	const peselInput = document.getElementById("pesel");
	const addressInput = document.getElementById("addressInput");
	const cityInput = document.getElementById("cityInput");
	const zipInput = document.getElementById("zipInput");
	const hire_dateInput = document.getElementById("hire_dateInput");
	const birth_dateInput = document.getElementById("birth_dateInput");
	const emailInput = document.getElementById("emailInput");
	const jobSelect = document.getElementById("jobSelect");

	const nameError = document.getElementById("nameError");
	const last_nameError = document.getElementById("last_nameError");
	const peselError = document.getElementById("peselError");
	const addressError = document.getElementById("addressError");
	const cityError = document.getElementById("cityError");
	const zipError = document.getElementById("zipError");
	const hire_dateError = document.getElementById("hire_dateError");
	const birth_dateError = document.getElementById("birth_dateError");
	const emailError = document.getElementById("emailError");
	const jobError = document.getElementById("jobError");


	resetErrors([nameInput, last_nameInput, peselInput, addressInput, cityInput, zipInput,
		hire_dateInput, birth_dateInput, emailInput, emailInput, jobSelect],
		[nameError, last_nameError, peselError, addressError, cityError,
			zipError, hire_dateError, birth_dateError, emailError, jobError]);


	if (!checkRequired(nameInput.value)) {
		nameError.innerText = "Pole nie może być puste";
		nameInput.classList.add("has-error");
		valid = false;

	} else if (!checkTextLengthRange(nameInput.value, 2, 60)) {
		nameError.innerText = "Długość pola od 2 do 60 znaków";
		nameInput.classList.add("has-error");
		valid = false;
	} else if (!checkLetters(nameInput.value)) {
		nameError.innerText = "Pole powinno zawierać tylko litery";
		nameInput.classList.add("has-error");
		valid = false;
	}

	if (!checkRequired(last_nameInput.value)) {
		last_nameError.innerText = "Pole nie może być puste";
		last_nameInput.classList.add("has-error");
		valid = false;
	} else if (!checkTextLengthRange(last_nameInput.value, 2, 60)) {
		last_nameError.innerText = "Długość pola od 2 do 60 znaków";
		last_nameInput.classList.add("has-error");
		valid = false;
	} else if (!checkLetters(last_nameInput.value)) {
		last_nameError.innerText = "Pole powinno zawierać tylko litery";
		last_nameInput.classList.add("has-error");
		valid = false;
	}
	if (!checkRequired(peselInput.value)) {
		peselError.innerText = "Pole nie może być puste";
		peselInput.classList.add("has-error");
		valid = false;
	} else if (!checkPesel(peselInput.value)) {
		peselError.innerText = "Numer PESEL powinien się składać z tylko z liczb";
		peselInput.classList.add("has-error");
		valid = false;
	} else if (!checkTextLengthRange(peselInput.value, 11, 11)) {
		peselError.innerText = "Długość pola PESEL 11 znaków";
		peselInput.classList.add("has-error");
		valid = false;
	}
	if (!checkRequired(addressInput.value)) {
		addressError.innerText = "Pole nie może być puste";
		addressInput.classList.add("has-error");
		valid = false;
	} else if (!checkTextLengthRange(addressInput.value, 2, 70)) {
		addressError.innerText = "Długość pola od 2 do 70 znaków";
		addressInput.classList.add("has-error");
		valid = false;
	}
	if (!checkRequired(cityInput.value)) {
		cityError.innerText = "Pole nie może być puste";
		cityInput.classList.add("has-error");
		valid = false;
	} else if (!checkLetters(cityInput.value)) {
		cityError.innerText = "Pole powinno zawierać tylko litery";
		cityInput.classList.add("has-error");
		valid = false;
	} else if (!checkTextLengthRange(cityInput.value, 2, 25)) {
		cityError.innerText = "Długość pola od 2 do 25 znaków";
		cityInput.classList.add("has-error");
		valid = false;
	}

	if (!checkRequired(zipInput.value)) {
		zipError.innerText = "Pole nie może być puste";
		zipInput.classList.add("has-error");
		valid = false;
	} else if (!checkZip(zipInput.value)) {
		zipError.innerText = "Wprowadzono błędny kod pocztowy";
		zipInput.classList.add("has-error");
		valid = false;
	}
	if (!checkRequired(hire_dateInput.value)) {
		hire_dateError.innerText = "Pole nie może być puste";
		hire_dateInput.classList.add("has-error");
		valid = false;
	}
	if (!checkRequired(birth_dateInput.value)) {
		birth_dateError.innerText = "Pole nie może być puste";
		birth_dateInput.classList.add("has-error");
		valid = false;
	} else if (!checkBirthDate(birth_dateInput.value)) {
		birth_dateInput.classList.add("has-error");
		valid = false;
	}
	if (!checkRequired(emailInput.value)) {
		emailError.innerText = "Pole nie może być puste";
		emailInput.classList.add("has-error");
		valid = false;
	} else if (!validateEmail(emailInput.value)) {
		emailError.innerText = "Niepoprawny adres email";
		emailInput.classList.add("has-error");
		valid = false;
	} else if (!checkTextLengthRange(emailInput.value, 5, 30)) {
		emailError.innerText = "Długość pola email od 5 do 30 znaków";
		emailInput.classList.add("has-error");
		valid = false;
	}
	if (jobSelect.selectedIndex === 0) {
		valid = false;
		jobSelect.classList.add("has-error");
		jobError.innerText = "Pole jest wymagane";
	}
	if (!valid) {
		return false;
	} else {
		return true;
	}

}

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
	if (!value.match(/^[0-9]{2}-[0-9]{3}$/)) {
		return false;
	}
	return true;
}
function checkLetters(value) {
	const nonLetters = /[`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
	const numbers = /[0-9]/;

	if (nonLetters.test(value) || numbers.test(value)) {
		console.log('aaa');
		return false;
	}
	return true;
}

function checkPasswords(passwordInput, repeatPasswordInput) {
	if (passwordInput !== repeatPasswordInput) {
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

function checkPassword(value) {
	const lowerCaseLetters = /[a-z]/g;
	const upperCaseLetters = /[A-Z]/g;
	const numbers = /[0-9]/g;
	if (!value) {
		return false;
	}
	value = value.toString().trim();
	const length = value.length;
	if (length > 20) {
		return false;
	}
	if (length < 6) {
		return false;
	}
	if (!value.match(lowerCaseLetters) || !value.match(upperCaseLetters) || !value.match(numbers)) {
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
function checkMaxLength(value, max) {

	value = value.toString().trim();
	const length = value.length;
	if (max && length > max) {
		return false;
	}
	return true;
}

function checkBirthDate(value) {
	var birthdate;
	var dtDOB;
	console.log(value);
	if (!value) {
		return false;
	}
	const regex = /(\d{4})-(\d{2})-(\d{2})/;
	if (regex.test(value)) {
		var birthdate = value.split("-");
		var dtDOB = new Date(birthdate[0], birthdate[1] - 1, birthdate[2]);

	} else {
		birth_dateError.innerText = "Data niepoprawna";
		return false;
	}

	var now = new Date();

	birth_dateError.innerHTML = "Osoba nie jest pełnoletnia";
	if (now.getFullYear() - dtDOB.getFullYear() < 18) {
		console.log(now.getFullYear() - dtDOB.getFullYear());
		return false;
	}

	if (now.getFullYear() - dtDOB.getFullYear() == 18) {

		if (now.getMonth() < dtDOB.getMonth()) {
			return false;
		}
		if (now.getMonth() == dtDOB.getMonth()) {
			if (now.getDate() < dtDOB.getDate()) {
				return false;
			}
		}
	}
	console.log(dtDOB.getFullYear());
	if ((now.getFullYear() - dtDOB.getFullYear()) > 90) {
		console.log(now.getFullYear() - dtDOB.getFullYear())
		birth_dateError.innerHTML = "Osoba nie może mieć więcej niż 90 lat";
		return false;
	}
	birth_dateError.innerHTML = "";
	return true;
}
function validateEmail(mail) {
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)) {
		return (true)
	}
	console.log("email is incorrect");
	return (false)
}


function ifLetters(value) {
	let regex = /^\d*$/
	if (regex.test(value)) {
		return true;
	}
	return false;
}



