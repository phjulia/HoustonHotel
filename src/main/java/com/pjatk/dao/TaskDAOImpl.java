package com.pjatk.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import com.pjatk.models.Guest;
import com.pjatk.models.Task;
import com.pjatk.dao.TaskDAOImpl;

@Repository
public class TaskDAOImpl implements TaskDAO{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Task> getTasks() {
		
		
		return jdbcTemplate.query("select * from Task WHERE assignee IS NULL", new RowMapper<Task>() {
			public Task mapRow(ResultSet rs,int row) throws SQLException{

//				String sql = "select last_name from emp where id=?";
//				String assignee=null;
						
//						jdbcTemplate.queryForObject(
//		                sql, new Object[]{rs.getInt("id")}, String.class);
				
				Task task = new Task();
					    task.setTaskId(rs.getInt("id"));
						task.setName(rs.getString("name"));
						task.setDescription(rs.getString("description"));
						task.setAssignee(rs.getString("assignee"));
						task.setAssignedBy(rs.getInt("assignedBy"));
				
				System.out.println(task);
				return task;
			}
		});
	
	}
	
	@Override
	public List<Task> getTasks1() {
		
	int empId = jdbcTemplate.queryForObject("SELECT id FROM emp WHERE email=?", 
	new Object[] {SecurityContextHolder.getContext().getAuthentication().getName()},Integer.class);

		
		return jdbcTemplate.query("select * from Task WHERE assignee=?",new Object[] {empId}, new RowMapper<Task>() {
			public Task mapRow(ResultSet rs,int row) throws SQLException{
				
				Task task = new Task();
			    task.setTaskId(rs.getInt("id"));
				task.setName(rs.getString("name"));
				task.setDescription(rs.getString("description"));
				task.setAssignee(rs.getString("assignee"));
				task.setAssignedBy(rs.getInt("assignedBy"));
				System.out.println(task);
				return task;
			}
		});
	
	}
	
	@Override
	public List<Task> getTasks2() {
		
	int empId = jdbcTemplate.queryForObject("SELECT id FROM emp WHERE email=?", 
	new Object[] {SecurityContextHolder.getContext().getAuthentication().getName()},Integer.class);

		
		return jdbcTemplate.query("select * from Task WHERE assignedBy=?",new Object[] {empId}, new RowMapper<Task>() {
			public Task mapRow(ResultSet rs,int row) throws SQLException{
				
				Task task = new Task();
			    task.setTaskId(rs.getInt("id"));
				task.setName(rs.getString("name"));
				task.setDescription(rs.getString("description"));
				task.setAssignee(rs.getString("assignee"));
				task.setAssignedBy(rs.getInt("assignedBy"));
				System.out.println(task);
				return task;
			}
		});
	 
	}
	
	
//	@Override
//	public List<Task> getTasksEmp() {
//		
////		int empId = jdbcTemplate.queryForObject("SELECT id FROM emp WHERE email=?", 
////				new Object[] {SecurityContextHolder.getContext().getAuthentication().getName()},Integer.class);
//		
//		
////		int empId = 2;
//		
//		return jdbcTemplate.query("select * from Task", new RowMapper<Task>() {
//			public Task mapRow(ResultSet rs,int row) throws SQLException{
//				
//				Task taskEmp = new Task(rs.getInt("id"),
//						rs.getString("name"),
//						rs.getString("description"),
//						rs.getInt("assignee"),
//						rs.getInt("assignedBy"));
//				System.out.println(taskEmp);
//				return taskEmp;
//			}
//		});
//	
//	}
	
	
	
	@Override
	public void assignTask(Task task) {
		
	int assiBy = jdbcTemplate.queryForObject("SELECT id FROM emp WHERE email=?", 
	new Object[] {SecurityContextHolder.getContext().getAuthentication().getName()},Integer.class);

	String assigneeSql = "SELECT id FROM Emp WHERE last_name=?";
	int assigneeId = jdbcTemplate.queryForObject(assigneeSql, new Object[] {task.getAssignee()},Integer.class);
			
		String sql="UPDATE Task SET assignee=?, assignedBy=? WHERE id=?";
		jdbcTemplate.update(sql,new Object[] {
				assigneeId,assiBy,task.getTaskId()});
	}

	@Override
	public Task getTask(int id) {
		

		String allAssignees="SELECT last_name FROM emp ORDER BY 1 ASC";
		
		String sql0="SELECT * FROM Task WHERE id=?";
		
		
		
		Task task = jdbcTemplate.queryForObject(sql0, 
			new Object[] {id}, new RowMapper<Task>() 
		{
		public Task mapRow(ResultSet rs,int row) throws SQLException{
			
//			String sql = "select last_name from emp where id=?";
//			String assignee=null;
//					jdbcTemplate.queryForObject(
//	                sql, new Object[]{rs.getInt("id")}, String.class);
			
//			Task task= new Task(rs.getInt("id"),
//					rs.getString("name"),
//					rs.getString("description"),
//					assignee,
//					rs.getInt("assignedBy"));
			
			Task task = new Task();
		    task.setTaskId(rs.getInt("id"));
			task.setName(rs.getString("name"));
			task.setDescription(rs.getString("description"));
			task.setAssignee(rs.getString("assignee"));
			task.setAssignedBy(rs.getInt("assignedBy"));



			List<String> assignees = jdbcTemplate.query(allAssignees, new Object[] {},
					new RowMapper<String>() {
				public String mapRow(ResultSet rs,int row) throws SQLException{
					return rs.getString("last_name");
				}
			});
			task.setAssignees(assignees);
			
			
			return task;
		}
	});
		return task;
	}
	
	

	@Override
	public void addTask(Task task) {
		String sql="INSERT INTO task (name,description) VALUES (?,?);";
		System.out.println(sql);
		jdbcTemplate.update(sql,new Object[] {task.getName(),task.getDescription()});
		
	}

	
}
	
