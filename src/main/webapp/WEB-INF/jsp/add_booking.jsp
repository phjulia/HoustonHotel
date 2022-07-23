<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="static_files/js/lib/jquery.min.js"></script>
<script src="static_files/js/lib/validation.js"></script>
<title>Dodaj rezerwację</title>

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

</head>

<body>

<jsp:include page="navigation.jsp"/>
	<jsp:include page="header.jsp"/>



	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-8 p-r-0 title-margin-right">
						<div class="page-header">
							<div class="page-title">
							<h4>Formularz dodania rezerwacji</h4></div>
						</div>
					</div>
				</div>
				<!-- /# row -->


				<!--       <section id="main-content"> -->

				<div class="col-lg-12">
					<!-- <div class="card"> -->
						<div class="card-body">
							<div class="outer_div">
								

								<form:form class="form" action="add_booking" modelAttribute="booking" method="POST" onsubmit="return validateBookForm();" >
								
									<div class="form-group col" id="nameDiv">
										<label for="name">Imie</label> 
										<form:input type="text" path="guestimie"
											class="form-control" id="name" placeholder="2-20 znaków"></form:input>
											<p class="text-danger" id="nameError"></p>
									</div>
									
									
									
									<div class="form-group col" id="last_nameDiv">
										<label for="name">Nazwisko</label> 
										<form:input type="text" path="guestnazwisko"
										class="form-control" id="last_name" placeholder="2-20 znaków"></form:input>
									<p class="text-danger" id="last_nameError"></p>
									</div>
									<div class="form-group col" id="peselDiv">
										<label for="name">Pesel</label> 
										<form:input type="text" path="guestpesel"
											class="form-control" id="pesel" placeholder="2-20 znaków"></form:input>
									<p class="text-danger" id="peselError"></p>
									</div>
									<div class="form-group col" id="document_numberDiv">
										<label for="name">Numer dokumentu</label> 
										<form:input type="text" path="document_number"
											class="form-control" id="document_number" placeholder="2-20 znaków"></form:input>
									<p class="text-danger" id="document_numberError"></p>
									</div>
									<div class="form-group col" id="document_typeDiv">
										<label for="name">Typ dokumentu</label> 
										<form:input type="text" path="document_type"
											class="form-control" id="document_type" placeholder="2-20 znaków"></form:input>
									<p class="text-danger" id="document_typeError"></p>
									</div>
									<div class="form-group col" id="roomDiv">
										<%-- <label for="name">Pokój</label> 
										<form:input type="text" path="room"
											class="form-control" id="room" placeholder="2-20 znaków"></form:input>
									<p class="text-danger" id="roomError"></p> --%>
									<%-- <td>
                                	<form:select path="room" items="${booking.rooms}">
															<form:option value="0">--Wybierz--</form:option>
															<form:options></form:options>
														</form:select>
                                		</td> --%>
                                		
                                	<%-- <div class="form-group col" id="roomDiv">
										<label for="name">Pokój</label> 
										<form:select class="form-control" path="room" items="${rooms}" itemLabel="name" itemValue="roomId">
											<form:option value="NONE">--Wybierz--</form:option>
											<form:options></form:options>
										</form:select>
									</div> --%>
									<div class="form-group col" id="roomDiv">
									<label for="room">Pokój</label> <form:select path="roomNum"
										class="form-control" id="roomSelect">
										<form:option value="0" label="--- Wybierz pokój ---" />
										<c:forEach var="room" items="${rooms}">
										<form:option value="${room}">${room}</form:option>
										</c:forEach>
									</form:select>
									<p class="text-danger" id="roomError"></p>
									<form:errors path="room" class="text-danger"/>
								</div>
														
									</div>
									<div class="form-group col" id="startDiv">
										<label for="name">Początek rezerwacji</label> 
										<form:input type="date" path="start"
											class="form-control" id="start" placeholder="2-20 znaków"></form:input>
									<p class="text-danger" id="startError"></p>
									</div>
									
									<div class="form-group col" id="endDiv">
										<label for="name">Koniec rezerwacji</label> 
										<form:input type="date" path="end"
											class="form-control" id="end" placeholder="2-20 znaków"></form:input>
									<p class="text-danger" id="endError"></p>
									</div>
									
									
								
									
									<div class="row justify-content-end">
									<p class="text-danger" id="errors"></p>
									<div class="form-group col-4">
										<button type="submit" class="btn btn-primary btn-block" >Dodaj
											rezerwację</button>
									</div>
									
								</div>

								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- 	</div> -->




	<!-- jquery vendor -->
	<script src="static_files/js/lib/jquery.min.js"></script>
	<script src="static_files/js/lib/jquery.nanoscroller.min.js"></script>
	<!-- nano scroller -->
	<script src="static_files/js/lib/menubar/sidebar.js"></script>
	<script src="static_files/js/lib/preloader/pace.min.js"></script>
	<!-- sidebar -->

	<!-- bootstrap -->


	<script src="webapp/static_files/js/lib/morris-chart/raphael-min.js"></script>
	<script src="webapp/static_files/js/lib/morris-chart/morris.js"></script>
	<script src="webapp/static_files/js/lib/morris-chart/morris-init.js"></script>
	<script src="webapp/static_files/js/lib/bootstrap.min.js"></script>
	<script src="webapp/static_files/js/scripts.js"></script>
	<!-- scripit init-->

</body>
