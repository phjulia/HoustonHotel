<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Houston Hotel</title>
<script src="static_files/js/lib/validation/validation1.js"></script>
<link href="static_files/css/lib/font-awesome.min.css" rel="stylesheet">
<link href="static_files/css/lib/themify-icons.css" rel="stylesheet">
<link href="static_files/css/lib/bootstrap.min.css" rel="stylesheet">
<link href="static_files/css/lib/helper.css" rel="stylesheet">
<link href="static_files/css/style.css" rel="stylesheet">
</head>

<body class="bg-primary">

	<div class="unix-login">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="login-content">
						<div class="login-logo">
							<span>Houston Hotel</span>
						</div>
						<div class="login-form">
							<h4>Logowanie</h4>
							<form:form modelAttribute="login" action="login" method="POST" onsubmit="return false;"
								id="form">
				
								<div class="form-group" id="emailDiv">

									<label>Adres e-mail</label>
									<form:input path="email" class="form-control"
										placeholder="example@gmail.com" id="emailInput" name='email' />
									<form:errors path="email" class="text-danger" />
									<p class="text-danger" id="emailError"></p>
								</div>

								<div class="form-group" id="passwordDiv">
									<label>Hasło</label>
									<form:input path="password" type="password"
										class="form-control" placeholder="******" id="passwordInput"
										name='password' />
									<form:errors path="password" class="text-danger" />
									<p class="text-danger" id="passwordError"></p>
								</div>
								<div class="checkbox">

									<label class="pull-right"> <a href="forgot_password">Nie
											pamiętam hasła</a>
									</label>
								</div>

									<p class="text-danger" id="errors">${message}</p>
									<form:button type="submit" name="login" onclick="validateLogin();"
										class="btn btn-primary btn-flat m-b-30 m-t-30">Zaloguj się</form:button>

							</form:form>



						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

