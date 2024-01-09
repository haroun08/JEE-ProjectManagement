package controllers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import Entity.Task;
import Session.ProjectDao;
import Session.TaskDao;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.ProjectModel;
import models.TaskModel;

@WebServlet("/TaskController")
public class TaskController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(name = "taskBean")
	private TaskDao taskDAO;

	@EJB(name = "projectBean")
	private ProjectDao projectDAO;

	private TaskModel taskModel;

	@Override
	public void init() throws ServletException {
		taskModel = new TaskModel();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		TaskModel tmodel = new TaskModel();

		List<String> optionsList = projectDAO.projectCodes();

		tmodel.setOptionsList(optionsList);

		request.setAttribute("model", tmodel);

		if (action != null) {
			switch (action) {
			case "listTasks":
				listTasks(request, response);
				break;
			case "showTasks":
				showTasks(request, response);
				break;
			case "createTask":
				createTask(request, response);
				break;
			case "updateTask":
				updateTask(request, response);
				break;
			case "removeTask":
				removeTask(request, response);
				break;
			default:
				showErrorPage(request, response, "Action parameter not provided");
			}
		} else {
			showErrorPage(request, response, "Action parameter not provided");
		}
	}

	private void listTasks(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Task> tasks = taskDAO.getAllTasks();
		taskModel.setTasks(tasks);

		request.setAttribute("taskModel", taskModel);
		request.getRequestDispatcher("/listTasks.jsp").forward(request, response);
	}

	private void showTasks(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    List<Task> tasks = taskDAO.getAllTasks(); 

	    if (!tasks.isEmpty()) {
	        request.setAttribute("tasks", tasks);
	        request.getRequestDispatcher("/task.jsp").forward(request, response);
	    } else {
	        showErrorPage(request, response, "No tasks found");
	    }
	}


	private void createTask(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("/createTask.jsp");
		dispatcher.forward(request, response);

		taskModel.getTask().setCode(request.getParameter("code"));
		taskModel.getTask().setDescription(request.getParameter("description"));
		taskModel.getTask().setStartDate(parseDate(request.getParameter("startdate")));
		taskModel.getTask().setEndDate(parseDate(request.getParameter("enddate")));
		taskModel.getTask().setProject(projectDAO.getProjectByCode(request.getParameter("projectCode")));

		taskDAO.createTask(taskModel.getTask());

		response.sendRedirect(request.getContextPath() + "/successRemoveTask.jsp");
	}

	private void updateTask(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TaskModel model = (TaskModel) request.getAttribute("model");
		
		String code = request.getParameter("code");
		Task task = taskDAO.getTaskById(code);
//		System.out.println("this is task"+task);
		if (task != null) {
			model.setTask(task);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/updateTask.jsp");
			dispatcher.forward(request, response);
			model.getTask().setDescription(request.getParameter("description"));
			model.getTask().setStartDate(parseDate(request.getParameter("startdate")));
			model.getTask().setEndDate(parseDate(request.getParameter("enddate")));
			model.getTask().setProject(projectDAO.getProjectByCode(request.getParameter("projectCode")));

			taskDAO.updateTask(task);
			response.sendRedirect(request.getContextPath() + "/successUpdateTask.jsp");
		} else {
			showErrorPage(request, response, "Task-- not found");
		}
	}

	private void removeTask(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		Task task = taskDAO.getTaskById(code);

		if (task != null) {
			taskDAO.deleteTask(task.getCode());

			response.sendRedirect(request.getContextPath() + "/successRemoveTask.jsp");
		} else {
			showErrorPage(request, response, "Task not found");
		}
	}

	private Date parseDate(String dateString) {
		try {
			if (dateString != null && !dateString.isEmpty()) {
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				dateFormat.setLenient(false);
				return dateFormat.parse(dateString);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	private void showErrorPage(HttpServletRequest request, HttpServletResponse response, String errorMessage)
			throws ServletException, IOException {
		request.setAttribute("errors", errorMessage);
		request.getRequestDispatcher("/error.jsp").forward(request, response);
	}

}
