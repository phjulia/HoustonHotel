package com.pjatk.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Order;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pjatk.models.Room;
/**
 * @author Yuliia Likhytska
 */
@Repository
public class RoomDAOImpl implements RoomDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Transactional
	@Override
	public void updateRoom(Room room) {
		try {
			String categorySql = "SELECT id FROM Category WHERE name=?";
			int categoryId = jdbcTemplate.queryForObject(categorySql, new Object[] { room.getCategory() },
					Integer.class);
			String sql = "UPDATE Room SET isActive=?,categoryId=?,pricePerNight=? WHERE id=?";
			jdbcTemplate.update(sql,
					new Object[] { room.isActive(), categoryId, room.getPricePerNight(), room.getRoomId() });
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Room getRoom(int id) {
		Room room=null;
		String allCategories = "SELECT name FROM Category";
		try {
			room = jdbcTemplate.queryForObject(
					"SELECT r.id id,r.roomNum,cat.name category,cl.name class,r.pricePerNight,isActive FROM Room r "
							+ "JOIN Category cat ON cat.id=r.categoryId JOIN Class cl ON cl.id=r.classId WHERE r.id=?",new Object[] { id },
							new RowMapper<Room>() {
					public Room mapRow(ResultSet rs, int row) throws SQLException {
							Room room = new Room();
							room.setRoomId(rs.getInt("id"));
							room.setRoomNumber(rs.getInt("roomNum"));
							room.setPictureLocation(rs.getInt("roomNum") + ".jpeg");
							room.setClassName(rs.getString("class"));
							room.setCategory(rs.getString("category"));
							room.setPricePerNight(rs.getInt("pricePerNight"));
							room.setActive(rs.getBoolean("isActive"));
							
							List<String> categories = jdbcTemplate.query(allCategories, new Object[] {}, new RowMapper<String>() {
								public String mapRow(ResultSet rs, int row) throws SQLException {
									return rs.getString("name");
								}
							});
								room.setCategories(categories);
							return room;
						}
					});
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return room;
	}

	public int count() {
		return jdbcTemplate.queryForObject("SELECT count(*) FROM Room", Integer.class);
	}
	public int count(int minPrice, int maxPrice) {
		return jdbcTemplate.queryForObject("SELECT count(*) FROM Room WHERE pricePerNight>=? AND pricePerNight<=?",new Object[] {minPrice,maxPrice}, Integer.class);
	}



	private Room mapRoomResult(final ResultSet rs) throws SQLException {
		Room room = new Room();
		room.setRoomId(rs.getInt("id"));
		room.setRoomNumber(rs.getInt("roomNum"));
		room.setPictureLocation(rs.getInt("roomNum") + ".jpeg");
		room.setClassName(rs.getString("class"));
		room.setCategory(rs.getString("category"));
		room.setPricePerNight(rs.getInt("pricePerNight"));
		room.setActive(rs.getBoolean("isActive"));
		List<String> categories = jdbcTemplate.query("SELECT name FROM Category", new Object[] {}, new RowMapper<String>() {
		public String mapRow(ResultSet rs, int row) throws SQLException {
			return rs.getString("name");
		}
	});
	room.setCategories(categories);
	return room;

	}
	@Override
	public Page<Room> findAll(PageRequest page) {
		Order order = !page.getSort().isEmpty() ? page.getSort().toList().get(0) : Order.by("ID");
		List<Room> rooms = jdbcTemplate.query("SELECT r.id id,r.roomNum,cat.name category,cl.name class,r.pricePerNight,isActive FROM Room r"
				+ "	JOIN Category cat ON cat.id=r.categoryId JOIN Class cl ON cl.id=r.classId ORDER BY " + order.getProperty() + " "
				+ order.getDirection().name() + " LIMIT " + page.getPageSize() + " OFFSET " + page.getOffset(),
				(rs, rowNum) -> mapRoomResult(rs));
		return new PageImpl<Room>(rooms, page, count());
	}

	@Override
	public Page<Room> findAll(int minPrice, int maxPrice, PageRequest page) {
		Order order = !page.getSort().isEmpty() ? page.getSort().toList().get(0) : Order.by("ID");
		List<Room> rooms = jdbcTemplate.query("SELECT r.id id,r.roomNum,cat.name category,cl.name class,r.pricePerNight,isActive FROM Room r"
				+ "	JOIN Category cat ON cat.id=r.categoryId JOIN Class cl ON cl.id=r.classId WHERE r.pricePerNight>=? AND r.pricePerNight<=? ORDER BY " + order.getProperty() + " "
				+ order.getDirection().name() + " LIMIT " + page.getPageSize() + " OFFSET " + page.getOffset(), new Object[] {minPrice,maxPrice},
				(rs, rowNum) -> mapRoomResult(rs));
		
		return new PageImpl<Room>(rooms, page, count(minPrice,maxPrice));
	}
}