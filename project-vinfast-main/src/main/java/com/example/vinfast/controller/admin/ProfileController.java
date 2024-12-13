package com.example.vinfast.controller.admin;

import com.example.vinfast.dto.ChangePassRequest;
import com.example.vinfast.model.Users;
import com.example.vinfast.service.IUserService;
import com.example.vinfast.service.impl.UserService;
import com.example.vinfast.util.Argon2Util;
import com.example.vinfast.util.HttpUtil;
import com.example.vinfast.util.SessionUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = "/admin-profile")
public class ProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
        Users user = (Users) SessionUtil.getInstance().getValue(request, "INFUSER");
        request.setAttribute("user", user);
        RequestDispatcher rd = request.getRequestDispatcher("views/admin/profile.jsp");
        rd.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action"); // Lấy action từ query string
        request.setCharacterEncoding("UTF-8"); // Xử lý ký tự Unicode (UTF-8)
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        IUserService dao = new UserService();
        Users user = (Users)SessionUtil.getInstance().getValue(request, "INFUSER");
        if(action != null && action.equals("updpr")){
            Users userRequest = HttpUtil.of(request.getReader()).toModel(Users.class);
            Map<String, String> res = new HashMap<>();
            dao.updateInformation(userRequest);
            SessionUtil.getInstance().removeValue(request, "INFUSER");
            SessionUtil.getInstance().setValue(request ,"INFUSER",  userRequest);
            res.put("status", "success");
            new ObjectMapper().writeValue(response.getWriter(), res);
        }else if(action != null && action.equals("updprP")){
            String email = user.getEmail();
            ChangePassRequest changePassO = HttpUtil.of(request.getReader()).toModel(ChangePassRequest.class);
            String password = changePassO.getOldPassword();
            Users check = dao.validEmailAndPassword(email, password);
            Map<String, String> res = new HashMap<>();
            if(check != null){
                if(changePassO.getNewPassword().equals(changePassO.getRenewPassword())){
                    String newPass = Argon2Util.encyptPass(changePassO.getNewPassword());
                    dao.changePassword(email,newPass);
                    res.put("status", "success");
                }else{
                    res.put("status", "recheck");
                }
            }else{
                res.put("status", "error");
            }
            new ObjectMapper().writeValue(response.getWriter(), res);
        }
    }
}