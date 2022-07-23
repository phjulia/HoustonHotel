<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Houston Hotel</title>

<!-- Styles -->
<link href="<c:url value='/static_files/css/lib/font-awesome.min.css'/>" rel="stylesheet">
<link href="<c:url value='/static_files/css/lib/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/static_files/css/lib/helper.css'/>" rel="stylesheet">
<link href="<c:url value='/static_files/css/style.css'/>" rel="stylesheet">
<link
	href="<c:url value='/static_files/css/lib/helpers/unauthorized.css'/>" rel="stylesheet">
</head>

<body class="bg-primary">

	<div class="unix-login">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<h1 id="a">401</h1>
					<h3>Potrzebujesz uprawnień dostępu do tej witryny</h3>
					<h3>Wróc do <a href="<c:url value="/home" /> " >strony głównej</a></h3>

				</div>

			</div>
		</div>
	</div>

</body>

