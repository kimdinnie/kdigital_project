package com.fokefoke.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;


@Controller
@RequestMapping("/admin/*")
@Log4j2
public class AdminController {
	
	// 관리자 메인 페이지 이동
	@GetMapping(value = "/main")
	public void adminMainGET() throws Exception {
		log.info("관리자 페이지 진입");
	}

}