package com.restaurant.controller;

import com.restaurant.model.MenuItem;
import com.restaurant.service.MenuService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/menu/*")


public class MenuServlet extends HttpServlet {
    private MenuService menuService;

    @Override
    public void init() {
        menuService = new MenuService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();

        if (action == null || action.equals("/")) {
            // List all menu items by category
            request.setAttribute("categories", menuService.getAllCategories());
            request.setAttribute("menuItems", menuService.getAllMenuItems());
            request.getRequestDispatcher("/views/menu.jsp").forward(request, response);
        } else if (action.equals("/new")) {
            // Show form for new menu item
            request.setAttribute("categories", menuService.getAllCategories());
            request.getRequestDispatcher("/views/new-menu-item.jsp").forward(request, response);
        } else {
            // Fallback
            response.sendRedirect(request.getContextPath() + "/menu");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();

        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/menu");
            return;
        }

        switch (action) {
            case "/create":
                handleCreate(request, response);
                break;

            case "/update-availability":
                handleUpdateAvailability(request, response);
                break;

            default:
                response.sendRedirect(request.getContextPath() + "/menu");
        }
    }

    private void handleCreate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String categoryIdStr = request.getParameter("categoryId");
            String itemName = request.getParameter("itemName");
            String description = request.getParameter("description");
            String priceStr = request.getParameter("price");
            String imagePath = request.getParameter("imagePath");
            String isAvailableStr = request.getParameter("isAvailable");

            // Validate required fields
            if (categoryIdStr == null || itemName == null || priceStr == null) {
                request.setAttribute("error", "Required fields are missing.");
                request.setAttribute("categories", menuService.getAllCategories());
                request.getRequestDispatcher("/views/new-menu-item.jsp").forward(request, response);
                return;
            }

            MenuItem item = new MenuItem();
            item.setCategoryId(Integer.parseInt(categoryIdStr));
            item.setItemName(itemName);
            item.setDescription(description != null ? description : "");
            item.setPrice(Double.parseDouble(priceStr));
            item.setImagePath(imagePath != null && !imagePath.isEmpty() ? imagePath : "food-5.jpg ");

            item.setAvailable("true".equalsIgnoreCase(isAvailableStr) || "on".equalsIgnoreCase(isAvailableStr));

            boolean success = menuService.addMenuItem(item);

            if (success) {
                response.sendRedirect(request.getContextPath() + "/menu");
            } else {
                request.setAttribute("error", "Failed to add menu item.");
                request.setAttribute("categories", menuService.getAllCategories());
                request.getRequestDispatcher("/views/new-menu-item.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid numeric value entered.");
            request.setAttribute("categories", menuService.getAllCategories());
            request.getRequestDispatcher("/views/new-menu-item.jsp").forward(request, response);
        }
    }

    private void handleUpdateAvailability(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            String itemIdStr = request.getParameter("itemId");
            String isAvailableStr = request.getParameter("isAvailable");

            if (itemIdStr != null && isAvailableStr != null) {
                int itemId = Integer.parseInt(itemIdStr);
                boolean isAvailable = Boolean.parseBoolean(isAvailableStr);

                menuService.updateItemAvailability(itemId, isAvailable);
            }
        } catch (NumberFormatException e) {
            // Log the error if necessary
        }

        response.sendRedirect(request.getContextPath() + "/menu");
    }
}
