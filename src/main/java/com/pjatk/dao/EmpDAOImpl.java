package com.pjatk.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pjatk.helpers.EmpNotFoundException;
import com.pjatk.models.Emp;
import com.pjatk.models.Login;
import com.pjatk.models.Room;

import net.bytebuddy.utility.RandomString;
/**
 * @author Yuliia Likhytska
 */
@Repository
public class EmpDAOImpl implements EmpDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public Emp validateEmp(Login login) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String password = encoder.encode(login.getPassword());
		String sql = "SELECT email,pass FROM emp WHERE email=? AND pass=?";

		List<Emp> emp = null;
		try {
			emp = jdbcTemplate.query(sql, new Object[] { login.getEmail(), password },

					new RowMapper<Emp>() {
						public Emp mapRow(ResultSet rs, int row) throws SQLException {
							Emp emp = new Emp();

							emp.setEmail(rs.getString("email"));
							emp.setPassword(rs.getString("pass"));
							System.out.println(emp);

							return emp;
						}
					});
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		if (emp == null) {
			return null;
		}
		return (emp.size() > 0) ? emp.get(0) : null;
	}


	@Override
	public Integer findByEmail(String email) {
		String sql = "SELECT id FROM emp WHERE email=?";
		int id = 0;
		try {
			id = jdbcTemplate.queryForObject(sql, new Object[] { email }, Integer.class);
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		return id;
	}

	// returns ID of the emp
	@Override
	public Integer findByResetPasswordToken(String token) {
		String sql = "SELECT emp_id FROM passwordResetToken WHERE reset_password_token=?";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] { token }, Integer.class);
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Boolean isTokenExpired(String token) {
		String sql = "SELECT expiryDate FROM passwordResetToken WHERE reset_password_token=?";
		try {
			LocalDateTime expiryDate = jdbcTemplate.queryForObject(sql, new Object[] { token }, LocalDateTime.class);
			if (!expiryDate.isAfter(LocalDateTime.now())) {
				return true;
			}
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		return false;

	}

	@Override
	public String setResetPasswordToken(String email) throws EmpNotFoundException {
		String token = RandomString.make(30);
		Integer emp_id = findByEmail(email);
		if (emp_id == 0) {
			throw new EmpNotFoundException("Nie ma pracownika z takim adresem mailowym");
		}
		LocalDateTime expiryDate = LocalDateTime.now().plusMinutes(30);

		if (jdbcTemplate.queryForObject("SELECT COUNT(id) FROM passwordResetToken WHERE emp_id=?",
				new Object[] { emp_id }, Integer.class) == 1) {
			String sql = "UPDATE passwordResetToken SET reset_password_token=?,expiryDate=? WHERE emp_id=?";
			jdbcTemplate.update(sql, new Object[] { token, expiryDate, emp_id });
		} else {
			String sql = "INSERT INTO passwordResetToken(emp_id,reset_password_token,expiryDate) VALUES(?,?,?)";
			jdbcTemplate.update(sql, new Object[] { emp_id, token, expiryDate });
		}
		return token;
	}

	@Transactional
	@Override
	public String updatePass(int emp_id, String password) {
		String sql = "DELETE FROM passwordResetToken WHERE emp_id=?";
		String sql1 = "UPDATE emp SET pass=? WHERE id=?";
		BCryptPasswordEncoder enc = new BCryptPasswordEncoder();
		String encryped = enc.encode(password);
		jdbcTemplate.update(sql, new Object[] { emp_id });
		jdbcTemplate.update(sql1, new Object[] { encryped, emp_id });
		return jdbcTemplate.queryForObject("SELECT email FROM emp WHERE id=?", new Object[] { emp_id }, String.class);
	}

	@Override
	public void updateEmp(Emp emp) {
		try {
			if (emp.getFirst_name() == "" && emp.getLast_name() != "") {
				String sql = "UPDATE Emp SET last_name=? WHERE id=?";
				jdbcTemplate.update(sql, new Object[] { emp.getLast_name(), emp.getEmpId() });
			} else if (emp.getLast_name() == "" && emp.getFirst_name() != "") {
				String sql = "UPDATE Emp SET first_name=? WHERE id=?";
				jdbcTemplate.update(sql, new Object[] { emp.getFirst_name(), emp.getEmpId() });
			} else if (emp.getFirst_name() != "" && emp.getLast_name() != "") {
				String sql = "UPDATE Emp SET first_name=?,last_name=? WHERE id=?";
				jdbcTemplate.update(sql, new Object[] { emp.getFirst_name(), emp.getLast_name(), emp.getEmpId() });
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Emp getEmp(int id) {
		String sql = "SELECT * FROM Emp WHERE id=?";
		List<Emp> emp = null;
		try {
			emp = jdbcTemplate.query(sql, new Object[] { id },

					new RowMapper<Emp>() {
						public Emp mapRow(ResultSet rs, int row) throws SQLException {

							String job = jdbcTemplate.queryForObject("SELECT title FROM job WHERE id=?",
									new Object[] { rs.getInt("job_id") }, String.class);
							Emp emp = new Emp();
							emp.setEmpId(rs.getInt("id"));
							emp.setFirst_name(rs.getString("first_name"));
							emp.setLast_name(rs.getString("last_name"));
							emp.setPesel(rs.getString("pesel"));
							emp.setAddress(rs.getString("address"));
							emp.setHire_date(rs.getDate("hire_date").toString());
							emp.setBirth_date(rs.getDate("birth_date").toString());
							emp.setEmail(rs.getString("email"));
							emp.setPassword(rs.getString("pass"));
							emp.setJob(job);
							emp.setVacation_days(rs.getInt("vacation_days"));
							System.out.println(emp);

							return emp;
						}
					});
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		if (emp == null) {
			return null;
		}
		return (emp.size() > 0) ? emp.get(0) : null;
	}

	@Transactional
	@Override
	public void addEmp(Emp emp) {
		String sql = "INSERT INTO Emp(first_name, last_name, pesel, address, hire_date,birth_date,email,job_id) VALUES(?,?,?,?,?,?,?,?)";
		try {
			int job_id = jdbcTemplate.queryForObject("SELECT id FROM job WHERE title=?", new Object[] {emp.getJob()},
					Integer.class);
			jdbcTemplate.update(sql, new Object[] { emp.getFirst_name(), emp.getLast_name(), emp.getPesel(),
					emp.getAddress(), emp.getHire_date(), emp.getBirth_date(), emp.getEmail(), job_id });
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Emp findEmpByEmail(String email) {
		List<Emp> e = null;
		try {
			e = jdbcTemplate.query(
					"SELECT e.id, email,pass,r.name as role,isEnabled,e.first_name,e.last_name,e.vacation_days FROM emp e"
							+ " JOIN job j ON j.id=e.job_id JOIN empRole r ON r.id=j.role_id WHERE email=?",
					new Object[] { email }, new RowMapper<Emp>() {

						@Override
						public Emp mapRow(ResultSet rs, int rowNum) throws SQLException {
							Emp e = new Emp();
							e.setEmpId(rs.getInt("id"));
							e.setEmail(rs.getString("email"));
							e.setPassword(rs.getString("pass"));
							e.setRole(rs.getString("role"));
							e.setIsEnabled(rs.getBoolean("isEnabled"));
							e.setFirst_name(rs.getString("first_name"));
							e.setLast_name(rs.getString("last_name"));
							e.setVacation_days(rs.getInt("vacation_days"));
							return e;
						}
					});
		} catch (EmptyResultDataAccessException ex) {
			System.out.println("here in the exception body");
			ex.printStackTrace();
		}
		return (e.size() > 0) ? e.get(0) : null;
	}

	@Override
	public String getEmpRole(int emp_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int findByPesel(String pesel) {
		try {
			return jdbcTemplate.queryForObject("SELECT id FROM emp WHERE pesel=?", new Object[] { pesel },
					Integer.class);
		} catch (EmptyResultDataAccessException ex) {
			ex.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<String> getAllJobs() {
		List<String> jobs = new ArrayList<>();
		try {
			jobs = jdbcTemplate.queryForList("SELECT title FROM job", new Object[] {}, String.class);
		} catch (EmptyResultDataAccessException ex) {
			ex.printStackTrace();
		}
		return jobs;
	}

	public int count() {
		return jdbcTemplate.queryForObject("SELECT count(*) FROM Emp", Integer.class);
	}



	private Emp mapEmpResult(final ResultSet rs) throws SQLException {
		Emp emp = new Emp();
		emp.setEmpId(rs.getInt("id"));
		emp.setFirst_name(rs.getString("first_name"));
		emp.setLast_name(rs.getString("last_name"));
		emp.setPesel(rs.getString("pesel"));
		emp.setAddress(rs.getString("address"));
		emp.setHire_date(rs.getString("hire_date").toString());
		emp.setBirth_date(rs.getString("birth_date").toString());
		emp.setEmail(rs.getString("email"));
		emp.setJob(rs.getString("job"));
		return emp;
	}
	public Page<Emp> findAll(Pageable page) {
		Order order = !page.getSort().isEmpty() ? page.getSort().toList().get(0) : Order.by("ID");
		List<Emp> emps = jdbcTemplate.query("SELECT e.id,first_name,last_name,pesel,address,hire_date,birth_date,email,pass,r.name as role,j.title as job FROM Emp e JOIN job j ON j.id=e.job_id JOIN empRole r ON r.id=j.role_id ORDER BY " + order.getProperty() + " "
				+ order.getDirection().name() + " LIMIT " + page.getPageSize() + " OFFSET " + page.getOffset(),
				(rs, rowNum) -> mapEmpResult(rs));
		return new PageImpl<Emp>(emps, page, count());
	}


	@Override
	public Page<Emp> findAll(String job, PageRequest page) {
		Order order = !page.getSort().isEmpty() ? page.getSort().toList().get(0) : Order.by("ID");
		List<Emp> emps = jdbcTemplate.query("SELECT e.id,first_name,last_name,pesel,address,hire_date,birth_date,email,pass,r.name as role,j.title as job FROM Emp e JOIN job j ON j.id=e.job_id JOIN empRole r ON r.id=j.role_id WHERE j.title=? ORDER BY " + order.getProperty() + " "
				+ order.getDirection().name() + " LIMIT " + page.getPageSize() + " OFFSET " + page.getOffset(),new Object[]{job},
				(rs, rowNum) -> mapEmpResult(rs));
		return new PageImpl<Emp>(emps, page, emps.size());
	}


}
