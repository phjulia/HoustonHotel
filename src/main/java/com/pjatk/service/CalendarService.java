package com.pjatk.service;

import java.util.List;

import com.pjatk.models.Vacation;
/**
 * @author Yuliia Likhytska
 */
public interface CalendarService {
	public void addVacation(Vacation vacation);
	public List<Vacation> getApprovedVacations(String loggedUser);
	public int getVacationDays(String loggedUser);
	public List<Vacation> getVacations(String loggedUser);
	public void removeVacation(Vacation vacation);
	public List<Vacation> getAllVacations();
	public List<Vacation> getFilteredVacations(String dateFrom, String dateTo);
}
