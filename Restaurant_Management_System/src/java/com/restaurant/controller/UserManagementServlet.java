package com.restaurant.controller;
 
import com.restaurant.model.User;
import com.restaurant.service.UserService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/users/*")
public class UserManagementServlet extends HttpServlet {
    private UserService userService;
    @Override
    public void init() {
        this.userService = new UserService();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        if (action == null || action.equals("/")) {
            // List all users
            request.setAttribute("users", userService.getAllUsers());
            request.getRequestDispatcher("/views/users.jsp").forward(request, response);
        } else if (action.equals("/new")) {
            // Show new user form
            request.getRequestDispatcher("/views/new-user.jsp").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        if (action.equals("/create")) {
            // Create new user
            User user = new User();
            user.setUsername(request.getParameter("username"));
            user.setPassword(request.getParameter("password"));
            user.setEmail(request.getParameter("email"));
            user.setFullName(request.getParameter("fullName"));
            user.setRole(request.getParameter("role"));
            boolean success = userService.registerUser(user);
            if (success) {
                response.sendRedirect(request.getContextPath() + "/users");
            } else {
                request.setAttribute("error", "Failed to create user");
                request.getRequestDispatcher("/views/new-user.jsp").forward(request, response);
            }
        } else if (action.equals("/update-role")) {
            // Update user role
            int userId = Integer.parseInt(request.getParameter("userId"));
            String role = request.getParameter("role");
            boolean success = userService.updateUserRole(userId, role);
            response.sendRedirect(request.getContextPath() + "/users");
        } else if (action.equals("/delete")) {
            // Delete user
            int userId = Integer.parseInt(request.getParameter("userId"));
            boolean success = userService.deleteUser(userId);
            response.sendRedirect(request.getContextPath() + "/users");
        }
    }
}