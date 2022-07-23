<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Przypisz zadanie</title>

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
                            </div>
                        </div>
                    </div>
                </div>       
	
	<section id="main-content">
	
	 <div class="row">
                       
                     <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                <div class="card-title">
                                    <h4>Przypisanie zadania</h4>
                    
                                    <div id="taskList">
                                    <form:form method="post" action="edit" modelAttribute="task">
                                    <table>
                                       <form:hidden path="taskId" />
 										 <tr>
 										 
                                			
                                		<th>Nazwa</th>	
 										<th>Opis</th>		
 										<th>Przypisz pracownika</th>	
 										<th>Akcje</th>	
                                		</tr>
                      
                                		
                                		<tr>
                                		
                                		<td>${task.name}</td> 
                                		<td>${task.description}</td> 
										                                		
									<%-- 	<label for="cars">Choose a car:</label>
										--%>
										<td><form:select path="assignee" items="${task.assignees}">
															<form:option value="0">--Wybierz--</form:option>
															<form:options></form:options>
														</form:select>
										</td>
                                		
                                		
                                		<%-- <td><form:input path="assignee" /></td> --%>
                                		
                                		<%-- <div class="divTableRow">
													<div class="divTableCell">
														<i class="bi bi-people"></i>Kategoria:
													</div>
													<div class="divTableCell">
														<form:select path="assignee" items="${task.assignees}">
															<form:option value="NONE">--Wybierz--</form:option>
															<form:options></form:options>
														</form:select>
													</div>

												</div> --%>
                                		
                                		<td> <input class="save" type="submit" value="Zapisz"></td>
									</tr>	
		
								
									</table>
									</form:form> 
                                     </div> 
                                </div>
                            </div>
                        </div> 
                      
                    </div>
					
                </section>
	
	
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

