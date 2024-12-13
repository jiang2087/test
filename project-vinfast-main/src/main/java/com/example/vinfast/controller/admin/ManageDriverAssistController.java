package com.example.vinfast.controller.admin;

import com.example.vinfast.model.DriverAssist;
import com.example.vinfast.service.IDriverAssistService;
import com.example.vinfast.service.impl.DriverAssistService;

import com.example.vinfast.util.HttpUtil;
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

@WebServlet(urlPatterns = "/admin-driver-assisst")
public class ManageDriverAssistController extends HttpServlet {
    IDriverAssistService dao = new DriverAssistService();
    Map<String, Object> res = new HashMap<>();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        List<DriverAssist> list = new ArrayList<DriverAssist>();
        list = dao.findAll();
        res.clear();
        request.setAttribute("list", list);
        RequestDispatcher dp = request.getRequestDispatcher("views/admin/manage-data/manage_driver_assist.jsp");
        dp.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String type = request.getParameter("type");
        res.clear();
        if(type.equals("edit")){
            DriverAssist da = HttpUtil.of(request.getReader()).toModel(DriverAssist.class);
            dao.updateDriverAssist(da);
            res.put("message", "Sửa thành công!!");
        }else if(type.equals("addc")){
            DriverAssist da = HttpUtil.of(request.getReader()).toModel(DriverAssist.class);
            dao.createDriverAssist(da);
            res.put("message", "Thêm thành công!!");
        }

        new ObjectMapper().writeValue(response.getWriter(), res);
    }
}
