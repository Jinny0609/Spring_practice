package org.hj.controller;

import javax.servlet.http.HttpSession;

import org.hj.model.LoginVO;
import org.hj.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@Autowired
	LoginService ls;
	
	// 회원가입
    @RequestMapping(value = "signup", method = RequestMethod.GET)
    public String signup () {
        System.out.println("move to signup page");
        return "/member/signup";
    }

    // 회원가입서버(미완)
    @RequestMapping(value = "signup", method = RequestMethod.POST)
    public String signupPost (LoginVO member) {
    	System.out.println("move to login page");
    	ls.memreg(member);
    	return "/member/login";
    }
    
    // 로그인 페이지에서 로그인하면 로그인 유지한상태로 홈으로 이동
    @RequestMapping(value = "login", method = RequestMethod.POST)
	public String login (HttpSession session, LoginVO member) {
		
		if(ls.login(member)==null) {
			return "/member/login";
		}else {
			System.out.println("login");
			session.setAttribute("login", ls.login(member));
			return "redirect:/";	//나중에 홈말고 다른곳으로 mypage로 이동하게 변경
		}
	}
    
}
