package com.example.vinfast.api.web;

import com.example.vinfast.model.Users;
import com.example.vinfast.service.IUserService;
import com.example.vinfast.util.HttpUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet(urlPatterns = "/api-user")
public class UserAPI extends HttpServlet {
    @Inject private IUserService userService;

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        Users user = HttpUtil.of(req.getReader()).toModel(Users.class);
        userService.updateInformation(user);
        mapper.writeValue(resp.getOutputStream(), user);
    }
}
