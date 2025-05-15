package com.restaurant.controller;

import com.restaurant.model.MenuCategory;
import com.restaurant.service.MenuService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/menu-categories/*")
public class MenuCategoryServlet extends HttpServlet {
    private MenuService menuService;
    
    @Override
    public void init() {
        this.menuService = new MenuService();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        
        if (action == null || action.equals("/")) {
            // List all categories
            request.setAttribute("categories", menuService.getAllCategories());
            request.getRequestDispatcher("/views/menu-categories.jsp").forward(request, response);
        } else if (action.equals("/new")) {
            // Show new category form
            request.getRequestDispatcher("/views/new-menu-category.jsp").forward(request, response);
        } else if (action.equals("/edit")) {
            // Show edit category form
            int categoryId = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("category", menuService.getCategoryById(categoryId));
            request.getRequestDispatcher("/views/edit-menu-category.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        
        if (action.equals("/create")) {
            // Create new category
            MenuCategory category = new MenuCategory();
            category.setCategoryName(request.getParameter("categoryName"));
            category.setDescription(request.getParameter("description"));
            
            boolean success = menuService.addCategory(category);
            if (success) {
                response.sendRedirect(request.getContextPath() + "/menu-categories");
            } else {
                request.setAttribute("error", "Failed to add category");
                request.getRequestDispatcher("/views/new-menu-category.jsp").forward(request, response);
            }
        } else if (action.equals("/update")) {
            // Update category
            MenuCategory category = new MenuCategory();
            category.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
            category.setCategoryName(request.getParameter("categoryName"));
            category.setDescription(request.getParameter("description"));
            
            boolean success = menuService.updateCategory(category);
            if (success) {
                response.sendRedirect(request.getContextPath() + "/menu-categories");
            } else {
                request.setAttribute("error", "Failed to update category");
                request.setAttribute("category", category);
                request.getRequestDispatcher("/views/edit-menu-category.jsp").forward(request, response);
            }
        } else if (action.equals("/delete")) {
            // Delete category
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            
            boolean success = menuService.deleteCategory(categoryId);
            response.sendRedirect(request.getContextPath() + "/menu-categories");
        }
    }
}