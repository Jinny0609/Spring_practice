package org.hj.controller;

import javax.servlet.http.HttpSession;

import org.hj.model.LoginVO;
import org.hj.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    
    // 로그인 페이지에서 로그인하면 로그인 유지한상태로 deatil(mypage)로 이동
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(HttpSession session, LoginVO member, Model model) {
        LoginVO loginMember = ls.login(member);
        if (loginMember == null) {
            return "/member/login";
        } else {
            System.out.println("login");
            session.setAttribute("login", loginMember);		// 세션에 저장되어 있는 값을 넘기기 (자바명령어로 ,스크립트나 불러오기)
            model.addAttribute("detail", ls.memdetail(loginMember));
            return "member/detail";
        }
    }

    
    // 회원 정보(mypage)
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String memberDetail(LoginVO login, Model model){
    	model.addAttribute("detail", ls.memdetail(login));
    	return "member/detail";
    }
    
    // 회원정보 수정(mypage_modify)
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String memberModify(LoginVO login, RedirectAttributes rttr) {
    	ls.memberModify(login);
    	rttr.addAttribute("id",login.getId());
    	return "redirect:/detail";
    }
    
    // 회원정보 삭제(mypage_remove)
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(LoginVO login) {
    	ls.memberRemove(login);
    	return "redirect:/list";
    }
}
