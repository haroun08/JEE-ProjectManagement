package models;

import Entity.Project;
import Entity.Task;

import java.util.ArrayList;
import java.util.List;

public class TaskModel {

	private Project project;
	private String errors;
	private String mode = "createTask";
	private List<Task> tasks = new ArrayList<>();
	private Task task = new Task();
    private List<String> optionsList;

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public String getErrors() {
		return errors;
	}

	public void setErrors(String errors) {
		this.errors = errors;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public List<Task> getTasks() {
		return tasks;
	}

	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public List<Task> getTaskList() {
		return tasks;
	}

	public void setTaskList(List<Task> taskList) {
		this.tasks = taskList;
	}

	public List<String> getOptionsList() {
		return optionsList;
	}

	public void setOptionsList(List<String> optionsList) {
		this.optionsList = optionsList;
	}
}
