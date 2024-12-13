package com.example.vinfast.dto;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChangePassRequest {
    private String oldPassword;
    private String newPassword;
    private String renewPassword;
}