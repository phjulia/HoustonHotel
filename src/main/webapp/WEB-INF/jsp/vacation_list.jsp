<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="pl-PL">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Kalendarz</title>

<!-- Toastr -->
<link
	href="<c:url value='/static_files/css/lib/toastr/toastr.min.css' />"
	rel="stylesheet">
<!-- Sweet Alert -->
<link
	href="<c:url value='/static_files/css/lib/sweetalert/sweetalert.css' />"
	rel="stylesheet">
<!-- Range Slider -->
<link
	href="<c:url value='/static_files/css/lib/rangSlider/ion.rangeSlider.css' />"
	rel="stylesheet">
<link
	href="<c:url value='/static_files/css/lib/rangSlider/ion.rangeSlider.skinFlat.css' />"
	rel="stylesheet">

<!-- Nestable -->
<link
	href="<c:url value='/static_files/css/lib/nestable/nestable.css' />"
	rel="stylesheet">
<!-- JsGrid -->
<link
	href="<c:url value='/static_files/css/lib/jsgrid/jsgrid-theme.min.css' />"
	rel="stylesheet" />
<link
	href="<c:url value='/static_files/css/lib/jsgrid/jsgrid.min.css" type="text/css' />"
	rel="stylesheet" />

<link
	href="<c:url value='/static_files/css/lib/data-table/buttons.bootstrap.min.css' />"
	rel="stylesheet" />
<!-- Calender 2 -->
<link
	href="<c:url value='/static_files/css/lib/calendar2/pignose.calendar.min.css' />"
	rel="stylesheet">
<!-- Weather Icon -->
<link href="<c:url value='/static_files/css/lib/weather-icons.css' />"
	rel="stylesheet" />
<!-- Owl Carousel -->
<link
	href="<c:url value='/static_files/css/lib/owl.carousel.min.css' />"
	rel="stylesheet" />
<link
	href="<c:url value='/static_files/css/lib/owl.theme.default.min.css' />"
	rel="stylesheet" />
<!-- Select2 -->
<link
	href="<c:url value='/static_files/css/lib/select2/select2.min.css' />"
	rel="stylesheet">
<link
	href="<c:url value='/static_files/css/lib/vacation_list/vacations_filtered.css'/>"
	rel="stylesheet">

<!-- Common -->
<link
	href="<c:url value='/static_files/css/lib/font-awesome.min.css' />"
	rel="stylesheet">
<link href="<c:url value='/static_files/css/lib/themify-icons.css' />"
	rel="stylesheet">
<link href="<c:url value='/static_files/css/lib/menubar/sidebar.css' />"
	rel="stylesheet">
<link href="<c:url value='/static_files/css/lib/bootstrap.min.css' />"
	rel="stylesheet">
<link href="<c:url value='/static_files/css/lib/helper.css' />"
	rel="stylesheet">
<link href="<c:url value='/static_files/css/style.css' />"
	rel="stylesheet">
<link
	href="<c:url value='/static_files/css/lib/vacation_list/vacations_filtered.css'/>"
	rel="stylesheet">
<script
	src="<c:url value='/static_files/js/lib/validation/validation1.js' /> "></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link rel="stylesheet"
	href="<c:url value='/static_files/js/lib/vacations/src/calendarjs.css' />" />
<script
	src="<c:url value='/static_files/js/lib/vacations/src/calendarjs.js' />"></script>
<script
	src="<c:url value='/static_files/js/lib/calendar/jquery.min.js' />"></script>
<script>
	var events = [];
	var colors = [ "#00FFFF", "#FF00FF", "#00FF00", "#E9967A", "#FFA500",
			"#FFD700", "#00FA9A", "#00BFFF", "#9400D3", "#FF1493", "#FF69B4",
			"#FF0000", "#8A2BE2", "#40E0D0", "#a83277", "#b8eff5", "#8affc4",
			"#ff8ad8", "#eec9d2", "#4a4e4d", "#fec8c1", "#fad9c1", "#7bc043",
			"#008744", "#a8e6cf" ]
	$(document).ready(function() {
		console.log("in the ready");
		var servletUrl = window.location.href + "/get";
		$.getJSON(servletUrl, function(data) {
			console.log("in the get");
			$.each(data, function(key, val) {
				events.push({
					from : val.date_from,
					to : val.date_to,
					title : val.emp,
					isAllDayEvent : true,
					color : colors[Math.floor(Math.random() * colors.length)],
					colorText : "black",

				}

				);
				console.log(colors[Math.floor(Math.random() * colors.length)]);
				//document.getElementsByTagName("html")[0].style.visibility = "visible";
			});

			var calendarInstance = new calendarJs("myCalendar", {
				exportEventsEnabled : true,
				manualEditingEnabled : false,
				showDayNumberOrdinals : false,
				showTimesInMainCalendarEvents : false,
				minimumDayHeight : 80,
				showExtraToolbarButtons : false,
				tooltipsEnabled : true,
				eventTooltipDelay : 10,
				fullScreenModeEnabled : false,

			});

			console.log(events);
			calendarInstance.addEvents(events);
		});
	});
</script>
</head>

<body>
	<jsp:include page="navigation.jsp" />
	<jsp:include page="header.jsp" />



	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">
				<form method="POST" onsubmit="return validateVacationsFilter();" novalidate="novalidate">
					<div class="row">
						<h5 style="margin: 10px;">Zobacz listę urlopów w zakresie
							dat:</h5>
					</div>
					<div class="row">


						<div class="col-lg-3 date">
							<label>Od: </label>
							<input type="date" name="dateFrom" id="dateFrom" />
						</div>
						<div class="col-lg-3 date">
						<label>Do: </label>
							<input type="date" name="dateTo" id="dateTo" />
						</div>



						<div class="col-lg-2">

							<button id="filter" type="submit"
						
								class="btn btn-primary btn-block" style="width: 100%;">Filtruj</button>
						</div>


					</div>
					<div class="row" style="margin:0px; height:10px;">
						<div class="col-lg-6">
							<p class="text-danger" id="filterError"></p>
						</div>
					</div>
				</form>
			</div>
			<div class="calendarDiv">

				<h2 class="heading-section">Kalendarz urlopów</h2>
				<div style="width: 100%; display: flex;">
					<div id="myCalendar"></div>

				</div>
			</div>



			<script
				src="<c:url value='/static_files/js/lib/calendar/popper.js' />"></script>
			<script
				src="<c:url value='/static_files/js/lib/calendar/bootstrap.min.js' />"></script>
			<script
				src="<c:url value='/static_files/js/lib/vacations/main.js' />"></script>




			<!-- jquery vendor -->
			<script src="<c:url value='/static_files/js/lib/jquery.min.js' />"></script>
			<script
				src="<c:url value='/static_files/js/lib/jquery.nanoscroller.min.js' />"></script>
			<script
				src="<c:url value='/static_files/js/lib/menubar/sidebar.js' />"></script>
			<script
				src="<c:url value='/static_files/js/lib/preloader/pace.min.js' />"></script>
			<script src="<c:url value='/static_files/js/lib/bootstrap.min.js' />"></script>
			<script src="<c:url value='/static_files/js/scripts.js' />"></script>

			<script
				src="<c:url value='/static_files/js/lib/jquery-ui/jquery-ui.min.js' />"></script>
			<script src="<c:url value='/static_files/js/lib/moment/moment.js' />"></script>
			<script
				src="<c:url value='/static_files/js/lib/calendar/fullcalendar.min.js' />"></script>
			<script
				src="<c:url value='/static_files/js/lib/calendar/fullcalendar-init.js' />"></script>
			<!-- scripit init-->
</body>

</html>