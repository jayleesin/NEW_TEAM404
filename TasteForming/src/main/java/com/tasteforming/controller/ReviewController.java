package com.tasteforming.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tasteforming.domain.ReviewVO;
import com.tasteforming.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/Review/*")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;

	@PostMapping("/insert")
	public String insertReview(@RequestParam("res_No") long res_No, ReviewVO reviewVO, HttpServletRequest request) {
		reviewVO.setRes_No(res_No); // reviewVO 객체에 res_No 값을 설정해줍니다.
		reviewService.insert(reviewVO);
		log.info(reviewVO);
		log.info("reviewVO========");

		return "redirect:/tasteforming/detail?res_No=" + res_No;
	}

	@PostMapping("/reviewList")
	public String allReview(@RequestParam("res_No") long res_No, Model model) {
		List<ReviewVO> reviewList = reviewService.allReview(res_No);
		model.addAttribute("reviewList", reviewList);
		log.info("reviewList======");
		return "/tasteforming/detail";
	}

	@PostMapping("/update")

	public String updateReview(@RequestParam("res_No") long res_No, @RequestParam("resview_No") Long resview_No,
			@RequestParam("content") String content, Model model) {
		// ReviewVO 객체 생성 후 값을 설정합니다.
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setRes_No(res_No);
		reviewVO.setContent(content);
		reviewVO.setResview_No(resview_No);

		// 리뷰 수정 메소드를 호출합니다.
		reviewService.update(reviewVO);

		// 수정된 리뷰가 속한 음식점 상세 페이지로 리다이렉트합니다.
		return "redirect:/tasteforming/detail?res_No=" + res_No;
	}

	@PostMapping("/Review/delete")
	public String deleteReview(@RequestParam("resview_No") long resview_No,
	                           @RequestParam("res_No") long res_No,
	                           @RequestParam("userId") String userId) {
	    reviewService.deleteReview(resview_No);
	    log.info("Review with id " + resview_No + " deleted");

	    return "redirect:/tasteforming/detail?res_No=" + res_No;
	}



//
//	// 리뷰 수정 처리
//	@PostMapping("/{review_no}/edit")
//	public String submitReviewEditForm(ReviewVO reviewVO) {
//		reviewService.updateReview(reviewVO);
//		return "redirect:/review/all";
//	}
//
//
//	// 모든 리뷰 조회
//	@GetMapping("/all")
//	public String getAllReviews(Model model) {
//		List<ReviewVO> reviewList = reviewService.getAllReviews();
//		model.addAttribute("reviewList", reviewList);
//		return "reviewList";
//	}
//

}
