package com.example.vinfast.dao;

import com.example.vinfast.model.Users;

import java.util.List;

public interface IUsersDAO {
    int checkAccountExistence(String email);

    void createAccount(Users user);

    Users findUserByEmail(String email);

    void updateAccount(Users user);

    void changePassword(String email, String newPassword);

    List<Users> findAllUsers();

    void deleteUser(int id);

    Users findById(int id);
}
