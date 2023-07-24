package com.dojo.bookclubproject.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class Login {

    @NotEmpty(message = "Email is required!")
    @Email(message = "Please enter a valid email!")
    private String email;

    @NotEmpty(message = "Password is required!")
    @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters!")
    @Pattern(regexp = "^(?=.*[A-Z])(?=.*\\d).*$", message = "Password must contain at least one capital letter and two numbers")
    private String password;

    public Login() {

    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
