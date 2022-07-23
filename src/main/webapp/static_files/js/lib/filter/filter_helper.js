function setParam(name, value) {
	var href = window.location.href;
	var regex = new RegExp("[&\\?]" + name + "=");
	if (regex.test(href)) {
		regex = new RegExp("([&\\?])" + name + "=\\d+\\d+");
		var match = regex.exec(href);
		console.log(match[2]);

		window.location.href = href.replace(regex, "$1" + name + "=" + value);
	}
	else {
		if (href.indexOf("?") > -1)
			window.location.href = href + "&" + name + "=" + value;
		else
			window.location.href = href + "?" + name + "=" + value;
	}
}
function setPrice(minPriceName, minPriceInput, maxPriceName, maxPriceInput) {
	const priceError = document.getElementById("priceError");
	console.log(minPriceInput.value);
	var minPrice;
	var maxPrice;
	let valid = true;
	if (maxPriceInput.value.trim() == '') {
		maxPriceInput.value = 1000000;
		maxPrice=maxPriceInput.value;
	}
	if (minPriceInput.value.trim() == 0) {
		minPriceInput.value = 0;
		minPrice=minPriceInput.value;
	}

	 minPrice = parseInt(minPriceInput.value);
	 maxPrice = parseInt(maxPriceInput.value);
	
	resetErrors([minPriceInput, maxPriceInput],priceError);


	if (minPrice < 0) {
		priceError.innerText = "Wartość nie może być niegatywną";
		minPriceInput.classList.add("has-error");
		valid = false;
		return false;
	}
	if (maxPrice < 0) {
		priceError.innerText = "Wartość nie może być niegatywną";
		maxPriceInput.classList.add("has-error");
		valid = false;
		return false;
	}
	if (minPrice > maxPrice) {
		console.log(minPrice);
		console.log(maxPrice);
		priceError.innerText = "Wartość 'od' nie może być większa niż 'do'";
		minPriceInput.classList.add("has-error");
		maxPriceInput.classList.add("has-error");
		valid = false;
		return false;
	}
		
	if (valid) {
		document.getElementById('maxPrice').value = maxPrice;
		document.getElementById('minPrice').value = minPrice;
		var href = window.location.href;
		var regex = new RegExp("[&\\?]" + minPriceName + "=");
		//var regex1 = new RegExp("[&\\?]" + maxPriceName + "=");
		if (regex.test(href)) {
			regex = new RegExp("([&\\?])" + minPriceName + "=(\\d+)" + "&" + maxPriceName + "=(\\d+)");
			window.location.href = href.replace(regex, "$1" + minPriceName + "=" + minPrice + "&" + maxPriceName + "=" + maxPrice);

		} else {
			if (href.indexOf("?") > -1) {
				window.location.href = href + "&" + minPriceName + "=" + minPrice + "&" + maxPriceName + "=" + maxPrice;
			} else {
				window.location.href = href + "?" + minPriceName + "=" + minPrice + "&" + maxPriceName + "=" + maxPrice;
			}
		}

	}
}
function setJobParam(name, value) {
	var href = window.location.href;
	var regex = new RegExp("[&\\?]" + name + "=");
	if (regex.test(href)) {

		regex = new RegExp("([&\\?])" + name + "=.+");
		window.location.href = href.replace(regex, "$1" + name + "=" + value);
	}
	else {
		if (href.indexOf("?") > -1)
			window.location.href = href + "&" + name + "=" + value;
		else
			window.location.href = href + "?" + name + "=" + value;
	}
	document.getElementById('job').value = 3;
}
function resetErrors(inputs, errorText) {
	for (let i = 0; i < inputs.length; i++) {
		inputs[i].classList.remove("has-error");
	}
	for (let i = 0; i < errorText.length; i++) {
		errorText[i].innerText = "";
	}
}