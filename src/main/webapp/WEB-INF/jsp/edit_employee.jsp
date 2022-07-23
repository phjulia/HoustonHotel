<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<c:url value='static_files/js/lib/jquery.min.js' />"></script>
<script src="static_files/js/lib/validation/validation1.js"></script>

<title>Edycja pracownika</title>

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
					</div>
				</div>
				<!-- /# row -->


				<!--       <section id="main-content"> -->

				<div class="col-lg-12">
					<!-- <div class="card"> -->
						<div class="card-body">
							<div class="outer_div">
                                    <h4>Edycja pracownika o nr PESEL ${emp.pesel}</h4>
                    
                                    <form:form class="form" method="post" action="edit" modelAttribute="emp" onsubmit="return validateEmpEditForm();" novalidate="novalidate">
                                    
									<form:hidden path="empId" />
                                       
                                       
 										 <div class="form-group col" id="first_nameDiv">
										<label for="first_name">Imie</label> <form:input path="first_name" type="text"
											class="form-control" id="first_name" placeholder="2-20 znaków"></form:input>
									<p class="text-danger" id="first_nameError"></p>
									</div>
									
                                       
              
						
 										 <div class="form-group col" id="last_nameDiv">
										<label for="last_name">Nazwisko</label> <form:input path="last_name" type="text"
											class="form-control" id="last_name" placeholder="2-20 znaków"></form:input>
									<p class="text-danger" id="last_nameError"></p>
									</div>
									
									
								<div class="row justify-content-end">
									<p class="text-danger" id="errors"></p>
									<div class="form-group col-4">

										<button type="submit" class="btn btn-primary btn-block">Zapisz</button>
									</div>
									</div>
								
								
									
									</form:form> 
                                     </div> 
                                </div>
                            </div>
                        </div> 
                      
                    </div>
	
	
            </div>



	<!-- jquery vendor -->
	<script src="<c:url value='/static_files/js/lib/jquery.min.js' />"></script>
	<script src="<c:url value='/static_files/js/lib/jquery.nanoscroller.min.js' />"></script>
	<!-- nano scroller -->
	<script src="<c:url value='/static_files/js/lib/menubar/sidebar.js' />"></script>
	<script src="<c:url value='/static_files/js/lib/preloader/pace.min.js' />"></script>
	<!-- sidebar -->

	<!-- bootstrap -->


	<script src="<c:url value='/static_files/js/lib/morris-chart/raphael-min.js' />"></script>
	<script src="<c:url value='/static_files/js/lib/morris-chart/morris.js' />"></script>
	<script src="<c:url value='/static_files/js/lib/morris-chart/morris-init.js' />"></script>
	<script src="<c:url value='/static_files/js/lib/bootstrap.min.js' />"></script>
	<script src="<c:url value='/static_files/js/scripts.js' />"></script>
	<!-- scripit init-->

</body>

