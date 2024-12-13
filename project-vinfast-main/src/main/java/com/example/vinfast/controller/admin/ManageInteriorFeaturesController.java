package com.example.vinfast.controller.admin;

import com.example.vinfast.model.InteriorFeatures;
import com.example.vinfast.service.IInteriorFeaturesService;
import com.example.vinfast.service.impl.InteriorFeaturesService;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/admin-interior-features")
public class ManageInteriorFeaturesController extends HttpServlet {
    IInteriorFeaturesService dao = new InteriorFeaturesService();
    Map<String, String> res = new HashMap<>();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        List<InteriorFeatures> list = new ArrayList<InteriorFeatures>();
        list = dao.findAll();
        req.setAttribute("list", list);
        RequestDispatcher dp = req.getRequestDispatcher("views/admin/manage-data/manage_interior_features.jsp");
        dp.forward(req, resp);
    }
}

