package com.example.vinfast.api.admin;

import com.example.vinfast.model.DriverAssist;
import com.example.vinfast.service.IDriverAssistService;
import com.example.vinfast.service.impl.DriverAssistService;
import com.example.vinfast.util.HttpUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = "/api-driver-assist")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,  // 2 MB
        maxFileSize = 1024 * 1024 * 10,       // 10 MB
        maxRequestSize = 1024 * 1024 * 50     // 50 MB
)
public class DriverAssistAPI extends HttpServlet {

    private IDriverAssistService dao = new DriverAssistService();
    Map<String, Object> response = new HashMap<>();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        DriverAssist da = dao.findOne(id);
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
            DriverAssist da = HttpUtil.of(req.getReader()).toModel(DriverAssist.class);
            dao.updateDriverAssist(da);
            response.put("message", "Cập nhập thành công!!");
        }else if(type.equals("add")){
            DriverAssist da = HttpUtil.of(req.getReader()).toModel(DriverAssist.class);
            dao.createDriverAssist(da);
            response.put("message", "Thêm thành công!!");
        }
        new ObjectMapper().writeValue(resp.getWriter(), response);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        dao.deleteDriverAssist(id);
        response.put("message", "Xóa thành công!!");
        new ObjectMapper().writeValue(resp.getWriter(), response);
    }
}
