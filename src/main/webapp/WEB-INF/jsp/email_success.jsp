<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
<link href="static_files/css/lib/email/email.css" rel="stylesheet"
	type="text/css">
<script src="static_files/js/lib/validation.js"></script>
<!-- Charts -->
<!--  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->

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
								<div class="col-lg-4">
									<a type="button" class="btn btn-primary btn-block" id="backButton" href="<c:url value='/email'/>">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-arrow-left"
											viewBox="0 0 16 16">
  <path fill-rule="evenodd"
												d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
</svg>
										Wyślij nowe powiadomienie
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="card-approval">
					<div class="main">

						<img class="email_sent"
							src="<c:url value='/static_files/images/email_sent.png'/>" />
						<h1 class="email_sent_text">Twój email został wysłany</h1>

					</div>
				</div>
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