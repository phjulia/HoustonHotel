

$(document).ready(function() {
	$('[data-toggle="tooltip"]').tooltip();
});


function c(passed_month, passed_year, calNum) {
	var calendar = calNum == 0 ? calendars.cal1 : calendars.cal2;
	makeWeek(calendar.weekline);
	calendar.datesBody.empty();
	var calMonthArray = makeMonthArray(passed_month, passed_year);
	var r = 0;
	var u = false;
	while (!u) {
		if (daysArray[r] == calMonthArray[0].weekday) { u = true }
		else {
			calendar.datesBody.append('<div class="blank"></div>');
			r++;
		}
	}
	for (var cell = 0; cell < 42 - r; cell++) { // 42 date-cells in calendar
		if (cell >= calMonthArray.length) {
			calendar.datesBody.append('<div class="blank"></div>');
		} else {
			var shownDate = calMonthArray[cell].day;
			//=== iter_date not needed after "today" is found
			var iter_date = new Date(passed_year, passed_month, shownDate);
			if (
				(
					(shownDate != today.getDate() && passed_month == today.getMonth())
					|| passed_month != today.getMonth()
				)
				&& iter_date < today) {
				var m = '<div class="past-date">';
			} else {
				var m = checkToday(iter_date) ? '<div class="today">' : "<div>";
			}
			calendar.datesBody.append(m + shownDate + "</div>");
		}
	}

	// var color = o[passed_month];
	calendar.calHeader.find("h2").text(i[passed_month] + " " + passed_year);
	//.css("background-color",color)
	//.find("h2").text(i[passed_month]+" "+year);

	// find elements (dates) to be clicked on each time
	// the calendar is generated

	//clickedElement = bothCals.find(".calendar_content").find("div");
	var clicked = false;
	selectDates(selected);

	clickedElement = calendar.datesBody.find('div');
	clickedElement.on("click", function() {
		clicked = $(this);
		if (clicked.hasClass('past-date')) { return; }
		var whichCalendar = calendar.name;
		console.log(whichCalendar);
		// Understading which element was clicked;
		// var parentClass = $(this).parent().parent().attr('class');
		if (firstClick && secondClick) {
			thirdClicked = getClickedInfo(clicked, calendar);
			var firstClickDateObj = new Date(firstClicked.year,
				firstClicked.month,
				firstClicked.date);
			var secondClickDateObj = new Date(secondClicked.year,
				secondClicked.month,
				secondClicked.date);
			var thirdClickDateObj = new Date(thirdClicked.year,
				thirdClicked.month,
				thirdClicked.date);
			if (secondClickDateObj > thirdClickDateObj
				&& thirdClickDateObj > firstClickDateObj) {
				secondClicked = thirdClicked;
				// then choose dates again from the start :)
				bothCals.find(".calendar_content").find("div").each(function() {
					$(this).removeClass("selected");
				});
				selected = {};
				selected[firstClicked.year] = {};
				selected[firstClicked.year][firstClicked.month] = [firstClicked.date];
				selected = addChosenDates(firstClicked, secondClicked, selected);
			} else { // reset clicks
				selected = {};
				firstClicked = [];
				secondClicked = [];
				firstClick = false;
				secondClick = false;
				bothCals.find(".calendar_content").find("div").each(function() {
					$(this).removeClass("selected");
				});
			}
		}
		if (!firstClick) {
			firstClick = true;
			firstClicked = getClickedInfo(clicked, calendar);
			selected[firstClicked.year] = {};
			selected[firstClicked.year][firstClicked.month] = [firstClicked.date];
		} else {

			secondClick = true;
			secondClicked = getClickedInfo(clicked, calendar);



			// what if second clicked date is before the first clicked?
			var firstClickDateObj = new Date(firstClicked.year,
				firstClicked.month,
				firstClicked.date);
			var secondClickDateObj = new Date(secondClicked.year,
				secondClicked.month,
				secondClicked.date);

			if (firstClickDateObj > secondClickDateObj) {

				var cachedClickedInfo = secondClicked;
				secondClicked = firstClicked;
				firstClicked = cachedClickedInfo;
				selected = {};
				selected[firstClicked.year] = {};
				selected[firstClicked.year][firstClicked.month] = [firstClicked.date];

			} else if (firstClickDateObj.getTime() ==
				secondClickDateObj.getTime()) {
				selected = {};
				firstClicked = [];
				secondClicked = [];
				firstClick = false;
				secondClick = false;
				$(this).removeClass("selected");
			}


			// add between dates to [selected]
			selected = addChosenDates(firstClicked, secondClicked, selected);

			//show pop-up
			let firstClickedDate = formatDate(firstClickDateObj);
			let secondClickedDate = formatDate(secondClickDateObj);
			console.log('first clicked: ');
			console.log(firstClickedDate);
			console.log('Second clicked: ');
			console.log(secondClickedDate);

			$(dateFrom).val(firstClickedDate);
			$(dateTo).val(secondClickedDate);

			$('.modal').modal('show');


		}
		selectDates(selected);

	});

}
/* * * * * * * * * * * * * * * * * * * * FORMAT DATE  * * * * * * * * * * * * * * * * * * * * * * * * */
/*function formatDate(date) {
	return [
		padTo2Digits(date.getDate()),
		padTo2Digits(date.getMonth() + 1),
		date.getFullYear(),
		
	].join('/');
}*/
function formatDate(date) {
	return [
		date.getFullYear(),
		padTo2Digits(date.getMonth() + 1),
		padTo2Digits(date.getDate()),

	].join('-');
}
function padTo2Digits(num) {
	return num.toString().padStart(2, '0');
}

