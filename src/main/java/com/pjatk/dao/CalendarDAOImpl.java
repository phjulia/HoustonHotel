package com.pjatk.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pjatk.helpers.Helpers;
import com.pjatk.models.Emp;
import com.pjatk.models.Vacation;
import com.pjatk.service.EmpService;
/**
 * @author Yuliia Likhytska
 */
@Repository
public class CalendarDAOImpl implements CalendarDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private EmpService empService;

	@Transactional
	@Override
	public void addVacation(Vacation vacation) {
		System.out.println(vacation);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-M-dd");
		String date_from = vacation.getDate_from().substring(0, 10);
		String date_to = vacation.getDate_to().substring(0, 10);
		try {
			String sql = "INSERT INTO Vacation(date_from,date_to,emp_id,vacationDays) VALUES(?,?,?,?)";
			// convert String to LocalDate
			LocalDate localDateFrom = Helpers.getLocalDate(date_from, formatter);
			LocalDate localDateTo = Helpers.getLocalDate(date_to, formatter);
			Emp e = empService.findEmpByEmail(vacation.getEmp_email());
			/* * NEW APPROVAL REQUEST IS ADDED IN THE TRIGGER* */
			long vacDays = getVacationDays(localDateFrom, localDateTo);
			jdbcTemplate.update(sql, localDateFrom, localDateTo, e.getEmpId(), Math.toIntExact(vacDays));
		} catch (DataAccessException e) {
			e.printStackTrace();
		}

	}
    
	public long getVacationDays(LocalDate datefrom, LocalDate dateto) {
		try {
			Set<DayOfWeek> businessDays = new HashSet<>();
			businessDays.add(DayOfWeek.MONDAY);
			businessDays.add(DayOfWeek.TUESDAY);
			businessDays.add(DayOfWeek.WEDNESDAY);
			businessDays.add(DayOfWeek.THURSDAY);
			businessDays.add(DayOfWeek.FRIDAY);

			final List<LocalDate> holidays = new ArrayList<LocalDate>();
			holidays.add(LocalDate.of(2022, 6, 5));
			holidays.add(LocalDate.of(2022, 6, 16));
			holidays.add(LocalDate.of(2022, 8, 15));
			holidays.add(LocalDate.of(2022, 11, 1));
			holidays.add(LocalDate.of(2022, 11, 11));
			holidays.add(LocalDate.of(2022, 12, 11));
			holidays.add(LocalDate.of(2022, 12, 12));
			holidays.add(LocalDate.of(2023, 1, 1));
			holidays.add(LocalDate.of(2023, 1, 6));
			/* * * Non inclusive hence +1 * * */

			long numOfDaysBetween = ChronoUnit.DAYS.between(datefrom, dateto) + 1;
			long days = IntStream.iterate(0, i -> i + 1).limit(numOfDaysBetween).mapToObj(i -> datefrom.plusDays(i))
					.filter(t -> businessDays.contains(t.getDayOfWeek())).filter(t -> !holidays.contains(t)).count();

			return days;
		} catch (DataAccessException e) {

		}
		return 0;
	}

	@Override
	public List<Vacation> getApprovedVacations(String loggedUser) {

		List<Vacation> vacations = null;
		try {
			vacations = jdbcTemplate.query(
					"SELECT date_from,date_to,emp_id,CONCAT(e.first_name,' ',e.last_name) as emp FROM Vacation v "
							+ "JOIN Emp e ON e.id=v.emp_id WHERE email=? AND is_approved=true",
					new Object[] { loggedUser }, new RowMapper<Vacation>() {
						public Vacation mapRow(ResultSet rs, int row) throws SQLException {
							Vacation v = new Vacation();
							v.setDate_from(rs.getString("date_from"));
							v.setDate_to(rs.getString("date_to"));
							v.setEmp(rs.getString("emp"));
							return v;
						}
					});
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return vacations;
	}

	@Override
	public int getVacationDays(String loggedUser) {
		int vacation_days = 0;
		if (loggedUser == null) {
			return 0;
		}
		try {
			String sql = "SELECT vacation_days FROM Emp WHERE email=?";
			vacation_days = jdbcTemplate.queryForObject(sql, new Object[] { loggedUser }, Integer.class);
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		return vacation_days;
	}

	@Override
	public List<Vacation> getVacations(String loggedUser) {

		List<Vacation> vacations = jdbcTemplate.query(
				"SELECT date_from,date_to,emp_id,v.id id,CONCAT(e.first_name,' ',e.last_name) as emp"
						+ " FROM Vacation v JOIN Emp e ON e.id=v.emp_id WHERE e.email=? AND is_approved=false AND is_rejected=false",
				new Object[] { loggedUser }, new RowMapper<Vacation>() {
					public Vacation mapRow(ResultSet rs, int row) throws SQLException {
						Vacation v = new Vacation(rs.getString("date_from"), rs.getString("date_to"),
								rs.getInt("emp_id"));
						v.setId(rs.getInt("id"));
						v.setEmp(rs.getString("emp"));
						return v;
					}
				});
		return vacations;
	}

	@Transactional
	@Override
	public void removeVacation(Vacation vacation) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-M-dd");
		LocalDate date_from = Helpers.getLocalDate(vacation.getDate_from().substring(0, 10),formatter);
		LocalDate date_to = Helpers.getLocalDate(vacation.getDate_to().substring(0, 10),formatter);
		try {
			Emp e = empService.findEmpByEmail(vacation.getEmp_email());
			System.out.println("deleting vacation" +vacation.getEmp_id());
		
			jdbcTemplate.update("DELETE FROM Vacation WHERE emp_id=? AND date_from=? AND date_to=?", new Object[] { e.getEmpId(),
					date_from,date_to });
		} catch (DataAccessException ex) {
			ex.printStackTrace();
		}
	}

	@Override
	public List<Vacation> getAllVacations() {
		List<Vacation> vacations = null;
		try {
			vacations = jdbcTemplate.query(
					"SELECT date_from,date_to,CONCAT(e.first_name,' ',e.last_name) as emp"
							+ " FROM Vacation v JOIN Emp e ON e.id=v.emp_id WHERE is_approved=true",
					new Object[] {}, new RowMapper<Vacation>() {
						public Vacation mapRow(ResultSet rs, int row) throws SQLException {
							Vacation v = new Vacation();
							v.setDate_from(rs.getString("date_from"));
							v.setDate_to(rs.getString("date_to"));
							v.setEmp(rs.getString("emp"));
							return v;
						}
					});
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return vacations;
	}

	@Override
	public List<Vacation> getFilteredVacations(String dateFrom, String dateTo) {
	
		List<Vacation> vacations = null;
		try {
			vacations = jdbcTemplate.query(
					"SELECT date_from,date_to,CONCAT(e.first_name,' ',e.last_name) as emp"
							+ " FROM Vacation v JOIN Emp e ON e.id=v.emp_id WHERE is_approved=true AND date_from>=? AND date_to<=? ORDER BY date_from",
					new Object[] {dateFrom,dateTo}, new RowMapper<Vacation>() {
						public Vacation mapRow(ResultSet rs, int row) throws SQLException {
							Vacation v = new Vacation();
							v.setDate_from(rs.getString("date_from"));
							v.setDate_to(rs.getString("date_to"));
							v.setEmp(rs.getString("emp"));
							return v;
						}
					});
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return vacations;
	};

}
