<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="static_files/js/lib/jquery.min.js"></script>
<script src="static_files/js/lib/validation/validation1.js"></script>

<title>Dodaj nowego pracownika</title>

<link href="static_files/css/lib/room/room_list.css?version=51"
	rel="stylesheet">
<link href="static_files/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="static_files/css/lib/themify-icons.css" rel="stylesheet">
<link href="static_files/css/lib/menubar/sidebar.css" rel="stylesheet">
<link href="static_files/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="static_files/css/lib/helper.css" rel="stylesheet">
<link href="static_files/css/style.css?version=51" rel="stylesheet">
<link
	href="<c:url value='/static_files/css/lib/employee/add-employee.css'/>"
	rel="stylesheet">

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
								<h4>Formularz dodania nowego pracownika</h4>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-12">

					<div class="card-body">
						<div class="outer_div">

							<form:form class="form" action="add_employee"
								modelAttribute="emp" method="POST"  onsubmit="return validateEmpForm();" novalidate="novalidate">
								<div class="form-group col" id="nameDiv">
									<label for="name">Imię</label>
									<form:input type="text" path="first_name" class="form-control"
										id="name" placeholder="2-60 znaków"></form:input>
										<form:errors path="first_name" class="text-danger"/>
										<p class="text-danger" id="nameError"></p>
										
								</div>
								<div class="form-group col" id="last_nameDiv">
									<label for="last_name">Nazwisko</label>
									<form:input path="last_name" type="text" class="form-control"
										id="last_name" placeholder="2-60 znaków"></form:input>
										<form:errors path="last_name" class="text-danger"/>
										<p class="text-danger" id="last_nameError"></p>
										
								</div>
								<div class="form-group col" id="peselDiv">
									<label for="pesel">PESEL</label>
									<form:input path="pesel" type="text" class="form-control"
										id="pesel" placeholder="11 znaków"></form:input>
										<form:errors path="pesel" class="text-danger" />
										<p class="text-danger" id="peselError"></p>
								</div>
								<div class="form-group col" id="addressDiv">
									<label for="inputAddress">Adres zamieszkania</label> <form:input
										path="inputAddress" type="text" class="form-control"
										id="addressInput" placeholder="Włoska 13/2"></form:input>
										<form:errors path="inputAddress" class="text-danger" />
										<p class="text-danger" id="addressError" ></p>
										
								</div>
								<div class="form-group col" id="locationDiv">
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputCity">Miasto</label> <form:input path="inputCity"
												type="text" class="form-control" id="cityInput" placeholder="Warszawa"></form:input>
													<form:errors path="inputCity" class="text-danger" />
												<p class="text-danger" id="cityError"></p>
											
										</div>
										<div class="form-group col-md-2" id="zipDiv">
											<label for="inputZip">Kod pocztowy</label> <form:input
												path="inputZip" type="text" class="form-control"
												id="zipInput" placeholder="00-000"></form:input>
												<form:errors path="inputZip" class="text-danger" />
												<p class="text-danger" id="zipError"></p>
												
										</div>
									</div>
								</div>
								<div class="form-group col" id="hire_dateDiv">
									<label for="hire_date">Data zatrudnienia</label>
									<form:input path="hire_date" type="date" class="form-control"
										id="hire_dateInput" min="2013-12-25"></form:input>
											<form:errors path="hire_date" class="text-danger"/>
										<p class="text-danger" id="hire_dateError"></p>
									
								</div>


								<div class="form-group col" id="birth_dateDiv">
									<label for="birth_date">Data urodzenia</label>
									<form:input path="birth_date" type="date" class="form-control"
										id="birth_dateInput" ></form:input>
										<form:errors path="birth_date" class="text-danger"/>
										<p class="text-danger" id="birth_dateError"></p>
										
								</div>

								<div class="form-group col" id="emailDiv">
									<label for="email">Adres email</label>
									<form:input path="email" type="email" class="form-control"
										id="emailInput" placeholder="example@gmail.com"></form:input>
										<form:errors path="email" class="text-danger" />
										<p class="text-danger" id="emailError"></p>
								</div>
								<div class="form-group col" id="jobDiv">
									<label for="job">Stanowisko</label> <form:select path="job"
										class="form-control" id="jobSelect">
										<form:option value="0" label="--- Wybierz stanowisko ---" />
										<c:forEach var="job" items="${jobs}">
										<form:option value="${job}">${job}</form:option>
										</c:forEach>
									</form:select>
									<p class="text-danger" id="jobError"></p>
									<form:errors path="job" class="text-danger"/>
								</div>
								<div class="row justify-content-end">
								
								<p class="text-danger" id="errors"></p>
									<div class="form-group col-4">
										<button type="submit" class="btn btn-primary btn-block">Dodaj
											pracownika</button>
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

	<script src="static_files/js/lib/jquery.nanoscroller.min.js"></script>
	<!-- nano scroller -->
	<script src="static_files/js/lib/menubar/sidebar.js"></script>
	<script src="static_files/js/lib/preloader/pace.min.js"></script>
	<!-- sidebar -->

	<!-- bootstrap -->

	<script src="webapp/static_files/js/lib/bootstrap.min.js"></script>
	<!-- <script src="webapp/static_files/js/scripts.js"></script> -->
	<!-- scripit init-->

</body>