function selectDates(selected) {
	console.log(selected);
	if (!$.isEmptyObject(selected)) {
		var dateElements1 = datesBody1.find('div');
		var dateElements2 = datesBody2.find('div');

		function highlightDates(passed_year, passed_month, dateElements) {

			if (passed_year in selected && passed_month in selected[passed_year]) {
				var daysToCompare = selected[passed_year][passed_month];

				for (var d in daysToCompare) {
					dateElements.each(function(index) {
						if (parseInt($(this).text()) == daysToCompare[d]) {
							$(this).addClass('selected');
							//console.log("Adding selected class");
						}
					});
				}

			}
		}

		highlightDates(year, month, dateElements1);
		highlightDates(nextYear, nextMonth, dateElements2);
	}
}

function makeMonthArray(passed_month, passed_year) { // creates Array specifying dates and weekdays
	var e = [];
	for (var r = 1; r < getDaysInMonth(passed_year, passed_month) + 1; r++) {
		e.push({
			day: r,
			// Later refactor -- weekday needed only for first week
			weekday: daysArray[getWeekdayNum(passed_year, passed_month, r)]
		});
	}
	return e;
}
function makeWeek(week) {
	week.empty();
	for (var e = 0; e < 7; e++) {
		week.append("<div>" + daysArray[e].substring(0, 3) + "</div>")
	}
}

function getDaysInMonth(currentYear, currentMon) {
	return (new Date(currentYear, currentMon + 1, 0)).getDate();
}
function getWeekdayNum(e, t, n) {
	return (new Date(e, t, n)).getDay();
}
function checkToday(e) {
	var todayDate = today.getFullYear() + '/' + (today.getMonth() + 1) + '/' + today.getDate();
	var checkingDate = e.getFullYear() + '/' + (e.getMonth() + 1) + '/' + e.getDate();
	return todayDate == checkingDate;

}
function getAdjacentMonth(curr_month, curr_year, direction) {
	var theNextMonth;
	var theNextYear;
	if (direction == "next") {
		theNextMonth = (curr_month + 1) % 12;
		theNextYear = (curr_month == 11) ? curr_year + 1 : curr_year;
	} else {
		theNextMonth = (curr_month == 0) ? 11 : curr_month - 1;
		theNextYear = (curr_month == 0) ? curr_year - 1 : curr_year;
	}
	return [theNextMonth, theNextYear];
}
function b() {
	today = new Date;
	year = today.getFullYear();
	month = today.getMonth();
	var nextDates = getAdjacentMonth(month, year, "next");
	nextMonth = nextDates[0];
	nextYear = nextDates[1];
}

