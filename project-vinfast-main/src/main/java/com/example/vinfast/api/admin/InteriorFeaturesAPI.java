package com.example.vinfast.api.admin;

import com.example.vinfast.model.DriverAssist;
import com.example.vinfast.model.InteriorFeatures;
import com.example.vinfast.service.IInteriorFeaturesService;
import com.example.vinfast.service.impl.InteriorFeaturesService;
import com.example.vinfast.util.HttpUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = "/api-interior-features")
public class InteriorFeaturesAPI extends HttpServlet {
    
    private IInteriorFeaturesService dao = new InteriorFeaturesService();
    Map<String, Object> response = new HashMap<>();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        InteriorFeatures da = dao.findOne(id);
        System.out.println(da);
        response.put("data", da);
        new ObjectMapper().writeValue(resp.getWriter(), response);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        response.clear();
        if(type.equals("edit")){
            int id = Integer.parseInt(req.getParameter("id"));
            InteriorFeatures da = HttpUtil.of(req.getReader()).toModel(InteriorFeatures.class);
            dao.updateInteriorFeatures(da);
            response.put("message", "Cập nhập thành công!!");
        }else if(type.equals("add")){
            InteriorFeatures da = HttpUtil.of(req.getReader()).toModel(InteriorFeatures.class);
            dao.createInteriorFeatures(da);
            response.put("message", "Thêm thành công!!");
        }
        new ObjectMapper().writeValue(resp.getWriter(), response);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        dao.deleteInteriorFeatures(id);
        response.clear();
        response.put("message", "Xóa thành công");
        new ObjectMapper().writeValue(resp.getWriter(), response);
    }
}
