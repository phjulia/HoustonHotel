<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Lista pracowników</title>

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
<link
	href="<c:url value='/static_files/css/lib/employee/employee_list.css'/>"
	rel="stylesheet">
<script
	src="<c:url value='/static_files/js/lib/filter/filter_helper.js'/>"></script>
</head>

<body>


	<jsp:include page="navigation.jsp" />
	<jsp:include page="header.jsp" />


	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-8 p-r-0 title-margin-right">
						<div class="page-header">
							<div class="page-title">
								<h4>Lista pracowników</h4>
							</div>
						</div>
					</div>
				</div>
				<div class="filter">
					<div class="row col-sm-12">
						<div class="col-lg-3">

							<select id="job">
								<c:forEach var="job" items="${jobs}">
									<option value="${job}">${job}</option>
								</c:forEach>
							</select>
						</div>

						<div class="col-lg-2">

							<a id="filter"
								href="javascript:setJobParam('job',document.getElementById('job').value);"
								class="btn btn-primary btn-block" style="width: 100%;">Filtruj</a>
						</div>
						<div class="col-lg-2">

							<a id="filter"
								href="<c:url value='/employees' />"
								class="btn btn-secondary btn-block" style="width: 100%;">Usuń filtry</a>
						</div>


					</div>
				</div>
				<div class="row sort">
					<div class="col">
						<input id="job" name="job" type="hidden" value='${job}' />
						<c:choose>

							<c:when test="${job!=null}">
								<a
									href="<c:url value='/employees/${currentPage}?job=${job}&sort=last_name&direction=${reverseSortDirection}' />">
							</c:when>
							<c:otherwise>
								<a
									href="<c:url value='/employees/${currentPage}?sort=last_name&direction=${reverseSortDirection}' />">
							</c:otherwise>
						</c:choose>

						<div>
							<i class="bi bi-person"></i>
							<c:choose>
								<c:when
									test="${reverseSortDirection=='desc' && sort=='last_name'}">
									<i class="bi bi-arrow-down"></i>
								</c:when>
								<c:when
									test="${reverseSortDirection=='asc'  && sort=='last_name'}">
									<i class="bi bi-arrow-up"></i>
								</c:when>
							</c:choose>
						</div>
						</a>
					</div>
					<div class="col">
						<c:choose>

							<c:when test="${job!=null}">
								<a
									href="<c:url value='/employees/${currentPage}?job=${job}&sort=pesel&direction=${reverseSortDirection}' />">
							</c:when>
							<c:otherwise>
								<a
									href="<c:url value='/employees/${currentPage}?sort=pesel&direction=${reverseSortDirection}' />">
							</c:otherwise>
						</c:choose>
						<div>
							Pesel
							<c:choose>
								<c:when test="${reverseSortDirection=='desc' && sort=='pesel'}">
									<i class="bi bi-arrow-down"></i>
								</c:when>
								<c:when test="${reverseSortDirection=='asc'  && sort=='pesel'}">
									<i class="bi bi-arrow-up"></i>
								</c:when>
							</c:choose>
						</div>
						</a>
					</div>
					<div class="col">
						<c:choose>

							<c:when test="${job!=null}">
								<a
									href="<c:url value='/employees/${currentPage}?job=${job}&sort=hire_date&direction=${reverseSortDirection}' />">
							</c:when>
							<c:otherwise>
								<a
									href="<c:url value='/employees/${currentPage}?sort=hire_date&direction=${reverseSortDirection}' />">
							</c:otherwise>
						</c:choose>
						<div>
							Data zatr.
							<c:choose>
								<c:when
									test="${reverseSortDirection=='desc' && sort=='hire_date'}">
									<i class="bi bi-arrow-down"></i>
								</c:when>
								<c:when
									test="${reverseSortDirection=='asc'  && sort=='hire_date'}">
									<i class="bi bi-arrow-up"></i>
								</c:when>
							</c:choose>
						</div>
						</a>
					</div>
					<div class="col">
						<c:choose>

							<c:when test="${job!=null}">
								<a
									href="<c:url value='/employees/${currentPage}?job=${job}&sort=birth_date&direction=${reverseSortDirection}' />">
							</c:when>
							<c:otherwise>
								<a
									href="<c:url value='/employees/${currentPage}?sort=birth_date&direction=${reverseSortDirection}' />">
							</c:otherwise>
						</c:choose>
						<div>
							Data ur.
							<c:choose>
								<c:when
									test="${reverseSortDirection=='desc' && sort=='birth_date'}">
									<i class="bi bi-arrow-down"></i>
								</c:when>
								<c:when
									test="${reverseSortDirection=='asc'  && sort=='birth_date'}">
									<i class="bi bi-arrow-up"></i>
								</c:when>
							</c:choose>
						</div>
						</a>
					</div>
				</div>
				<table id="responstable">
					<thead>
						<tr>
							<th><c:choose>

									<c:when test="${job!=null}">
										<a
											href="<c:url value='/employees/${currentPage}?job=${job}&sort=last_name&direction=${reverseSortDirection}' />">
									</c:when>
									<c:otherwise>
										<a
											href="<c:url value='/employees/${currentPage}?sort=last_name&direction=${reverseSortDirection}' />">
									</c:otherwise>
								</c:choose>
								<div>
									Pracownik

									<c:choose>
										<c:when
											test="${reverseSortDirection=='desc' && sort=='last_name'}">
											<i class="bi bi-arrow-down"></i>
										</c:when>
										<c:when
											test="${reverseSortDirection=='asc'  && sort=='last_name'}">
											<i class="bi bi-arrow-up"></i>
										</c:when>
									</c:choose>
								</div> </a></th>
							<th><c:choose>

									<c:when test="${job!=null}">
										<a
											href="<c:url value='/employees/${currentPage}?job=${job}&sort=pesel&direction=${reverseSortDirection}' />">
									</c:when>
									<c:otherwise>
										<a
											href="<c:url value='/employees/${currentPage}?sort=pesel&direction=${reverseSortDirection}' />">
									</c:otherwise>
								</c:choose>
								<div>
									Pesel
									<c:choose>
										<c:when
											test="${reverseSortDirection=='desc' && sort=='pesel'}">
											<i class="bi bi-arrow-down"></i>
										</c:when>
										<c:when
											test="${reverseSortDirection=='asc'  && sort=='pesel'}">
											<i class="bi bi-arrow-up"></i>
										</c:when>
									</c:choose>
								</div> </a></th>

							<th><c:choose>

									<c:when test="${job!=null}">
										<a
											href="<c:url value='/employees/${currentPage}?job=${job}&sort=hire_date&direction=${reverseSortDirection}' />">
									</c:when>
									<c:otherwise>
										<a
											href="<c:url value='/employees/${currentPage}?sort=hire_date&direction=${reverseSortDirection}' />">
									</c:otherwise>
								</c:choose>
								<div>
									Data zatrudnienia
									<c:choose>
										<c:when
											test="${reverseSortDirection=='desc' && sort=='hire_date'}">
											<i class="bi bi-arrow-down"></i>
										</c:when>
										<c:when
											test="${reverseSortDirection=='asc'  && sort=='hire_date'}">
											<i class="bi bi-arrow-up"></i>
										</c:when>
									</c:choose>
								</div> </a></th>
							<th><c:choose>

									<c:when test="${job!=null}">
										<a
											href="<c:url value='/employees/${currentPage}?job=${job}&sort=birth_date&direction=${reverseSortDirection}' />">
									</c:when>
									<c:otherwise>
										<a
											href="<c:url value='/employees/${currentPage}?sort=birth_date&direction=${reverseSortDirection}' />">
									</c:otherwise>
								</c:choose>
								<div>
									Data urodzenia
									<c:choose>
										<c:when
											test="${reverseSortDirection=='desc' && sort=='birth_date'}">
											<i class="bi bi-arrow-down"></i>
										</c:when>
										<c:when
											test="${reverseSortDirection=='asc'  && sort=='birth_date'}">
											<i class="bi bi-arrow-up"></i>
										</c:when>
									</c:choose>
								</div> </a></th>
							<th>Adres zamieszkania</th>
							<th>E-mail</th>
							<th>Stanowisko</th>
							<th>Akcje</th>

						</tr>
					</thead>

					<c:forEach var="emp" items="${listEmployees}">

						<tr>
							<td data-label="Pracownik">${emp.first_name}
								${emp.last_name}</td>
							<td data-label="PESEL">${emp.pesel}</td>
							<td data-label="Data zatrudnienia">${emp.hire_date}</td>
							<td data-label="Data urodzenia">${emp.birth_date}</td>
							<td data-label="Adres zamieszkania">${emp.address}</td>
							<td data-label="E-mail">${emp.email}</td>
							<td data-label="Stanowisko">${emp.job}</td>
							<td>
								<div>
									<a type="submit" class="btn btn-primary btn-block"
										href="<c:url value='/employee/${emp.empId}' />" 
										style="padding: 3px; margin: 0px;">Edytuj</a>
								</div>
							</td>
						</tr>
					</c:forEach>


				</table>
				<div>
					<div class="row footer">
						<c:if test="${totalPages > 1}">
							<div class="row col-sm-12 align-items-end">
								<div class="col-sm-6">Wszystkich rekordów: ${totalItems}</div>
								<div class="col-sm-6">
									<span> <c:choose>
											<c:when test="${currentPage > 0}">
												<span><a
													href="<c:url value='/employees/${currentPage-1}?sort=${sort}&direction=${direction}' />"><i
														class="bi bi-arrow-left-circle"></i> </a></span>
											</c:when>
										</c:choose> <c:choose>
											<c:when test="${currentPage != totalPages}">
												<span> ${currentPage} / ${totalPages-1} </span>
											</c:when>
										</c:choose> <c:choose>
											<c:when test="${currentPage < totalPages-1}">
												<span><a
													href="<c:url value='/employees/${currentPage+1}?sort=${sort}&direction=${direction}' />"><i
														class="bi bi-arrow-right-circle"></i> </a></span>
											</c:when>
										</c:choose>
									</span> &nbsp; &nbsp;
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- jquery vendor -->
	<script src="<c:url value='/static_files/js/lib/jquery.min.js'/>"></script>
	<script
		src="<c:url value='/static_files/js/lib/jquery.nanoscroller.min.js'/>"></script>
	<!-- nano scroller -->
	<script src="<c:url value='/static_files/js/lib/menubar/sidebar.js'/>"></script>
	<script
		src="<c:url value='/static_files/js/lib/preloader/pace.min.js'/>"></script>
	<!-- sidebar -->

	<!-- bootstrap -->
	<%-- 

		<script
			src="<c:url value='/static_files/js/lib/morris-chart/raphael-min.js'/>"></script>
		<script
			src="<c:url value='/static_files/js/lib/morris-chart/morris.js'/>"></script>
		<script
			src="<c:url value='/static_files/js/lib/morris-chart/morris-init.js'/>"></script> --%>
	<script src="<c:url value='/static_files/js/lib/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/static_files/js/scripts.js'/>"></script>
	<!-- scripit init-->
</body>
