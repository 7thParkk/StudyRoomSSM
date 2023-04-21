package com.cc.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EditUser {
    private String userName;
    private String userPassword;
    private String confirmPassword;
    private String userProfile;
}
