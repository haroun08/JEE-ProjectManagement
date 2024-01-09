package Session;

import java.util.List;

import Entity.Task;
import jakarta.ejb.Local;

@Local
public interface TaskDao {
	void createTask(Task task);

	void updateTask(Task task);

	void deleteTask(String taskId);

	Task getTaskById(String taskId);

	List<Task> getAllTasks();
	

}