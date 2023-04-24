package com.tasteforming.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.tasteforming.domain.EventVO;
import com.tasteforming.domain.MemberVO;
import com.tasteforming.domain.ReserveVO;
import com.tasteforming.service.MyPageService;
import lombok.extern.log4j.Log4j;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;


@Controller
@RequestMapping("tasteforming/myPage/*")
@PreAuthorize("isAuthenticated()")
@Log4j
public class MyPageController {
	@Autowired
	private MyPageService service;
	
	@GetMapping("myPage")
	public void GetReservation(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberVO member = new MemberVO();
		member.setUserId(auth.getName());
		List<ReserveVO> reserves = service.getReservation(member);
		List<EventVO> events = new ArrayList<EventVO>();
		Gson gson = new Gson();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		log.info(member.getUserId()+"***************************************************");
		
		
		for (ReserveVO reserve : reserves) {
	
			try {
				  EventVO eventVO = new EventVO();
			        Date startDate = simpleDateFormat.parse(simpleDateFormat.format(reserve.getOrder_Date()));
			        
			        Calendar calendar = Calendar.getInstance();
			        calendar.setTime(startDate);
			        String jsDate = "new Date(" +
			                        "y" + "," +
			                        calendar.get(Calendar.MONTH) + "," +
			                        calendar.get(Calendar.DAY_OF_MONTH) + "," +
			                        calendar.get(Calendar.HOUR_OF_DAY) + "," +
			                        calendar.get(Calendar.MINUTE) + ")";
			        
			        eventVO.setStart(jsDate);
			        eventVO.setTitle(reserve.getRes_Name());
			        events.add(eventVO);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		    
		}

		model.addAttribute("events", events);
	}

	@GetMapping("myBoard")
	public void getBoardList() {
		log.info("myBoard=========================");
	}

	@GetMapping("myComment")
	public void getCommentsList() {

	}


}