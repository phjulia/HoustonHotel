<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pl-PL">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Kalendarz</title>

<!-- Toastr -->
<link href="static_files/css/lib/toastr/toastr.min.css" rel="stylesheet">
<!-- Sweet Alert -->
<link href="static_files/css/lib/sweetalert/sweetalert.css"
	rel="stylesheet">
<!-- Range Slider -->
<link href="static_files/css/lib/rangSlider/ion.rangeSlider.css"
	rel="stylesheet">
<link
	href="static_files/css/lib/rangSlider/ion.rangeSlider.skinFlat.css"
	rel="stylesheet">
<!-- Bar Rating -->
<link href="static_files/css/lib/barRating/barRating.css"
	rel="stylesheet">
<!-- Nestable -->
<link href="static_files/css/lib/nestable/nestable.css" rel="stylesheet">
<!-- JsGrid -->
<link href="static_files/css/lib/jsgrid/jsgrid-theme.min.css"
	rel="stylesheet" />
<link href="static_files/css/lib/jsgrid/jsgrid.min.css" type="text/css"
	rel="stylesheet" />
<link href="static_files/css/lib/data-table/buttons.bootstrap.min.css"
	rel="stylesheet" />
<!-- Calender 2 -->
<link href="static_files/css/lib/calendar2/pignose.calendar.min.css"
	rel="stylesheet">
<!-- Weather Icon -->
<link href="static_files/css/lib/weather-icons.css" rel="stylesheet" />
<!-- Owl Carousel -->
<link href="static_files/css/lib/owl.carousel.min.css" rel="stylesheet" />
<link href="static_files/css/lib/owl.theme.default.min.css"
	rel="stylesheet" />
<!-- Select2 -->
<link href="static_files/css/lib/select2/select2.min.css"
	rel="stylesheet">
<!-- Common -->
<link href="static_files/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="static_files/css/lib/themify-icons.css" rel="stylesheet">
<link href="static_files/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="static_files/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="static_files/css/lib/helper.css" rel="stylesheet">
<link href="static_files/css/style.css" rel="stylesheet">

<!-- Calendar  -->
 <link rel="stylesheet"
	href="static_files/css/lib/calendar/calendar_style.css"> 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/3.2.1/jquery.min.js"></script>
</head>

<body>
	<jsp:include page="navigation.jsp" />
	<jsp:include page="header.jsp" />


	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">
				<div class="row">
					<div class="page-header">
						<div class="page-title">
							<h1>
								<span></span>
							</h1>
						</div>
					</div>
				</div>
				<!-- /# column -->
				 <div class="container">
					<div class="modal" tabindex="-1" role="dialog" id="pop-up">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
								<input type="hidden" id="loggedUser" value="${loggedUser}"/>
									<h5 class="modal-title">Wniosek o urlop</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label for="event-start-date" class="col-sm-4 control-label">Od:
										</label>
										<div class="col">
											<input name="event-start-date" type="text"
												class="form-control" disabled="" id="dateFrom">
										</div>
									</div>
									<div class="form-group">
										<label for="event-end-date" class="col-sm-4 control-label">Do:</label>
										<div class="col">
											<input name="event-end-date" type="text" class="form-control"
												disabled="" id="dateTo">
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Anuluj</button>
									<button type="button" class="btn btn-primary" id="save-event"
										onclick="confirmRequest(document.getElementById('dateFrom').value,document.getElementById('dateTo').value);">Zapisz</button>
								</div>
							</div>
						</div>
					</div>

				<div class="row justify-content-center" id="vacations_div">
					<div class="alert alert-info" data-cy="pvt-tab-cal-help">
						<div class="form-group row">
						<input type="hidden" id="loggedUser" value="${loggedUser}"/>

							<div class="col-lg-8">
								Żeby zawnioskować o urlop kliknij w kalendarzu. Twój wniosek
								zostanie rozpatrzony przez managera.<br></br>

								<div class="row">
									<div class="col-sm">
										<h5>Wnioski o urlop</h5>
										<div class="container">
											<div class="row">
												<c:forEach var="vacation" items="${vacations}">

													<div class="col-sm-6" id="vacation${vacation.id}">
														<div class="input-group mb-3">
															<input type="text" class="form-control"
																placeholder="${vacation.date_from} - ${vacation.date_to}"
																aria-label="Recipient's username"
																aria-describedby="basic-addon2" disabled>
															<div class="input-group-append">

																<button class="btn btn-danger" style="margin: 0px;"
																	type="button"
																	onclick="revoke(${vacation.id},'${vacation.date_from}','${vacation.date_to}')">X</button>


															</div>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<span id="r_d"></span>
							</div>
							<div class="col-lg-4">
								Okres wakacyjny: <i><b>08/2021-08/2022</b></i> (20 dni/rok),
								zostało: ${daysLeft}<br></br> Zaakceptowane okresy urlopów:<br>
								<c:forEach var="vacation" items="${approvedVacations}">
									<div class="row">
										<div class="col-sm">
											Od: <b>${vacation.date_from}</b>
										</div>
										<div class="col-sm">
											Do: <b>${vacation.date_to}</b>
										</div>
									</div>

								</c:forEach>

							</div>
						</div>
					</div>
				</div>
				<h2 class="heading-section">Kalendarz</h2>
				<div style="width: 100%; display: flex;">
					<div id="myCalendar"></div>
				</div>
				 <div class="row">
						<div class="col-md-12">
							<div class="calendar-section">
								<div class="row no-gutters">
									<div class="col-md-6">

										<div class="calendar calendar-first" id="calendar_first">
											<div class="calendar_header">
												<button class="switch-month switch-left">
													<i class="fa fa-chevron-left"></i>
												</button>
												<h2></h2>
												<button class="switch-month switch-right">
													<i class="fa fa-chevron-right"></i>
												</button>
											</div>
											<div class="calendar_weekdays"></div>
											<div class="calendar_content"></div>
										</div>

									</div>
									<div class="col-md-6">

										<div class="calendar calendar-second" id="calendar_second">
											<div class="calendar_header">
												<button class="switch-month switch-left">
													<i class="fa fa-chevron-left"></i>
												</button>
												<h2></h2>
												<button class="switch-month switch-right">
													<i class="fa fa-chevron-right"></i>
												</button>
											</div>
											<div class="calendar_weekdays"></div>
											<div class="calendar_content"></div>
										</div>

									</div>

								</div>
			

							</div>
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="static_files/js/lib/calendar/jquery.min.js"></script>
	<script src="static_files/js/lib/calendar/popper.js"></script>
	<script src="static_files/js/lib/calendar/bootstrap.min.js"></script>
	<script src="static_files/js/lib/calendar/main.js"></script>




	<!-- jquery vendor -->
	<script src="static_files/js/lib/jquery.min.js"></script>
	<script src="static_files/js/lib/jquery.nanoscroller.min.js"></script>
	<script src="static_files/js/lib/menubar/sidebar.js"></script>
	<script src="static_files/js/lib/preloader/pace.min.js"></script>
	<script src="static_files/js/lib/bootstrap.min.js"></script>
	<script src="static_files/js/scripts.js"></script>

	<script src="static_files/js/lib/jquery-ui/jquery-ui.min.js"></script>
	<script src="static_files/js/lib/moment/moment.js"></script>
	<script src="static_files/js/lib/calendar/fullcalendar.min.js"></script>
	<script src="static_files/js/lib/calendar/fullcalendar-init.js"></script>
	<!-- scripit init-->
</body>

</html>