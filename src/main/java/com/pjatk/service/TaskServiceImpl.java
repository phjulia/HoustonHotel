package com.pjatk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjatk.dao.TaskDAO;
import com.pjatk.models.Task;

@Service
public class TaskServiceImpl implements TaskService{


	@Autowired
	private TaskDAO taskDAO;

	@Override
	public List<Task> getTasks() {
		return taskDAO.getTasks();
		 
	}
	
	@Override
	public List<Task> getTasks1() {
		return taskDAO.getTasks1();
		 
	}
	
	@Override
	public List<Task> getTasks2() {
		return taskDAO.getTasks2();
		 
	}
	
	
//	@Override
//	public List<Task> getTasksEmp() {
//		return taskDAO.getTasksEmp();
//		 
//	}
	
	@Override
	public Task getTask(int id) {
		return taskDAO.getTask(id);
	}

	@Override
	public void assignTask(Task task) {
		taskDAO.assignTask(task);
		
	}
	
	@Override
	public void addTask(Task task) {
		taskDAO.addTask(task);
	}

	  

}
