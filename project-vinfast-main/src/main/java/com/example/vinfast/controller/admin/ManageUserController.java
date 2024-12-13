package com.example.vinfast.controller.admin;


import com.example.vinfast.model.Users;
import com.example.vinfast.service.IUserService;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/admin-users", "/edit-user"})
public class ManageUserController extends HttpServlet {

    @Inject
    private IUserService userService;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Users> users = userService.findAll();
        req.setAttribute("users", users);
        String view = "views/admin/manage-data/manage_user.jsp";
        RequestDispatcher rd = req.getRequestDispatcher(view);
        rd.forward(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var id = Integer.parseInt(req.getParameter("id"));

        userService.deleteAccount(id);

        Map<String, String> response = new HashMap<>();
        response.put("message", "Tài khoản đã bị chặn quyền truy cập");
        response.put("status", "success");
    }
}
