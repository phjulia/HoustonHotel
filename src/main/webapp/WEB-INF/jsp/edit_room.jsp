<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Edytuj pokój</title>

<!-- ================= Favicon ================== -->
<!-- Standard -->
<link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
<!-- Retina iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="144x144"
	href="http://placehold.it/144.png/000/fff">
<!-- Retina iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="114x114"
	href="http://placehold.it/114.png/000/fff">
<!-- Standard iPad Touch Icon-->
<link rel="apple-touch-icon" sizes="72x72"
	href="http://placehold.it/72.png/000/fff">
<!-- Standard iPhone Touch Icon-->
<link rel="apple-touch-icon" sizes="57x57"
	href="http://placehold.it/57.png/000/fff">

<!-- Styles -->
<link
	href="<c:url value='/static_files/css/lib/room/room_list.css?version=51' />"
	rel="stylesheet">
<link href="<c:url value='/static_files/css/lib/font-awesome.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/static_files/css/lib/themify-icons.css'/>"
	rel="stylesheet">
<link href="<c:url value='/static_files/css/lib/menubar/sidebar.css'/>"
	rel="stylesheet">
<link href="<c:url value='/static_files/css/lib/bootstrap.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/static_files/css/lib/helper.css'/>"
	rel="stylesheet">
<link href="<c:url value='/static_files/css/style.css?version=51'/>"
	rel="stylesheet">
<link href="<c:url value='/static_files/css/table.css'/>"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link href="<c:url value='/static_files/css/lib/room/edit_room.css'/>"
	rel="stylesheet">
<script src="<c:url value='/static_files/js/lib/validation/validation1.js' />"></script>

</head>

<body>


	<jsp:include page="navigation.jsp" />
	<jsp:include page="header.jsp" />

	<div class="content-wrap">
		<div class="btn-block">
			<a type="button" class="btn btn-primary btn-block" id="backButton"
				href="<c:url value='/rooms'/>"> <svg
					xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
						d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
</svg> Wróc do listy pokoi
			</a>
		</div>

		<div class="main">
			<div class="container-fluid">
				<div class="row">

					<div class="page-title">
						<h4>Edycja pokoju</h4>
					</div>

				</div>


				<div id="roomList">

					<table id="responstable">
						<form:form method="post" modelAttribute="room"
							onsubmit="return validateRoom();">
							<form:hidden path="roomId" />
							<tr>
								<th colspan="2">Pokój numer ${room.roomNumber}</th>

							</tr>


							<tr>
								<td><img alt="roomImg"
									src="<c:url value='/static_files/images/rooms/${room.roomNumber}.jpeg' />"
									style="height: 100%; width: 100%; object-fit: contain"></td>
								<td>
									<div class="container">
										<div class="row">
											<div class="divTable greyGridTable">
												<div class="divTableHeading">
													<div class="divTableRow"></div>
												</div>
												<div class="divTableBody">
													<div class="divTableRow">
														<div class="divTableCell">
															<i class="bi bi-star"></i> Klasa:
														</div>
														<div class="divTableCell">${room.className}</div>

													</div>
													<div class="divTableRow">
														<div class="divTableCell">
															<i class="bi bi-people"></i>Kategoria:
														</div>
														<div class="divTableCell">
															<form:select path="category" items="${room.categories}">
																<form:option value="NONE">--Wybierz--</form:option>
																<form:options></form:options>
															</form:select>
														</div>

													</div>
													<div class="divTableRow">
														<div class="divTableCell">
															<i class="bi bi-tag"></i> Cena:
														</div>
														<div class="divTableCell" id="priceDiv">										
															<form:input path="pricePerNight" id="priceInput"
																class="form-control" name="pricePerNight" type="number" />
																 <form:errors path="pricePerNight" class="text-danger"/> 
															<p class="text-danger" id="priceError">${error}</p>
														</div>

													</div>
													<div class="divTableRow">
														<div class="divTableCell">
															<i class="bi bi-calendar3-week"></i> Dostępny do
															wynajęcia:
														</div>
														<div class="divTableCell">
															<form:checkbox path="active" id="isActive"
																name="isActive"
																value="<c:choose>
   									 <c:when test='${room.active}==true'>
   											 true
 									   </c:when>
									</c:choose>" />


														</div>
													</div>

												</div>
											</div>

										</div>
										<br>
										<div class="row">

											<button type="submit" class="btn btn-primary btn-block"
												style="width: 100%;">Zapisz</button>
										</div>
									</div>
								</td>

							</tr>

						</form:form>
					</table>

				</div>
			</div>
		</div>
	</div>

	<!-- jquery vendor -->
	<script src="<c:url value='/static_files/js/lib/jquery.min.js' />"></script>
	<script
		src="<c:url value='/static_files/js/lib/jquery.nanoscroller.min.js' />"></script>
	<!-- nano scroller -->
	<script src="<c:url value='/static_files/js/lib/menubar/sidebar.js' />"></script>
	<script
		src="<c:url value='/static_files/js/lib/preloader/pace.min.js' />"></script>

	<!-- sidebar -->

	<!-- bootstrap -->


	<script
		src="<c:url value='/static_files/js/lib/morris-chart/raphael-min.js' />"></script>
	<script
		src="<c:url value='/static_files/js/lib/morris-chart/morris.js' />"></script>
	<script
		src="<c:url value='/static_files/js/lib/morris-chart/morris-init.js' />"></script>
	<script src="<c:url value='/static_files/js/lib/bootstrap.min.js' />"></script>
	<script src="<c:url value='/static_files/js/scripts.js' />"></script>
	<!-- scripit init-->

</body>
