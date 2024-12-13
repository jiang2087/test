package com.example.vinfast.api.admin;

import com.example.vinfast.model.Users;
import com.example.vinfast.service.IUserService;
import com.example.vinfast.util.HttpUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(urlPatterns = "/api-admin-newUser")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,  // 2 MB
        maxFileSize = 1024 * 1024 * 10,       // 10 MB
        maxRequestSize = 1024 * 1024 * 50     // 50 MB
)
public class UserApi extends HttpServlet {
    @Inject
    private IUserService userService;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if ("PATCH".equalsIgnoreCase(request.getMethod())) {
            doPatch(request, response);
        } else {
            super.service(request, response);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        // mapping json to model
        Users user = HttpUtil.of(req.getReader()).toModel(Users.class);
        user.setPassword("user123");
        userService.createAccount(user);
    }

    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        Users user = HttpUtil.of(req.getReader()).toModel(Users.class);
        userService.updateInformation(user);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        Users user = HttpUtil.of(req.getReader()).toModel(Users.class);
        userService.deleteAccount(user.getUserId());
    }

    protected void doPatch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String fileName = null;
//        if (req.getPart("file") != null) {
//            fileName = UploadUtil.saveFileImage(req.getPart("file"), req);
//        }
//        Map<String, String> responData = new HashMap<>();
//        responData.put("fileName", fileName);
//        new ObjectMapper().writeValue(resp.getOutputStream(), responData);
    }
}
