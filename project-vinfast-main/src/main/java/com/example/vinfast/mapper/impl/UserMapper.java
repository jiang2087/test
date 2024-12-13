package com.example.vinfast.mapper.impl;

import com.example.vinfast.mapper.IRowMappers;
import com.example.vinfast.model.Car;
import com.example.vinfast.model.InteriorFeatures;
import com.example.vinfast.model.Users;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class UserMapper implements IRowMappers<Users> {

    private static final Class<?> clazz = Users.class;

//    private static final Map<String, Field> fieldCache = new HashMap<>();
//
//    @Override
//    public Users rowMapper(ResultSet rs) {
//        Users user = new Users();
//        try {
//            ResultSetMetaData rsmd = rs.getMetaData();
//            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
//                String columnName = rsmd.getColumnName(i);
//                String fieldName = columnName.substring(0, 1).toLowerCase() + columnName.substring(1);
//
//                Field field = fieldCache.computeIfAbsent(fieldName, key -> {
//                    try {
//                        Field f = clazz.getDeclaredField(key);
//                        f.setAccessible(true);
//                        return f;
//                    } catch (NoSuchFieldException e) {
//                        return null;
//                    }
//                });
//                Object value = rs.getObject(fieldName);
//                if (field != null) {
//                    if (value instanceof java.sql.Date) {
//                        field.set(user, ((java.sql.Date) value).toLocalDate());
//                    } else if (value instanceof java.sql.Timestamp) {
//                        field.set(user, ((java.sql.Timestamp) value).toLocalDateTime());
//                    } else {
//                        field.set(user, value);
//                    }
//                }
//            }
//        } catch (SQLException | IllegalAccessException e) {
//            throw new RuntimeException(e);
//        }
//        return user;
//    }

    @Override
    public Users rowMapper(ResultSet rs) {
        Users inf = new Users();
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                String name = rsmd.getColumnName(i);
                name = name.substring(0, 1).toLowerCase() + name.substring(1);
                setProperty(inf, name, rs.getObject(name));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return inf;
    }

    @Override
    public void setProperty(Users inf, String fieldName, Object o) {
        try {
            Field field = clazz.getDeclaredField(fieldName);
            field.setAccessible(true);
            field.set(inf, o);
        } catch (NoSuchFieldException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

}
