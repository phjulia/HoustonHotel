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

<!-- Calender -->
<link
	href="<c:url value='/static_files/css/lib/calendar/fullcalendar.css' />"
	rel="stylesheet" />

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
<link href="<c:url value='/static_files/css/lib/vacation_list/vacations_filtered.css'/>"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link rel="stylesheet"
	href="<c:url value='/static_files/js/lib/vacations/src/calendarjs.css' />" />
<script
	src="<c:url value='/static_files/js/lib/vacations/src/calendarjs.js' />"></script>
<script
	src="<c:url value='/static_files/js/lib/calendar/jquery.min.js' />"></script>

</head>

<body>
	<jsp:include page="navigation.jsp" />
	<jsp:include page="header.jsp" />



	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">
				<div class="btn-block">
					<a type="button" class="btn btn-primary" id="backButton"
						href="<c:url value='/vacations'/>"> <svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
								d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
</svg> Wróc do kalendarza
					</a>
				</div>
			</div>
			<div>
				<h2 class="heading-section" style="margin-left:20px;">Kalendarz urlopów</h2>
				<div style="width: 100%; display: flex;">
					<table id="responstable">
						<thead>
							<tr>
								<th>Pracownik</th>
								<th>Data początku urlopu</th>
								<th>Data końca urlopu</th>
							</tr>
						</thead>

						<c:forEach var="vacation" items="${vacationsFiltered}">

							<tr>
								<td data-label="Pracownik">${vacation.emp}</td>
								<td data-label="Początek urlopu">${vacation.date_from}</td>
								<td data-label="Koniec urlopu">${vacation.date_to}</td>
							</tr>
						</c:forEach>


					</table>
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