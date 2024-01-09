package models;

import java.util.ArrayList;
import java.util.List;

import Entity.Project;

public class ProjectModel {

	private String errors;
	private String mode = "createProject";
	private List<Project> projects = new ArrayList<>();
	private Project project = new Project();

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

	public List<Project> getProjects() {
		return projects;
	}

	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

}
