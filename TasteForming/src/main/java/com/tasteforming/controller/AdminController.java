package com.tasteforming.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tasteforming.domain.AdminMemberVO;
import com.tasteforming.domain.BoardVO;
import com.tasteforming.domain.Criteria;
import com.tasteforming.domain.PageDTO;
import com.tasteforming.domain.RestaurantVO;
import com.tasteforming.mapper.MemberMapper;
import com.tasteforming.service.AdminService;
import com.tasteforming.service.MainService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("tasteforming/admin/*")
@Log4j
public class AdminController {
	@Autowired
	private AdminService adminService;

	@GetMapping("adminPage")
	public void adminPage() {

	}

//	UserManagement
	@GetMapping("UserManagement")
	public void userManagement(Model model, Criteria cri) {
		log.info("MemberList" + cri);
		model.addAttribute("member", adminService.getMemberWithPaging(cri));
		int total = adminService.getMemberTotalCnt();
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		log.info(adminService.getMemberTotalCnt());

	}

	@GetMapping("updateUser")
	public String updateUser(AdminMemberVO member, RedirectAttributes rttr) {
		adminService.updateUser(member);
		log.info("update User" + member);
		return "redirect:/tasteforming/admin/UserManagement";
	}

	@GetMapping("deleteUser")
	public String deleteUser(AdminMemberVO member, RedirectAttributes rttr) {
		log.info("delete User" + member);

		try {
			adminService.deleteUserAuth(member);
			Thread.sleep(1000);
			adminService.deleteUser(member);
		} catch (InterruptedException e) {
			Thread.currentThread().interrupt();
			e.printStackTrace();
		}

		return "redirect:/tasteforming/admin/UserManagement";
	}

// ResManagement	
	@GetMapping("ResManagement")
	public void resManagement(Model model, Criteria cri) {
		log.info(adminService.getResTotalCnt());
		int total = adminService.getResTotalCnt();
		model.addAttribute("restaurant", adminService.getResWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
	@GetMapping("updateRes")
	public String updateRes(RestaurantVO res) {
		adminService.updateRes(res);
		log.info("update Res" + res);
		return "redirect:/tasteforming/admin/ResManagement";
	}

	@GetMapping("deleteRes")
	public String deleteRes(RestaurantVO res) {
		log.info("delete Res" + res);
		adminService.deleteRes(res);
		return "redirect:/tasteforming/admin/ResManagement";
	}
	
	
	
// BoardManagement
	@GetMapping("BoardManagement")
	public void boardManagement(Model model, Criteria cri) {
		log.info(adminService.getBoardWithPaging(cri));
		log.info(adminService.getBoardTotalCnt());
		int total = adminService.getBoardTotalCnt();
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("board",adminService.getBoardWithPaging(cri));
	}

	@PostMapping("updateBoard")
	public String updateBoard(BoardVO board) {
		adminService.updateBoard(board);
		log.info("update Board" + board);
		return "redirect:/tasteforming/admin/BoardManagement";
	}

	@PostMapping("deleteBoard")
	public String deleteBoard(BoardVO board) {
		log.info("delete Board" + board);
		adminService.deleteBoard(board);
		return "redirect:/tasteforming/admin/BoardManagement";
	}
	
	
	
// ReplyManagement
	@GetMapping("ReplyManagement")
	public void replyManagement() {

	}

// ReserveManagement
	@GetMapping("ReserveManagement")
	public void reserveManagement() {

	}

}

/*
 * @GetMapping("/list") public void list(Criteria cri ,Model model) {
 * log.info("list : " + cri); model.addAttribute("list", adminService.getList(cri));
 * // model.addAttribute("pageMaker", new PageDTO(cri, 123));
 * 
 * int total = adminService.getTotalCount(cri); log.info("total : " + total);
 * model.addAttribute("pageMaker", new PageDTO(cri, total)); }
 */