package com.tasteforming.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tasteforming.domain.Criteria;
import com.tasteforming.domain.MemberVO;
import com.tasteforming.domain.ReserveVO;
import com.tasteforming.domain.RestaurantVO;
import com.tasteforming.domain.ReviewVO;
import com.tasteforming.service.MainService;
import com.tasteforming.service.ReserveService;
import com.tasteforming.service.RestaurantService;
import com.tasteforming.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// 김정우
@Controller
@RequestMapping("/tasteforming/*")
@AllArgsConstructor
@Log4j
public class MainController {

   private MainService service;
   private ReserveService reserveService;
   private ReviewService reviewService;
   private RestaurantService restaurantService;
   
   @GetMapping("main")
   public void list(Model model,String password) {
      model.addAttribute("list", service.getType());
      model.addAttribute("data", service.getAllData());
      log.info("Main=========================================");
   };
   
   
   @GetMapping("detail")
   public void get(@RequestParam("res_No") long resNo, @ModelAttribute("cri") Criteria cri, Model model) {
      log.info("Controller ========================= get_res_no" + resNo);
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      MemberVO member = new MemberVO();
      member.setUserId(auth.getName());
      log.info(member.getUserId()+"***************************************************");
      model.addAttribute("member", member); // 이 부분 추가
      model.addAttribute("res", service.get(resNo));
      List<ReviewVO> reviewList = reviewService.allReview(resNo);
      model.addAttribute("reviewList", reviewList);
		/* model.addAttribute("review_cnt", reviewService.getAllReviewer(resNo)); */
      model.addAttribute("examine", reviewService.getAllReviewer(resNo));
      log.info("detail=========================================");
   }

   
   @GetMapping("search")
   public void Search(@RequestParam("keyword") String keyword ,  Model model) {
      
      model.addAttribute("restaurant", service.getSearch(keyword));
      model.addAttribute("searchKeyword", keyword);
      /*
       * model.addAttribute("beginIndex", beginIndex); model.addAttribute("endIndex",
       * endIndex);
       */
      log.info("search=========================================");
      
      //return "tasteforming/search?keyword="+keyword+"&beginIndex="+beginIndex+"&endIndex="+endIndex;
   }
   
   @PostMapping("insertReserve")
    public String insertReserve(@RequestParam("res_No") long res_No,Model model, ReserveVO reserveVO) {
       reserveService.insertReserve(reserveVO);
       Authentication auth = SecurityContextHolder.getContext().getAuthentication();
       MemberVO member = new MemberVO();
       member.setUserId(auth.getName());
       log.info(member.getUserId()+"***************************************************");
       model.addAttribute("member", member); // 이 부분 추가
       log.info(reserveVO);
       log.info("addreserve=======");
       return "redirect:/tasteforming/detail?res_No=" + res_No;
    }
   
	@PostMapping("/likeCnt")
	public String likeCnt(@RequestParam("res_No") long res_No,Model model) {
		// ReviewVO 객체 생성 후 값을 설정합니다.
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	      MemberVO member = new MemberVO();
	      member.setUserId(auth.getName());
	      log.info(member.getUserId()+"***************************************************");
	      model.addAttribute("member", member); // 이 부분 추가
		RestaurantVO restaurantVO = new RestaurantVO();
		restaurantVO.setRes_No(res_No);
		// 라이크 메소드를 호출합니다.
		restaurantService.likeCnt(restaurantVO);
		log.info("likeCnt======");
		// 수정된 하트가 속한 음식점 상세 페이지로 리다이렉트합니다.
		return "redirect:/tasteforming/detail?res_No=" + res_No;
	}
   
   @GetMapping("NewDetail")
   public void NewDetail() {
	   
   }
}


