package com.experto.springbootpostgresqldocker.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Home {

    @RequestMapping(value="/", method = RequestMethod.GET)
    public String home() {
        return "{����URL}/user/all: GET�|��ܥ�����Ʈw�����ϥΪ� <br> {����URL}/user/{id}: GET�|��ܸ�id���ϥΪ̸�T <br> {����URL}/user/save: POST�s�W�ϥΪ̨��Ʈw <br> �Բӥi��readme����";
    }

	@RequestMapping(value="/hello", method = RequestMethod.GET)
	public String index() {
		return "Greetings from Spring Boot!";
	}
}
