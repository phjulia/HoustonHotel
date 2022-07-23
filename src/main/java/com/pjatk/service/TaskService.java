package com.pjatk.service;

import java.util.List;



import com.pjatk.models.Task;


public interface TaskService {
	
	public List<Task> getTasks();
	public List<Task> getTasks1();
	public List<Task> getTasks2();
	
	
//	public List<Task> getTasksEmp();
	public Task getTask(int id);
	public void assignTask(Task task);
	public void addTask(Task task);
}