var e = 480;

var today;
var year,
	month,
	nextMonth,
	nextYear;

var r = [];
var i = ["Styczeń", "Luty", "Marzec", "Kwiecień", "Maj",
	"Czerwiec", "Lipiec", "Sierpień", "Wrzesień", "Październik",
	"Listopad", "Grudzień"];
var daysArray = ["Niedziela", "Poniedziałek", "Wtorek",
	"Środa", "Czwartek", "Piątek", "Sobota"];
var o = ["#16a085", "#1abc9c", "#c0392b", "#27ae60",
	"#FF6860", "#f39c12", "#f1c40f", "#e67e22",
	"#2ecc71", "#e74c3c", "#d35400", "#2c3e50"];

var cal1 = $("#calendar_first");
var calHeader1 = cal1.find(".calendar_header");
var weekline1 = cal1.find(".calendar_weekdays");
var datesBody1 = cal1.find(".calendar_content");

var cal2 = $("#calendar_second");
var calHeader2 = cal2.find(".calendar_header");
var weekline2 = cal2.find(".calendar_weekdays");
var datesBody2 = cal2.find(".calendar_content");

var bothCals = $(".calendar");

var switchButton = bothCals.find(".calendar_header").find('.switch-month');

var calendars = {
	"cal1": {
		"name": "first",
		"calHeader": calHeader1,
		"weekline": weekline1,
		"datesBody": datesBody1
	},
	"cal2": {
		"name": "second",
		"calHeader": calHeader2,
		"weekline": weekline2,
		"datesBody": datesBody2
	}
}


var clickedElement;
var firstClicked,
	secondClicked,
	thirdClicked;
var firstClick = false;
var secondClick = false;
var selected = {};

b();
c(month, year, 0);
c(nextMonth, nextYear, 1);
switchButton.on("click", function() {
	var clicked = $(this);
	var generateCalendars = function(e) {
		var nextDatesFirst = getAdjacentMonth(month, year, e);
		var nextDatesSecond = getAdjacentMonth(nextMonth, nextYear, e);
		month = nextDatesFirst[0];
		year = nextDatesFirst[1];
		nextMonth = nextDatesSecond[0];
		nextYear = nextDatesSecond[1];

		c(month, year, 0);
		c(nextMonth, nextYear, 1);
	};
	if (clicked.attr("class").indexOf("left") != -1) {
		generateCalendars("previous");
	} else { generateCalendars("next"); }
	clickedElement = bothCals.find(".calendar_content").find("div");
	console.log("checking");
});


