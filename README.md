# JEE-ProjectManagement
This project aims to develop a partial Java Enterprise Edition (JEE) application that assists project managers in planning and managing projects effectively. The application facilitates the creation of tasks, assignment of resources to tasks, and management of temporal constraints, resource skills, leaves, and holidays to achieve optimal project durations.

The architecture of the application comprises two sub-projects:

EJB Sub-project:

Contains two Entity Beans: Project and Task.
Defines two local interfaces: ProjectDao and TaskDao.
Implements two stateless session beans: ProjectDaoImpl and TaskDaoImpl.
Web Sub-project:

Consists of Java classes: ProjectController, TaskController, ProjectModel, and TaskModel.
Includes JSP pages for various functionalities such as project and task management, listing projects and tasks, and success/failure notifications for operations.
This project architecture facilitates the development of a comprehensive project management tool with features tailored to the needs of project planners and managers. The modular structure allows for scalability and easy integration of additional functionalities.

MVC Architecture
