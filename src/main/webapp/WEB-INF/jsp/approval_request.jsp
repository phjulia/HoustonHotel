<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="pl-PL">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Wnioski o urlop</title>
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
<!-- Datatable -->
<link href="static_files/css/lib/datatable/dataTables.bootstrap.min.css"
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
<!-- Approval requests -->
<link href="static_files/css/lib/approval_request/approval_request.css"
	rel="stylesheet" />
<script src="static_files/js/lib/request/request.js"></script>

</head>

<body>
	<jsp:include page="navigation.jsp" />
	<jsp:include page="header.jsp" />
	<div class="content-wrap" id="requestsDiv">
		<h4>Wnioski o urlop</h4>
		<c:forEach var="request" items="${requests}">
			<c:set var="vacations" value="${request.value}" />

			<div class="card-approval">
				<div class="main">
					<div class="container-fluid ">
						<div class="row">
							<div class="col-sm-3">
								<label id="inputGroup-sizing-sm">Okres urlopu</label> <input
									type="text" class="form-control" aria-label="Small"
									aria-describedby="inputGroup-sizing-sm"
									value="${request.key.vacation.date_from} - ${request.key.vacation.date_to}"
									disabled>
							</div>

							<div class="col-sm-3">
								<label id="inputGroup-sizing-sm">Pracownik</label> <input
									type="text" class="form-control" aria-label="Small"
									aria-describedby="inputGroup-sizing-sm"
									value="${request.key.requestor.first_name} ${request.key.requestor.last_name}"
									disabled>
							</div>

							<div class="col-sm-3">
								<label id="inputGroup-sizing-sm">Wykorzystane dni urlopu</label>
								<input type="text" class="form-control" aria-label="Small"
									aria-describedby="inputGroup-sizing-sm"
									value="${request.key.requestor_vacation_days}/${maxDays}"
									disabled>
							</div>


							<div class="col-sm-3">
								<label id="inputGroup-sizing-sm">Stanowisko</label> <input
									type="text" class="form-control" aria-label="Small"
									aria-describedby="inputGroup-sizing-sm"
									value="${request.key.requestor.job}" disabled>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label id="inputGroup-sizing-sm">Urlopy innych osób na
									danym stanowisku (w tym samym terminie)</label>
								<div class="form-group">
									<div class='textarea'>
										<c:forEach var="vacation" items="${vacations}">
											<p>${vacation.emp}:${vacation.date_from}-
												${vacation.date_to}</p>

										</c:forEach>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<br>
								<div class="row buttons">
									<a class="btn btn-primary"
										onclick="approve(${request.key.id},'${request.key.requestor.email}','${request.key.vacation.date_from}','${request.key.vacation.date_to}'); " style="margin: 10px;">Zatwierdź
										wniosek</a> <a class="btn btn-danger" data-toggle="modal"
										onclick="assignId(${request.key.id});" data-target="#pop-up"
										id="save-event" style="margin: 10px;">Odrzuć wniosek</a>
								</div>
							</div>
							<div class="modal" tabindex="-1" role="dialog" id="pop-up">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Odrzucenie wniosku</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<textarea class="form-control" style="height: 100px;"
												rows="3" id="reject"></textarea>
											<p id="error" class="text-danger"></p>
											<div class="modal-footer">

												<button type="button" class="btn btn-danger"
													data-dismiss="modal">Anuluj</button>
												<button type="button" class="btn btn-primary"
													id="save-event" onclick="reject(${request.key.id},'${request.key.requestor.email}','${request.key.vacation.date_from}','${request.key.vacation.date_to}'); ">Zapisz</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
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
	<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/3.2.1/jquery.min.js"></script> -->

	<!-- 	<script src="static_files/js/lib/calendar/fullcalendar-init.js"></script>  -->
	<!-- scripit init-->
</body>

</html>