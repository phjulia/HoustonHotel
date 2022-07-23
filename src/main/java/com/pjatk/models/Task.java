package com.pjatk.models;

import java.io.Serializable;
import java.util.List;

import com.pjatk.service.TaskService;

public class Task implements Serializable{
	private static final long serialVersionUID =1L;
	private Integer taskId;
	private String name;
	private String description;
	private String assignee;
	private int assignedBy;

	
	private List<String> assignees;

	
	public Task() {
		super();
	}

	public Task(Integer taskId, String name,  String description,  String assignee,  int assignedBy) 
	{
		super();
		this.taskId = taskId;
		this.name = name;
		this.description = description;
		this.assignee = assignee;
		this.assignedBy=assignedBy;
		
	}
	public Integer getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAssignee() {
		return assignee;
	}
	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}
	public int getAssignedBy() {
		return assignedBy;
	}
	public void setAssignedBy(int assignedBy) {
		this.assignedBy = assignedBy;
	}
	
	public List<String> getAssignees() {
		return assignees;
	}

	public void setAssignees(List<String> assignees) {
		this.assignees = assignees;
	}
	
	@Override
	public String toString() {
		return "Task [TaskId=" + taskId + ", Name=" + name + ", Description=" + description + ", Assignee=" + assignee
				+ ", AssignedBy=" + assignedBy + ", assignees=" + assignees + "]";
	}

	

}
