package com.cafe24.springex.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {
	
	@RequestMapping("/hello")
	public String hello() {
		return "/WEB-INF/views/hello.jsp";
		
	}
	
	@RequestMapping("/hello2")
	public ModelAndView hello2() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("email", "lucy74310@gmail.com"); // key-value 
		mav.setViewName("/WEB-INF/views/hello.jsp");
		
		return mav;
	}
	
	@RequestMapping("/hello3")
	public String hello3(Model model) {
		model.addAttribute("email", "dooly@gamil.com");
		
		
		return "/WEB-INF/views/hello.jsp";
	}
	
	@RequestMapping("/hello4")
	public String hello4(
			Model model,
			@RequestParam("e") String email, // e 파라미터 안주면  HTTP Status 400 – Bad Request //어노테이션에 value생략시 변수이름으로 request parameter name 값을 찾는다. 
			@RequestParam String name /*("")는 사실 (value="") 이다. 어노테이션에 value 뒤에 required=true 해줄때는 value 이름 줘야한다*/) { 
		model.addAttribute("email", email);
		model.addAttribute("name", name);
		
		return "/WEB-INF/views/hello.jsp";
	}
	
	/* 기술이 침투 했기 때문에 비추천 */
	@RequestMapping("/hello5")
	public String hello5(
			Model model,
			HttpServletRequest request) {
		String name = request.getParameter("name");
		String email =request.getParameter("email");
		
		model.addAttribute("email", email);
		model.addAttribute("name", name);
		
		return "/WEB-INF/views/hello.jsp";
	}
}	
