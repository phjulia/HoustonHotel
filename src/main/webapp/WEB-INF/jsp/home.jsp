<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>


<html xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="https://www.thymeleaf.org/thymeleaf-extras-springsecurity5"
	lang="pl-PL">

<head>
<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>System do zarządzania hotelem</title>
<link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
<link href="static_files/css/lib/calendar2/pignose.calendar.min.css"
	rel="stylesheet" type="text/css">
<link href="static_files/css/lib/room/room_list.css" rel="stylesheet"
	type="text/css">
<link href="static_files/css/lib/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="static_files/css/lib/themify-icons.css" rel="stylesheet"
	type="text/css">
<link href="static_files/css/lib/owl.carousel.min.css" rel="stylesheet"
	type="text/css">
<link href="static_files/css/lib/owl.theme.default.min.css"
	rel="stylesheet" type="text/css">
<!--   <link href="static_files/css/lib/weather-icons.css"  rel="stylesheet" type="text/css"> -->
<link href="static_files/css/lib/menubar/sidebar.css" rel="stylesheet"
	type="text/css">
<link href="static_files/css/lib/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="static_files/css/lib/helper.css" rel="stylesheet"
	type="text/css">
<link href="static_files/css/style.css" rel="stylesheet" type="text/css">
<link href="static_files/css/lib/home.css" rel="stylesheet"
	type="text/css">
<!-- Charts -->
<!--  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->

<script src="https://cdn.anychart.com/js/8.0.1/anychart-core.min.js"></script>
<script src="https://cdn.anychart.com/js/8.0.1/anychart-pie.min.js"></script>
<script src="static_files/js/lib/charts.js"></script>

</head>

<body>

	<jsp:include page="navigation.jsp" />
	<jsp:include page="header.jsp" />


	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">
				<div class="row">
					<div class="col p-l-0 title-margin-left">
						<div class="page-header">
							<div class="page-title">
								<ol class="breadcrumb">
								</ol>
							</div>
						</div>
					</div>
					<!-- /# column -->
				</div>
				<!-- /# row -->
				<section id="main-content">

					<div class="row">
						<div class="col-lg-7">
							<div class="card">
								<script type="text/javascript"
									src="https://www.google.com/jsapi"></script>
								<div class="col">
									<h5>Pokoje</h5>
									<input type="hidden" id="occupiedRooms" name="occupiedRooms"
										value="${occupiedRooms}"> <input type="hidden"
										id="availableRooms" name="availableRooms"
										value="${availableRooms}"> <input type="hidden"
										id="inactiveRooms" name="unavailableRooms"
										value="${inactiveRooms}">
									<!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->
									<div id="piechart"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-5">
							<div class="card-charts">

								<div id="counterDiv">
									<h5>Liczba rezerwacji w tym miesiącu:</h5>
									<br>
									<p id="thisMonth">
										<c:out value="${thisMonth}" />
									</p>
									<br>
									<h5>Liczba rezerwacji w poprzednim miesiącu:</h5>
									<p id="lastMonth">
										<c:out value="${lastMonth}" />
									</p>
								</div>
							</div>

						</div>
					<security:authorize access="hasAnyAuthority('Recepcjonista','Manager')">
							<div class="row" id="reserv">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-title pr">
											<h5>Ostanie rezerwacje</h5>

										</div>
										<div class="card-body">
											<div class="table-responsive">
												<table id="responstable">
													<thead>
														<tr>
															<th>Data i czas rezerwacji</th>
															<th>Numer rezerwacji</th>
															<th>Termin</th>
															<th>Cena rezerwacji</th>
															<th>Numer pokoju</th>
															<th>Gość</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="booking" items="${latestBookings}">
															<tr>
																<td data-label="Data rezerwacji">${booking.created_date}</td>
																<td data-label="Numer rezerwacji">${booking.id}</td>
																<td data-label="Termin rezerwacji">${booking.booking_date}</td>
																<td data-label="Cena">${booking.booking_price}</td>
																<td data-label="Numer pokoju">${booking.roomNum}</td>
																<td data-label="Gość">${booking.guest_name}</td>
															</tr>
														</c:forEach>
													</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						</security:authorize>
					</div>
					
					<div class="row">
						<div class="col-lg-4">
							<div class="card">
								<div class="card-body">
									<div class="year-calendar"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-7">
							<div class="card-charts">

								<div id="counterDiv">
									<h5>Całkowita liczba rezerwacji w hotelu HoustonHotel za czas istnienia hotelu:</h5>
									<br>
									<p id="allBookings">
										<c:out value="${allBookings}" />
									</p>
									
								</div>
							</div>

						</div>
						<%-- <div 
						class="col-lg-7">
							<div class="card">
								<div class="col">
									<!-- <div id="piechart1">
									</div> -->
								</div>
							</div>
						</div> --%>
</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="footer">
									<p>2022 Hotel Management System</p>
								</div>
							</div>
						</div>
				</section>
			</div>
		</div>
	</div>
	<!-- jquery vendor -->
	<script src="static_files/js/lib/jquery.min.js"></script>
	<script src="static_files/js/lib/jquery.nanoscroller.min.js"></script>
	<!-- nano scroller -->
	<script src="static_files/js/lib/menubar/sidebar.js"></script>
	<script src="static_files/js/lib/preloader/pace.min.js"></script>
	<!-- sidebar -->

	<script src="static_files/js/lib/bootstrap.min.js"></script>
	<script src="static_files/js/scripts.js"></script>
	<!-- bootstrap -->

	<script src="static_files/js/lib/calendar-2/moment.latest.min.js"></script>
	<script src="static_files/js/lib/calendar-2/pignose.calendar.min.js"></script>
	<script src="static_files/js/lib/calendar-2/pignose.init.js"></script>


	<!--     <script src="static_files/js/lib/weather/jquery.simpleWeather.min.js"></script>
    <script src="static_files/js/lib/weather/weather-init.js"></script> -->
	<script
		src="static_files/js/lib/circle-progress/circle-progress.min.js"></script>
	<script
		src="static_files/js/lib/circle-progress/circle-progress-init.js"></script>
	<!--     <script src="static_files/js/lib/chartist/chartist.min.js"></script> -->
	<script
		src="static_files/js/lib/sparklinechart/jquery.sparkline.min.js"></script>
	<script src="static_files/js/lib/sparklinechart/sparkline.init.js"></script>
	<!--     <script src="static_files/js/lib/owl-carousel/owl.carousel.min.js"></script>
    <script src="static_files/js/lib/owl-carousel/owl.carousel-init.js"></script> -->
	<script src="static_files/js/dashboard2.js"></script>

</body>

</html>