package com.pjatk.dao;
/**
 * @author Yuliia Likhytska
 */
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class EmailDAOImpl implements EmailDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Transactional
	@Override
	public void saveEmailToDatabase(String recepient, String subject, String message, int sender) {
		try {
			jdbcTemplate.update("INSERT INTO email(recepient,subject,message,sender) VALUES(?,?,?,?)",
					new Object[] { recepient, subject, message, sender });

		} catch (DataAccessException e) {
			e.printStackTrace();
		}

	}
}
