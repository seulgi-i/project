package com.team.upbank.injune.auth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/auth")
public class AuthContoller {

    @GetMapping("/login")
    public String loginPage(HttpServletRequest request, HttpServletResponse response) {
        return "chaey/login";
    }
}
