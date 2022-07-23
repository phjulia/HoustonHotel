package com.pjatk.dao;

import java.util.List;

import com.pjatk.models.Task;

public interface TaskDAO {
	public List<Task> getTasks();
	public List<Task> getTasks1();
	public List<Task> getTasks2();
	
	
//	public List<Task> getTasksEmp();
	
	public void assignTask(Task task);
	public Task getTask(int id);
	public void addTask(Task task);
}
