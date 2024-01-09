package controllers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import Entity.Project;
import Entity.Task;
import Session.ProjectDao;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.ProjectModel;

@WebServlet("/ProjectController")
public class ProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(name = "projectBean")
	private ProjectDao projectDao;

	public ProjectController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProjectModel pmodel = new ProjectModel();
		request.setAttribute("model", pmodel);

		String action = request.getParameter("action");

		if (action != null) {
			switch (action) {
			case "listProjects":
				listProjects(request, response);
				break;
			case "showProjects":
				showProjects(request, response);
				break;
			case "createProject":
				createProject(request, response);
				break;
			case "updateProject":
				updateProject(request, response);
				break;
			case "removeProject":
				removeProject(request, response);
				break;
			default:
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		} else {
			showErrorPage(request, response, "Action parameter not provided");
		}
	}

	private void createProject(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    ProjectModel model = (ProjectModel) request.getAttribute("model");

	    try {
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/createProject.jsp");
	        dispatcher.forward(request, response);

	        model.getProject().setCode(request.getParameter("code"));
	        model.getProject().setDescription(request.getParameter("description"));
	        model.getProject().setStartDate(parseDate(request.getParameter("startdate")));

	        projectDao.createProject(model.getProject());

	        response.sendRedirect(request.getContextPath() + "/successInsertProject.jsp");
	    } catch (Exception e) {
	        request.setAttribute("errorMessage", "Failed to insert project: " + e.getMessage());
	        RequestDispatcher errorDispatcher = request.getRequestDispatcher("/failedInsertProject.jsp");
	        errorDispatcher.forward(request, response);
	    }
	}


	private void updateProject(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProjectModel model = (ProjectModel) request.getAttribute("model");
		String code = request.getParameter("code");
		Project project = projectDao.getProjectByCode(code);
		
		if (project != null) {
			model.setProject(project);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/updateProject.jsp");
			dispatcher.forward(request, response);
			model.getProject().setDescription(request.getParameter("description"));
			model.getProject().setStartDate(parseDate(request.getParameter("startdate")));
			projectDao.updateProject(model.getProject());

			response.sendRedirect(request.getContextPath() + "/successUpdateProject.jsp");

		} else {
			showErrorPage(request, response, "Project not found");
		}
	}

	private void removeProject(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		Project project = projectDao.getProjectByCode(code);

		if (project != null) {
			projectDao.deleteProject(project);

			response.sendRedirect(request.getContextPath() + "/successRemoveProject.jsp");
		} else {
			showErrorPage(request, response, "Project not found");
		}
	}

	private void listProjects(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProjectModel model = (ProjectModel) request.getAttribute("model");
		List<Project> projects = projectDao.getAllProjects();
		model.setProjects(projects);

		request.setAttribute("pmodel", model);
		request.setAttribute("projects", projects);
		request.getRequestDispatcher("/listProjects.jsp").forward(request, response);
	}

	private void showProjects(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	    List<Project> projects = projectDao.getAllProjects(); 

	    if (!projects.isEmpty()) {
	        request.setAttribute("projects", projects);
	        request.getRequestDispatcher("/project.jsp").forward(request, response);
	    } else {
	        showErrorPage(request, response, "No Projects found");
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
