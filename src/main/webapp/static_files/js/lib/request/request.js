let clickedButtonId;
let request;
function assignId(id){
request= id;
}

function reject(id,requestor,date_from,date_to) {

	var request = {
		id: id,
		commentary: $('#reject').val(),
		requestor: {
			email: requestor
		},
		vacation: {
			date_from: date_from,
			date_to: date_to
		}
	};

	if (validateMessage()) {
		console.log(request);
		var requestJSON = JSON.stringify(request);

		$.ajax(
			{
				type: "POST",
				contentType: "application/json",
				url: window.location.href + "/reject",
				data: requestJSON,
				dataType: 'text',
				timeout: 600000,

				success: function() {

					alert("Wniosek został odrzucony");
					$('#pop-up').modal('hide');
					window.location.reload();
				},
				error: function(error) {
					const messageInput = document.getElementById("reject");
					const messageError = document.getElementById("error");//messageError
					messageError.innerText = "Pole nie może być puste";
					messageInput.classList.add("has-error");
				}
			});

	}


}


function approve(id,requestor,date_from,date_to) {
	var request = {
		id: id,
		requestor:
			{ email: requestor },
		vacation: { date_from: date_from, date_to: date_to}

	};
	console.log(request);
	var requestJSON = JSON.stringify(request);

	$.ajax(
		{
			type: "POST",
			contentType: "application/json",
			url: window.location.href + "/approve",
			data: requestJSON,
			dataType: 'text',
			timeout: 600000,
			success: function() {
				alert("Wniosek został zaakceptowany");
				window.location.reload();
			},
			error: function(e) {
				console.log(e);
			}
		});


};
/* * * * * * * * * * * * check Message Text field* * * * * * * * * * * * * * */
function validateMessage() {
	const messageInput = document.getElementById("reject");
	const messageError = document.getElementById("error");//messageError
	resetErrors([messageInput], [messageError]);
	if (!checkRequired(messageInput.value)) {
		messageError.innerText = "Pole nie może być puste";
		messageInput.classList.add("has-error");
		return false;
	} else if (!checkMaxLength(messageInput.value, 150)) {
		messageError.innerText = "Max długość pola 150 znaków";
		messageInput.classList.add("has-error");
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
function checkRequired(value) {
	if (!value) {
		return false;
	}
	value = value.toString().trim();
	if (value === "") {
		console.log("in second if");
		return false;
	}
	return true;
}
function resetErrors(inputs, errorText) {
	for (let i = 0; i < inputs.length; i++) {
		inputs[i].classList.remove("has-error");
	}
	for (let i = 0; i < errorText.length; i++) {
		errorText[i].innerText = "";
	}
}