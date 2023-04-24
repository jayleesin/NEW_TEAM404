package com.tasteforming.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tasteforming.domain.MemberVO;
import com.tasteforming.service.CommonService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.tasteforming.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor

public class CommonController {
	private CommonService commonService;
	@GetMapping("accessError")
	public void accessDenied(Authentication auth, Model model) {

		log.info("access Denied : " + auth);

		model.addAttribute("msg", "Access Denied");
	}
	
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		
		log.info("error: " + error);
		log.info("logout: " + logout);

		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}
	
	@PostMapping("/customLogout")
	public String logoutGET(RedirectAttributes rttr) {
		
		log.info("custom logout");
		return "redirect:/tasteforming/main";
	}
	
	@GetMapping("/customRegister")
	public void registerGET() {

		log.info("custom register");
	}
	@PostMapping("/customRegister")
	public String signupPOST(MemberVO member, RedirectAttributes rttr) {
		log.info("[ MEMBER ] 1 : " + member);
		commonService.customRegister(member);
		rttr.addFlashAttribute("result", member.getUserName());
		return "redirect:/tasteforming/main";
	}
	
	
	/*
	 * @ResponseBody // 값 변환을 위해 꼭 필요함
	 * 
	 * @GetMapping("idCheck") // 아이디 중복확인을 위한 값으로 따로 매핑 public int
	 * overlappedID(MemberVO memberVO) throws Exception{ int result =
	 * commonService.overlappedID(memberVO); // 중복확인한 값을 int로 받음 return result; }
	 * 
	 * @GetMapping("/join") public void setInsert() throws Exception{};
	 * 
	 * @PostMapping("/join") public String setInsert(MemberVO member) throws
	 * Exception{ commonService.setInsert(member); return
	 * "redirect:/customRegister"; }
	 */
	
	
	/*
	 * @PostMapping("/check-duplicate-username")
	 * 
	 * @ResponseBody public String checkDuplicateUsername(@RequestParam String
	 * username) { // 아이디 중복 체크 로직을 구현합니다. (데이터베이스 조회 등) boolean isDuplicate =
	 * userService.checkDuplicateUsername(username);
	 * 
	 * if (isDuplicate) { return "이미 존재하는 아이디입니다."; } else { return
	 * "사용 가능한 아이디입니다."; } }
	 */
}
