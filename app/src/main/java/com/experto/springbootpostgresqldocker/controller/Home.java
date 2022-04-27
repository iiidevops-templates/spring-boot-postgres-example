package com.experto.springbootpostgresqldocker.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Home {

    @RequestMapping(value="/", method = RequestMethod.GET)
    public String home() {
        return "{網站URL}/user/all: GET會顯示全部資料庫內的使用者 <br> {網站URL}/user/{id}: GET會顯示該id的使用者資訊 <br> {網站URL}/user/save: POST新增使用者到資料庫 <br> 詳細可看readme說明";
    }

	@RequestMapping(value="/hello", method = RequestMethod.GET)
	public String index() {
		return "Greetings from Spring Boot!";
	}
}
