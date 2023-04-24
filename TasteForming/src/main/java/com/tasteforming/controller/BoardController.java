package com.tasteforming.controller;
// 장혜림

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tasteforming.domain.BoardVO;
import com.tasteforming.domain.Criteria;
import com.tasteforming.domain.PageDTO;
import com.tasteforming.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("tasteforming/board/*")
@AllArgsConstructor
//RequestMapping: /board/로 시작하는 모든처리를 controller가 하도록 매핑
public class BoardController {//service에 의존적

	private BoardService service;

//	@GetMapping("/list")
//	public void list(Model model) { //게시물목록을 전달해야하므로 파라미터model을 통해 serviceImpl 객체의 getList() 결과를 담아 전달
//
//		log.info("list");
//		model.addAttribute("list", service.getList());
//	}

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		int total= service.getTotalCount(cri);
		PageDTO pageMake = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
	}
	
	@GetMapping("/register")
	public void register() {
	}
	
	@GetMapping("/insert")
	public String insert(BoardVO board, RedirectAttributes rttr) {
		service.register(board);
		return "redirect:/tasteforming/board/list";
	}
	
	
	@GetMapping({ "/get", "modify"})
	public void get(@RequestParam("board_no") Long board_no, @ModelAttribute("cri")Criteria cri, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("board", service.get(board_no));
//		model.addAttribute("pageInfo", service.getList(board_no));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/tasteforming/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("board_no") Long board_no, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + board_no);
		if (service.remove(board_no)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/tasteforming/board/list";
	}
	
	@GetMapping("NewBoard")
	public void NewBoard() {
		
	}
	@GetMapping("NewBoardGet")
	public void NewBoardGet() {
		
	}
	@GetMapping("NewBoardModify")
	public void NewBoardModify() {
		
	}
	
//	@PostMapping("/remove")
//	public String remove(@RequestParam("board_no") Long board_no, RedirectAttributes rttr) {
//
//		log.info("remove..." + board_no);
//		if (service.remove(board_no)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		
//		return "redirect:/tasteforming/board/list";
//		}
//	@PostMapping("/modify")
//	public String modify(BoardVO board, RedirectAttributes rttr) {
//		log.info("modify:" + board);
//		service.modify(board);
//		return "redirect:/tasteforming/board/list";
//	}
//
//	
//	@GetMapping({ "/get"})
//	public void get(@RequestParam("board_no") Long board_no, Model model) {
//		
//		log.info("/get");
//		model.addAttribute("board", service.get(board_no));
//	}
//	


//	@PostMapping("/remove")
//	public String remove(@RequestParam("board_no") Long board_no, Criteria cri, RedirectAttributes rttr) {
//
//		log.info("remove..." + board_no);
//		if (service.remove(board_no)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
//		
//		return "redirect:/tasteforming/board/list";
//		}
//	@RequestMapping(value = "/register" ,  method = {RequestMethod.GET, RequestMethod.POST})
//	public String register(BoardVO board, RedirectAttributes rttr) {
//		log.info("register: " + board);
//		service.register(board);
//		rttr.addFlashAttribute("result", board.getBoard_no());
//
//		return "redirect:/board/list"; // redirect:접두어를 사용해 스프링MVC가 내부적으로 response.sendRedirect()
//	}
//	
//	@PostMapping("/register")
//	public String register(BoardVO board, RedirectAttributes rttr) {
//		log.info("register: " + board);
//		service.register(board);
//		rttr.addFlashAttribute("result", board.getBoard_no());
//
//		return "redirect:/tasteforming/board/list"; // redirect:접두어를 사용해 스프링MVC가 내부적으로 response.sendRedirect()
//	}
//	@GetMapping("/register")
//	public String register(BoardVO board, Model model) {
//		return "tasteforming/board/list";
//			
//	}
	
//	@GetMapping("/register")
//	public String register(BoardVO board, RedirectAttributes rttr) {
//		service.register(board);
//		log.info(board);
//		return "redirect:/tasteforming/board/list";
//	}

//	@GetMapping({ "/get"})
//	public void get(@RequestParam("board_no") Long board_no, Model model) {
//
//		log.info("/get");
//		model.addAttribute("board", service.get(board_no));
//	}
	
}
