package com.experto.springbootpostgresqldocker.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Home {

    @RequestMapping("/")
    public String home() {
        return "{網站URL}/user/all: 會顯示全部資料庫內的使用者 <br> {網站URL}/user/{id}: 會顯示該id的使用者資訊";
    }

}
