package com.pjatk.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pjatk.helpers.Constants;
import com.pjatk.models.Request;
import com.pjatk.models.Vacation;
import com.pjatk.models.Emp;
/**
 * @author Yuliia Likhytska
 */
@Repository
public class RequestDAOImpl implements RequestDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public Vacation getVacation(int vacation_id) {
		String sql = "select date_from,date_to,emp_id,is_approved from vacation where id=?";
		return jdbcTemplate.queryForObject(sql, new Object[] { vacation_id }, new RowMapper<Vacation>() {
			public Vacation mapRow(ResultSet rs, int row) throws SQLException {
				return new Vacation(rs.getString("date_from"), rs.getString("date_to"), rs.getInt("emp_id"),
						rs.getBoolean("is_approved"));
			}

		});
	}

	public List<Vacation> getConcurrentVacations(int job_id, String date_from, String date_to, int requestor) {
		String sql = "SELECT date_from,date_to,emp_id,is_approved,CONCAT(e.first_name,\" \",e.last_name) emp  FROM vacation v "
				+ "JOIN emp e ON e.id=v.emp_id JOIN job j ON j.id=e.job_id "
				+ "WHERE j.id=? AND is_approved=true AND ((DATE(date_to) >= ? AND DATE(date_to) <= ?) "
				+ " OR(DATE(date_from)<= ? AND DATE(date_from) > ?) "
				+ "	OR(DATE(date_from)<= ? AND DATE(date_to) >= ?)) AND e.id<>?";
		
		
		List<Vacation> v = jdbcTemplate.query(sql,
				new Object[] { job_id, date_from, date_to, date_to, date_from,date_from,date_to, requestor }, new RowMapper<Vacation>() {

					public Vacation mapRow(ResultSet rs, int row) throws SQLException {
			
						Vacation vacation = new Vacation(rs.getString("date_from"), rs.getString("date_to"),
								rs.getInt("emp_id"), rs.getBoolean("is_approved"));
						vacation.setEmp(rs.getString("emp"));
						
						return vacation;
					}
				});
		return v;
	}

	@Override
	public Map<Request, List<Vacation>> getRequests() {
		Map<Request, List<Vacation>> rv = new HashMap<>();

		try {
			
			List<Request> requests = jdbcTemplate.query("select * from approvalRequest where request_status=? ORDER BY id ASC",
					new Object[] { Constants.SUBMITTED }, new RowMapper<Request>() {
						public Request mapRow(ResultSet rs, int row) throws SQLException {
							
							String sql = "select id,first_name,last_name,email,vacation_days,job_id from emp where id=?";
							String sql2 = "select title from job where id=?";

							System.out.println("******rs.getInt(vacation_id)" + rs.getInt("vacation_id"));
							Vacation vacation = getVacation(rs.getInt("vacation_id"));


							List<Emp> requestorList = jdbcTemplate.query(sql, new Object[] { vacation.getEmp_id() },
									new RowMapper<Emp>() {
								public Emp mapRow(ResultSet rs, int row) throws SQLException {
								Emp e = new Emp();
								e.setEmpId(vacation.getEmp_id());
								e.setFirst_name(rs.getString("first_name"));
								e.setLast_name(rs.getString("last_name"));
								e.setEmail(rs.getString("email"));
								e.setVacation_days(rs.getInt("vacation_days"));
								e.setJob_id(rs.getInt("job_id"));
								return e;
								}
							});
							Emp requestor = (requestorList.size()>0?requestorList.get(0):null);
							System.out.println("**************"+requestor);
							/* * * * * * * * * SET REQUESTOR'S JOB TITLE* * * * * * * * */
							if(requestor!=null) {
								String job = jdbcTemplate.queryForObject(sql2, new Object[] { requestor.getJob_id(), }, String.class);
								requestor.setJob(job);
								Request request = new Request();
								request.setId(rs.getInt("id"));
								request.setVacation(vacation);
								request.setRequestor(requestor);
								request.setCommentary(rs.getString("commentary"));
								request.setRequestor_vacation_days(Constants.VACATION_DAYS-requestor.getVacation_days());
								System.out.println("************Request: " + request);
								List<Vacation> vacations = getConcurrentVacations(requestor.getJob_id(), vacation.getDate_from(),
										vacation.getDate_to(),vacation.getEmp_id());
								System.out.println("************Request: " + vacations);
								rv.put(request, vacations);
								System.out.println(rv);
								return request;
							}
							return null;
						}

					});
			System.out.println(requests);
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		for (List<Vacation> m : rv.values()) {
			System.out.println("aaaa " + m);

		}

		return rv;
	}

	@Transactional
	@Override
	public void approveRequest(Request request) {
		
		String updateRequest = "UPDATE approvalRequest SET request_status=? WHERE id=?";
		String approve = "UPDATE vacation SET is_approved=?,reviewed_by=? WHERE id=?";

		jdbcTemplate.update(updateRequest, new Object[] { Constants.APPROVED, request.getId() });
		jdbcTemplate.update(approve, new Object[] { true,getLoggedUserId(), getApprovalRequestId(request)});
	}
	@Transactional
	@Override
	public void rejectRequest(Request request) {
		String sql = "UPDATE approvalRequest SET request_status=?,commentary=? WHERE id=?";
		String sql1 = "UPDATE vacation SET is_rejected=?,reviewed_by=? WHERE id=?";
		
		jdbcTemplate.update(sql1, new Object[] { true,getLoggedUserId(), getApprovalRequestId(request)});
		jdbcTemplate.update(sql,
				new Object[] { Constants.REJECTED, request.getCommentary(), request.getId() });
		
	}
	
	public int getApprovalRequestId(Request request) {
		System.out.println(request);
		return jdbcTemplate.queryForObject("select vacation_id from approvalRequest where id=?",
				new Object[] { request.getId() }, Integer.class);
	}
	public int getLoggedUserId() {
		return jdbcTemplate.queryForObject("SELECT id FROM emp WHERE email=?", 
				new Object[] {SecurityContextHolder.getContext().getAuthentication().getName()},Integer.class);
	}

}
