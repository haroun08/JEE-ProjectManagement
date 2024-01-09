package Session.implementation;

import Entity.Project;
import Entity.Task;
import Session.ProjectDao;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Stateless(name = "projectBean")
public class ProjectDaoImpl implements ProjectDao {

	private static final Logger LOGGER = Logger.getLogger(ProjectDaoImpl.class.getName());

	@PersistenceContext(unitName = "HarounUnit")
	private EntityManager entityManager;



	@Override
	public void createProject(Project project) {
		entityManager.persist(project);
	}

	@Override
	public void deleteProject(Project project) {
		entityManager.remove(entityManager.contains(project) ? project : entityManager.merge(project));
	}

	@Override
	public void updateProject(Project project) {
		entityManager.merge(project);
	}

	@Override
	public Project getProjectById(int id) {
		return entityManager.find(Project.class, id);
	}

	@Override
	public List<Project> getAllProjects() {
		try {
			List<Project> resultList = entityManager.createQuery("SELECT p FROM Project p", Project.class)
					.getResultList();
			return resultList;
		} catch (Exception e) {
			LOGGER.log(Level.SEVERE, "Error retrieving all projects", e);
			return Collections.emptyList();
		}
	}

	public Project getProjectByCode(String code) {
		List<Project> resultList = entityManager
				.createQuery("SELECT p FROM Project p WHERE p.code = :code", Project.class).setParameter("code", code)
				.getResultList();

		return resultList.isEmpty() ? null : resultList.get(0);
	}

	public boolean projectExists(String projectCode) {
		String queryString = "SELECT COUNT(p) FROM Project p WHERE p.code = :projectCode";
		Long count = entityManager.createQuery(queryString, Long.class).setParameter("projectCode", projectCode)
				.getSingleResult();

		return count > 0;
	}

	@Override
	public List<String> projectCodes() {
		String reqJPQL = "select p.code from Project p";
		Query query = entityManager.createQuery(reqJPQL);
		List<String> codes = (List<String>) query.getResultList();
		return codes;
	}
}
