package com.tasteforming.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tasteforming.domain.ReserveVO;
import com.tasteforming.domain.TestVO;
import com.tasteforming.service.InsertService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@AllArgsConstructor
@RequestMapping("/NewSample/*")
@Log4j
public class NewSampleController {
	private InsertService service;

	@GetMapping("register")
	public void NewSample(TestVO test) {
		service.insert(test);
		
	}
	
	@GetMapping("Sample")
	public void NewSample() {
		
	}
	
	// member_id 은 세션에 저장되어 있는 user_id 의 값을 가져와서 저장을 해야됨. 
	@GetMapping("reservation")
	public void reservation(ReserveVO reservo, @RequestParam("res_no") long res_no) {
		
	}
}
