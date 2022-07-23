<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div
	class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
	<div class="nano">
		<div class="nano-content">

			<div class="logo">
				<a href="<c:url value='/home'/>"> <img
					src="<c:url value="/static_files/images/pom.svg"></c:url>"
					class="logo-pic" alt="" style="width: 59px; height: 45px;" /> <span>Houston
						Hotel</span></a>
			</div>
			<ul>
				<li><a href="<c:url value='/home'/>"><i class="ti-home"></i>
						Strona główna </a></li>

				<security:authorize
					access="hasAnyAuthority('Recepcjonista','Manager')">
					<li><a class="sidebar-sub-toggle"><i class="ti-key"></i>
							Pokoje <span class="sidebar-collapse-icon ti-angle-down"></span></a>
						<ul>
							<li><a href="<c:url value='/rooms'/>">Lista pokoi</a></li>
						</ul></li>
				</security:authorize>
				<li><a class="sidebar-sub-toggle"><i class="ti-calendar"></i>
						Kalendarz urlopów <span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<security:authorize
							access="hasAnyAuthority('Recepcjonista','Pracownik')">
							<li><a href="<c:url value='/calendar'/>"> Kalendarz </a></li>
						</security:authorize>
						<security:authorize
							access="hasAuthority('Manager')">
							<li><a href="<c:url value='/vacations'/>"> Urlopy </a></li>
						</security:authorize>
						<security:authorize access="hasAuthority('Manager')">
							<li><a href="<c:url value='/approval_request'/>">Wnioski
									o urlop</a></li>
						</security:authorize>
					</ul></li>
				<li><a href="<c:url value='/email'/>"><i class="ti-email"></i>
						Powiadomienia</a></li>
							<security:authorize access="hasAuthority('Manager')">
					<li><a class="sidebar-sub-toggle"><i class="ti-user"></i>
							Pracownicy <span class="sidebar-collapse-icon ti-angle-down"></span></a>
						<ul>
							<li><a href="<c:url value='/employees'/>">Lista
									pracowników</a></li>
							<li><a href="<c:url value='/add_employee'/>">Dodaj
									nowego pracownika</a></li>

						</ul></li>
				</security:authorize>
			
				
				<li><a href="<c:url value='/logout'/>"><i class="ti-close"></i>
						Wyloguj się</a></li>
			</ul>
		</div>
	</div>
</div>