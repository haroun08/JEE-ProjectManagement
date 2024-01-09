package Session.implementation;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import Entity.Task;
import Session.TaskDao;

import java.util.List;

@Stateless(name = "taskBean")
public class TaskDaoImpl implements TaskDao {

    @PersistenceContext(unitName = "HarounUnit")
    private EntityManager entityManager;

    @Override
    public void createTask(Task task) {
        entityManager.persist(task);
    }

    @Override
    public void updateTask(Task task) {
        entityManager.merge(task);
    }

    @Override
    public void deleteTask(String taskId) {
        Task task = getTaskById(taskId);
        if (task != null) {
            entityManager.remove(task);
        }
    }

    @Override
    public Task getTaskById(String taskId) {
        return entityManager.find(Task.class, taskId);
    }

    @Override
    public List<Task> getAllTasks() {
        return entityManager.createQuery("SELECT t FROM Task t JOIN FETCH t.project", Task.class).getResultList();
    }



}
