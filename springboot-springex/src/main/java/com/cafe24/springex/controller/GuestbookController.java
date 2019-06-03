package com.cafe24.springex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/*
 * @RequestMapping
 * type 단독 매핑
 * 
 */
@RequestMapping("/guestbook/*")
@Controller
public class GuestbookController {
	
	@ResponseBody
	@RequestMapping //관례..로 하면 나중에 생각안남. 명시해주는게 좋다 /guestbook/*하면 list()로 다 온다.  
	public String list() {
		return "GuestbookController:list";
	}

}
