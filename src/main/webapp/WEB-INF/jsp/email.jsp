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
<script src="static_files/js/lib/validation/validation1.js"></script>

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
								<h3>Wysyłanie maila</h3>
							</div>
						</div>
					</div>
					<!-- /# column -->
				</div>

				<div class="card-approval">
					<div class="main">
						<div class="container-fluid ">
							<!-- /# row -->
							<div class="inner contact">
								<!-- Form Area -->
								<div class="contact-form container">

									<!-- Form -->
									<form:form id="contact-us" method="post" action="email"
										modelAttribute="email"  onsubmit="return validateEmailForm();"
										novalidate="novalidate">
										<div class="col">

											<div class="wow animated slideInLeft" data-wow-delay=".5s">

												<input type="text" name="name" class="form" id="sender"
													placeholder="Od: ${sender}" disabled /> <br>

												<form:input path="recepient" type="email" id="emailInput"
													class="form" placeholder="Odbiorca (Adres e-mail)" />
												<form:errors path="recepient" class="text-danger" />
												<p class="text-danger" id="emailError"></p>


												<form:input path="subject" type="text" id="subject"
													class="form" placeholder="Tytuł" />
													<form:errors path="subject" class="text-danger" />
													<p class="text-danger" id="titleError"></p>
											</div>

											<div class="row">
												<div class=" animated slideInRight col" data-wow-delay=".5s">
													<!-- Message -->
													<form:textarea path="message" name="message"
														id="messageInput" class="form textarea" rows="6"
														placeholder="Wpisz tylko treść powiadomienia (Stopka będzie dodana automatycznie)
														
Pozdrawiam, ${sender}"></form:textarea>
													<form:errors path="message" class="text-danger" />
													<p class="text-danger" id="messageError"></p>

												</div>
											</div>
											<!-- Bottom Submit -->
											<div class="fullwidth row">
												<!-- <div class="col"> -->

												<form:button type="submit" id="submit" name="submit"
													class="form-btn semibold">Wyślij</form:button>
												<!-- </div> -->
												<!-- End Bottom Submit -->
											</div>
										</div>
									</form:form>
								</div>
							</div>
						</div>
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

	<script
		src="static_files/js/lib/circle-progress/circle-progress.min.js"></script>
	<script
		src="static_files/js/lib/circle-progress/circle-progress-init.js"></script>
	<script
		src="static_files/js/lib/sparklinechart/jquery.sparkline.min.js"></script>
	<script src="static_files/js/lib/sparklinechart/sparkline.init.js"></script>


</body>

</html>