package org.hj.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class LoginController {
	// 회원가입 페이지
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup () {
		System.out.println("move to signup page");
		return "signup";
	}
}
