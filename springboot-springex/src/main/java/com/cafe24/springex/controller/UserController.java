package com.cafe24.springex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/*
 * @RequestMapping
 * type + method
 * 
 */
@Controller 
@RequestMapping("/user") // type
public class UserController {
	
	//@ResponseBody //메세징 message-converter
	@RequestMapping(value="/join", method=RequestMethod.GET) // POST : HTTP Status 405 – Method Not Allowed GET으로 써야한다
	//@GetMapping("/join") 완전동일
	public String join() {
		return "/WEB-INF/views/join.jsp";
	}
	
	// 오버 로드 
	
	//@ResponseBody 
	@RequestMapping(value= {"/join", "/user/j"}, method=RequestMethod.POST ) // method
	//@PostMapping({"/join", "j"}) 완전동일
	public String join(@ModelAttribute UserVo userVo) { // 자동으로 requestparam이 된다.
		//@ModelAttribute 써야 들어갔었다. 
		
		if( valid(userVo ) == false) { // 에러나면 포워딩
			return "/WEB-INF/views/join.jsp";
			
		}
		System.out.println(userVo);
		
		//성공하면 리다이렉트 
		return "redirect:/hello";
	}
	
	private boolean valid(UserVo userVo) {
		return false;
	}
	

}
