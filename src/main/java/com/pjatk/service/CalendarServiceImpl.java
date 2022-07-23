package com.pjatk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjatk.dao.CalendarDAO;
import com.pjatk.models.Vacation;
/**
 * @author Yuliia Likhytska
 */
@Service
public class CalendarServiceImpl implements CalendarService{
	
	@Autowired
	private CalendarDAO calendarDAO;

	@Override
	public void addVacation(Vacation vacation) {
		calendarDAO.addVacation(vacation);
	}

	@Override
	public List<Vacation> getApprovedVacations(String loggedUser) {
		return calendarDAO.getApprovedVacations(loggedUser);
	}

	@Override
	public int getVacationDays(String loggedUser) {
		return calendarDAO.getVacationDays(loggedUser);
	}
	@Override
	public List<Vacation> getVacations(String loggedUser){
		return calendarDAO.getVacations(loggedUser);
	}

	@Override
	public void removeVacation(Vacation vacation) {
		calendarDAO.removeVacation(vacation);
	}

	@Override
	public List<Vacation> getAllVacations() {
		return calendarDAO.getAllVacations();
	}

	@Override
	public List<Vacation> getFilteredVacations(String dateFrom, String dateTo) {
		return calendarDAO.getFilteredVacations(dateFrom,dateTo);
	}
	
}
