package Session;

import java.util.List;

import Entity.Project;
import Entity.Task;
import jakarta.ejb.Local;

@Local
public interface ProjectDao {

	void createProject(Project project);

	void deleteProject(Project project);

	void updateProject(Project project);

	Project getProjectById(int id);

	public boolean projectExists(String projectCode);

	Project getProjectByCode(String code);

	List<Project> getAllProjects();

	public List<String> projectCodes();



}
