package com.tasteforming.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tasteforming.domain.ReserveVO;
import com.tasteforming.service.ReserveService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/tasteforming/*")
public class ReserveController {
	//values (seq_reservation.nextval, #{res_no}, #{member_id},#{head_cnt},
	//#{resName}, #{hour} )
    @Autowired
    private ReserveService reserveService;
	/*
	 * @PostMapping("insert") public String insertReserve(@RequestParam("res_No")
	 * long res_No,ReserveVO reserveVO) { reserveService.insertReserve(reserveVO);
	 * 
	 * log.info(reserveVO); log.info("addreserve======="); return
	 * "redirect:/tasteforming/detail?res_No=" + res_No; }
	 */
}
