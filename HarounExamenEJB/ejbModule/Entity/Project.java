package Entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "Project")
public class Project implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	private String code;

	private String description;
	private Date startDate;

	@OneToMany(mappedBy = "project", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Task> tasks;

	public Project() {
		this.tasks = new ArrayList<>();
	}

	public Project(String code, String description, Date startDate) {
		super();
		this.code = code;
		this.description = description;
		this.startDate = startDate;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public List<Task> getTasks() {
		return tasks;
	}

	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}

	@Override
	public String toString() {
		return "Project [code=" + code + ", description=" + description + ", startDate=" + startDate + "]";
	}

	public void addTaskToProject(Task task) {
		if (tasks == null) {
			tasks = new ArrayList<>();
		}
		tasks.add(task);
		task.setProject(this);
	}

	public void removeTaskFromProject(Task task) {
		if (tasks != null) {
			tasks.remove(task);
			task.setProject(null);
		}
	}

}
