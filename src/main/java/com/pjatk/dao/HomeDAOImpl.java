package com.pjatk.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.pjatk.models.Booking;
/**
 * @author Yuliia Likhytska
 */
@Repository
public class HomeDAOImpl implements HomeDAO{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int getBookingsCountThisMonth() {
		String sql = "SELECT COUNT(id) FROM booking WHERE MONTH(start)=MONTH(curdate())";
		int numOfBookings=jdbcTemplate.queryForObject(sql,new Object[] {},Integer.class);
		return numOfBookings;
	}
	@Override
	public int getBookingsCountLastMonth() {

		String sql = "SELECT COUNT(id) FROM booking WHERE MONTH(start)=(MONTH(curdate())-1)";
		int numOfBookings=jdbcTemplate.queryForObject(sql,new Object[] {},Integer.class);
		return numOfBookings;
	}
	@Override
	public List<Booking> getLatestBookings() {
		String sql= "SELECT created_date,b.id, CONCAT(start,' - ',end) as booking_date,"
				+ "r.pricePerNight*DATEDIFF(end,start) as bookingPrice,"
				+ "r.roomNum,CONCAT(g.first_name,' ',g.last_name) as name FROM booking b "
				+ "JOIN room r ON b.room_id=r.id "
				+ "JOIN guest g ON b.guest_id=g.id ORDER BY created_date DESC";
		List <Booking> latestBookings = jdbcTemplate.query(sql, new Object[] {},
				new RowMapper<Booking>(){
			public Booking mapRow(ResultSet rs, int row) throws SQLException{
				Booking booking = new Booking(
						rs.getInt("id"),
						rs.getString("created_date"),
						rs.getString("booking_date"),
						rs.getInt("roomNum"));
				booking.setBooking_price(rs.getInt("bookingPrice"));
				booking.setGuest_name(rs.getString("name"));
				return booking;
			}
		});
		return latestBookings;
	}
	@Override
	public int getOccupiedRooms() {
		String sql="SELECT COUNT(id) FROM room WHERE isAvailable=false";
		return jdbcTemplate.queryForObject(sql,new Object[] {},Integer.class);
	}
	@Override
	public int getAvailableRooms() {
		String sql="SELECT COUNT(id) FROM room WHERE isAvailable=true";
		return jdbcTemplate.queryForObject(sql,new Object[] {},Integer.class);
	}
	@Override
	public int getInactiveRooms() {
		String sql="SELECT COUNT(id) FROM room WHERE isActive=false";
		return jdbcTemplate.queryForObject(sql,new Object[] {},Integer.class);
	}
	@Override
	public int getAllBookingsCount() {
		return jdbcTemplate.queryForObject("SELECT COUNT(id) allbookings FROM booking",new Object[] {},Integer.class);
	}
}
