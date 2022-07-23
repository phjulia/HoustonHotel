<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Houston Hotel</title>
<script src="static_files/js/lib/validation/validation1.js"></script>

    <!-- ================= Favicon ================== -->
    <!-- Standard -->
    <link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
    <!-- Retina iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="144x144" href="http://placehold.it/144.png/000/fff">
    <!-- Retina iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="114x114" href="http://placehold.it/114.png/000/fff">
    <!-- Standard iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="72x72" href="http://placehold.it/72.png/000/fff">
    <!-- Standard iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="57x57" href="http://placehold.it/57.png/000/fff">

    <!-- Styles -->
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
                            <a href="index.html"><span>Houston Hotel</span></a>
                        </div>
                        <div class="login-form">
                            <h4>Resetowanie hasła</h4>
            			<form id="reset_password_form" action="changePassword" method="POST" onsubmit="return validateForm();" >
                               <div id="summaryErrorDiv">
                                <div class="form-group" id="passwordError"> 
                                <input type="hidden" name="token" value="${token}" />
                                    <label>Nowe hasło</label> 
                                    <input id="password" name="password" type="password" class="form-control" placeholder="******"/>
                                   <p id="password-err" class="text-danger">${errorPassword}</p>
                                </div> 
                                 
                                <div class="form-group" id="repeatPasswordError">
                                    <label>Powtorz hasło</label>
                                    <input id="repeat_password" name="password-repeat" type="password" class="form-control" placeholder="******"
                                    />
                                 	 <p id="repeatPass-error" class="text-danger">${errorRepeatPassword}</p>
                                </div>
							<p id="summaryError" class="text-danger">${error}</p>
                             <p class="font-weight-light">${message}</p>
                             </div>
                               <button type="submit" class="btn btn-primary btn-flat m-b-30 m-t-30" >Zmień hasło</button>
                            </form> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
