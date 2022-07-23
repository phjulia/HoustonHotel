<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<div class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="float-left">
						<div class="hamburger sidebar-toggle">
							<span class="line"></span> <span class="line"></span> <span
								class="line"></span>
						</div>
					</div>
					<div class="float-right">

					 <div class="dropdown dib">
							<div class="header-icon">
								<a href="<c:url value='/email'/>"><i class="ti-email"></i></a>
							</div>
						</div> 
						<div class="dropdown dib">
							<div class="header-icon" data-toggle="dropdown">
								<span class="user-avatar"><security:authentication property="principal.username" /> 
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>