//  Click picking stuff
function getClickedInfo(element, calendar) {
	var clickedInfo = {};
	var clickedCalendar,
		clickedMonth,
		clickedYear;
	clickedCalendar = calendar.name;
	//console.log(element.parent().parent().attr('class'));
	clickedMonth = clickedCalendar == "first" ? month : nextMonth;
	clickedYear = clickedCalendar == "first" ? year : nextYear;
	clickedInfo = {
		"calNum": clickedCalendar,
		"date": parseInt(element.text()),
		"month": clickedMonth,
		"year": clickedYear
	}
	//console.log(clickedInfo);
	return clickedInfo;
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
function convertToJSONDate(strDate) {
	var splitted = strDate.split(".");
	//var dt = new Date(splitted[2],splitted[0],splitted[1]);
	var newDate = new Date(Date.UTC(splitted[2], splitted[0], splitted[1]));
	return '/Date(' + newDate.getTime() + ')/';
}

/*================================Function to confirm vacation request =============================================*/
function confirmRequest(date_fromJs, date_toJs) {
	var loggedUser = $('#loggedUser').val();
	var vacation = {
		date_from: date_fromJs,
		date_to: date_toJs,
		emp_email: loggedUser
	};
	console.log("*************");
	var requestJSON = JSON.stringify(vacation);
	console.log(requestJSON);
	console.log('request JS friendly date from' + date_fromJs);
	console.log('request JS friendly date to' + date_toJs);
	$.ajax(
		{
			type: "POST",
			contentType: "application/json",
			url: window.location.href,
			data: requestJSON,
			dataType: 'text',
			timeout: 600000,
			success: function() {
				alert("Wniosek o urlop został wysłany do managera");
				window.location.reload();
			},
			error: function(e) {
				console.log(e);
			}
		});

	$('.modal').modal('hide');


}
/*================================Function to dismiss vacation request =============================================*/
function revoke(vac, date_from, date_to) {
	var loggedUser = $('#loggedUser').val();
	var vacation = {
		id: vac,
		date_from: date_from,
		date_to: date_to,
		emp_email: loggedUser
	};
	console.log(vacation);
	var requestJSON = JSON.stringify(vacation);
	console.log(window.location.href + "/revoke");
	$.ajax(
		{
			type: "POST",
			contentType: "application/json",
			url: window.location.href + "/revoke",
			data: requestJSON,
			dataType: 'text',
			timeout: 600000,
			success: function() {
				var toRemove =
					document.getElementById("vacation" + vac);
				toRemove.remove();
				alert("Wniosek został anulowany");
			},
			error: function(e) {
				console.log(e);
			}
		});

	//$("#vacations_div").load(window.location.href + " #vacations_div");
}
function addChosenDates(firstClicked, secondClicked, selected) {
	if (secondClicked.date > firstClicked.date ||
		secondClicked.month > firstClicked.month ||
		secondClicked.year > firstClicked.year) {

		var added_year = secondClicked.year;
		var added_month = secondClicked.month;
		var added_date = secondClicked.date;
		//console.log(selected);

		if (added_year > firstClicked.year) {
			// first add all dates from all months of Second-Clicked-Year
			selected[added_year] = {};
			selected[added_year][added_month] = [];
			for (var i = 1;
				i <= secondClicked.date;
				i++) {
				selected[added_year][added_month].push(i);
			}

			added_month = added_month - 1;
			//console.log(added_month);
			while (added_month >= 0) {
				selected[added_year][added_month] = [];
				for (var i = 1;
					i <= getDaysInMonth(added_year, added_month);
					i++) {
					selected[added_year][added_month].push(i);
				}
				added_month = added_month - 1;
			}

			added_year = added_year - 1;
			added_month = 11; // reset month to Dec because we decreased year
			added_date = getDaysInMonth(added_year, added_month); // reset date as well

			// Now add all dates from all months of inbetween years
			while (added_year > firstClicked.year) {
				selected[added_year] = {};
				for (var i = 0; i < 12; i++) {
					selected[added_year][i] = [];
					for (var d = 1; d <= getDaysInMonth(added_year, i); d++) {
						selected[added_year][i].push(d);
					}
				}
				added_year = added_year - 1;
			}
		}

		if (added_month > firstClicked.month) {
			if (firstClicked.year == secondClicked.year) {
				//console.log("here is the month:",added_month);
				selected[added_year][added_month] = [];
				for (var i = 1;
					i <= secondClicked.date;
					i++) {
					selected[added_year][added_month].push(i);
				}
				added_month = added_month - 1;
			}
			while (added_month > firstClicked.month) {
				selected[added_year][added_month] = [];
				for (var i = 1;
					i <= getDaysInMonth(added_year, added_month);
					i++) {
					selected[added_year][added_month].push(i);
				}
				added_month = added_month - 1;
			}
			added_date = getDaysInMonth(added_year, added_month);
		}

		for (var i = firstClicked.date + 1;
			i <= added_date;
			i++) {
			selected[added_year][added_month].push(i);
		}
	}
	return selected;
}
