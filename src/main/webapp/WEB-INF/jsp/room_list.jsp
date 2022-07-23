<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Lista pokoi</title>


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
<!-- jquery vendor -->
<script src="<c:url value='/static_files/js/lib/jquery.min.js'/>"></script>
<script
	src="<c:url value='/static_files/js/lib/filter/filter_helper.js'/>"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script
	src="<c:url value='/static_files/js/lib/jquery.nanoscroller.min.js'/>"></script>
</head>

<body>

	<jsp:include page="navigation.jsp" />
	<jsp:include page="header.jsp" />
	<script>
		
	</script>
	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">
				<div class="row">
					<div class="col">
						<div class="page-header">
							<div class="page-title">
								<h1>Lista pokoi</h1>
							</div>
						</div>
					</div>

				</div>
				<div class="filter">
					<div class="row col-sm-12">
						<div class="col-sm-2">
							<label>Cena od:</label>
						</div>
						<div class="col-lg-2">
							<input id="minPrice" class="form-control" name="minPrice"
								type="number" />
						</div>
						<div class="col-sm-2">
							<label>Cena do:</label>
						</div>
						<div class="col-lg-2">
							<input id="maxPrice" class="form-control" name="maxPrice"
								type="number" />
						</div>
						<div class="col-lg-2">

							<a id="filter"
								href="javascript:setPrice('minPrice',document.getElementById('minPrice'),'maxPrice',
						 document.getElementById('maxPrice'));"
								class="btn btn-primary btn-block">Filtruj</a>

						</div>
						<div class="col-lg-2">

							<a id="filter" href="<c:url value='/rooms' />"
								class="btn btn-secondary btn-block" style="width: 100%;">Usuń
								filtry</a>
						</div>


					</div>
					<div class="row">
						<div class="col">
							<p class="text-danger" id="priceError"></p>
						</div>
					</div>
				</div>
				<div class="row sort">
					<input id="range" name="range" type="hidden" value='${range}' />
					<div class="col">
						<c:choose>

							<c:when test="${maxPrice!=null && minPrice!=null }">
								<a
									href="<c:url value='/rooms/${currentPage}?minPrice=${minPrice}&maxPrice=${maxPrice}&sort=class&direction=${reverseSortDirection}' />">
							</c:when>
							<c:otherwise>
								<a
									href="<c:url value='/rooms/${currentPage}?sort=class&direction=${reverseSortDirection}' />">
							</c:otherwise>
						</c:choose>
						<div>
							Klasa
							<c:choose>
								<c:when test="${reverseSortDirection=='desc' && sort=='class'}">
									<i class="bi bi-arrow-down"></i>
								</c:when>
								<c:when test="${reverseSortDirection=='asc'  && sort=='class'}">
									<i class="bi bi-arrow-up"></i>
								</c:when>
							</c:choose>
						</div>
						</a>
					</div>
					<div class="col">
						<c:choose>

							<c:when test="${maxPrice!=null && minPrice!=null}">
								<a
									href="<c:url value='/rooms/${currentPage}?minPrice=${minPrice}&maxPrice=${maxPrice}&sort=category&direction=${reverseSortDirection}' />">
							</c:when>
							<c:otherwise>
								<a
									href="<c:url value='/rooms/${currentPage}?sort=category&direction=${reverseSortDirection}' />">
							</c:otherwise>
						</c:choose>
						<div>
							Kategoria
							<c:choose>
								<c:when
									test="${reverseSortDirection=='desc' && sort=='category'}">
									<i class="bi bi-arrow-down"></i>
								</c:when>
								<c:when
									test="${reverseSortDirection=='asc'  && sort=='category'}">
									<i class="bi bi-arrow-up"></i>
								</c:when>
							</c:choose>
						</div>
						</a>
					</div>
					<div class="col">
						<c:choose>

							<c:when test="${maxPrice!=null && minPrice!=null }">
								<a
									href="<c:url value='/rooms/${currentPage}?minPrice=${minPrice}&maxPrice=${maxPrice}&sort=pricePerNight&direction=${reverseSortDirection}' />">
							</c:when>
							<c:otherwise>
								<a
									href="<c:url value='/rooms/${currentPage}?sort=pricePerNight&direction=${reverseSortDirection}' />">
							</c:otherwise>
						</c:choose>
						<div>
							Cena
							<c:choose>
								<c:when
									test="${reverseSortDirection=='desc' && sort=='pricePerNight'}">
									<i class="bi bi-arrow-down"></i>
								</c:when>
								<c:when
									test="${reverseSortDirection=='asc'  && sort=='pricePerNight'}">
									<i class="bi bi-arrow-up"></i>
								</c:when>
							</c:choose>
						</div>
						</a>
					</div>
				</div>
			</div>

		</div>
		<!-- /# row -->


		<table id="responstable">
			<c:forEach var="room" items="${listRooms}">
				<tr class="thead">
					<th colspan="2">Pokój numer ${room.roomNumber}</th>

				</tr>
				<tr>
					<td><div>
							<img alt="roomImg"
								src="<c:url value='/static_files/images/rooms/${room.pictureLocation}' />"
								style="height: 350px; width: 100%; object-fit: contain; min-width: 180px;">
						</div></td>
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
											<div class="divTableCell">${room.category}</div>

										</div>
										<div class="divTableRow">
											<div class="divTableCell">
												<i class="bi bi-tag"></i> Cena:
											</div>
											<div class="divTableCell">${room.pricePerNight}</div>

										</div>
										<div class="divTableRow">
											<div class="divTableCell">
												<i class="bi bi-calendar3-week"></i> Dostępny do wynajęcia:
											</div>
											<div class="divTableCell">
												<input type="checkbox" id="isActive" name="isActive"
													<c:choose>
   									 <c:when test='${room.active}'>
   											 checked
 									   </c:when>
									</c:choose>
													disabled />
											</div>
										</div>

									</div>
								</div>
								<div class="divTableFoot tableFootStyle"></div>
							</div>

						</div> <br>
						<div class="row">
							<a type="submit" class="btn btn-primary btn-block"
								href="<c:url value='/rooms/edit/${room.roomId}' /> ">Edytuj</a>
						</div>
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
									<c:when test="${currentPage > 0 && maxPrice!=null && minPrice!=null }">
										<span><a
											href="<c:url value='/rooms/${currentPage-1}?minPrice=${minPrice}&maxPrice=${maxPrice}&sort=${sort}&direction=${direction}' />"><i
												class="bi bi-arrow-left-circle"></i> </a></span>
									</c:when>
									<c:when test="${currentPage > 0}">
									<span><a
											href="<c:url value='/rooms/${currentPage-1}?sort=${sort}&direction=${direction}' />"><i
												class="bi bi-arrow-left-circle"></i> </a></span></c:when>
								</c:choose> <c:choose>
									<c:when test="${currentPage != totalPages}">
										<span> ${currentPage} / ${totalPages-1} </span>
									</c:when>
								</c:choose> <c:choose>
									<c:when test="${currentPage < totalPages-1 && maxPrice!=null && minPrice!=null }">
										<span><a
											href="<c:url value='/rooms/${currentPage+1}?minPrice=${minPrice}&maxPrice=${maxPrice}&sort=${sort}&direction=${direction}' />"><i
												class="bi bi-arrow-right-circle"></i> </a></span>
									</c:when>
									<c:when test="${currentPage < totalPages-1}">
										<span><a
											href="<c:url value='/rooms/${currentPage+1}?sort=${sort}&direction=${direction}' />"><i
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





	<!-- nano scroller -->
	<script src="<c:url value='/static_files/js/lib/menubar/sidebar.js'/>"></script>
	<script
		src="<c:url value='/static_files/js/lib/preloader/pace.min.js'/>"></script>
	<!-- sidebar -->

	<!-- bootstrap -->

	<script src="<c:url value='/static_files/js/lib/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/static_files/js/scripts.js'/>"></script>
	<!-- scripit init-->

</body>
