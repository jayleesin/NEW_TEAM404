package com.tasteforming.controller;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tasteforming.domain.EventVO;
import com.tasteforming.domain.MemberVO;
import com.tasteforming.domain.ReserveVO;
import com.tasteforming.domain.RestaurantVO;
import com.tasteforming.domain.ReviewVO;
import com.tasteforming.service.ReserveService;
import com.tasteforming.service.RestaurantService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/tasteforming/myPage/*")
@AllArgsConstructor
@Log4j
public class RestaurantController {
	@Autowired
	private RestaurantService restaurantService;

	/*
	 * @PostMapping("/customRegister") public String signupPOST(RestaurantVO
	 * restaurantVO, RedirectAttributes rttr) { log.info("[ MEMBER ] 1 : " +
	 * restaurantVO); restaurantService.RestRegister(restaurantVO);
	 * rttr.addFlashAttribute("result", restaurantVO.getRes_Name()); return
	 * "redirect:/tasteforming/main"; }
	 */
	/*
	 * @PostMapping("/likeCnt") public String likeCnt(@RequestParam("res_No") long
	 * res_No,Model model) { // ReviewVO 객체 생성 후 값을 설정합니다. Authentication auth =
	 * SecurityContextHolder.getContext().getAuthentication(); MemberVO member = new
	 * MemberVO(); member.setUserId(auth.getName()); log.info(member.getUserId()+
	 * "***************************************************");
	 * model.addAttribute("member", member); // 이 부분 추가 RestaurantVO restaurantVO =
	 * new RestaurantVO(); restaurantVO.setRes_No(res_No); // 하트 메소드를 호출합니다.
	 * restaurantService.likeCnt(restaurantVO); // 수정된 하트가 속한 음식점 상세 페이지로 리다이렉트합니다.
	 * return "redirect:/tasteforming/detail?res_No=" + res_No; }
	 */


	@GetMapping("/ShopRegister")
	public void ShopRegisterGet() {
		log.info("res==========================");
	};

	@PostMapping("/ShopRegister")
	public String restReg(RestaurantVO restaurantVO, MultipartFile[] uploadFile)
			throws NullPointerException {
		try {
		log.info(restaurantVO);
		log.info("update ajax post......");
		
		  Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		  restaurantVO.setUserId(auth.getName());
		  log.info(restaurantVO.getUserId());
		 
		String uploadFolder = "C:\\sts-bundle\\spring_work\\TasteForming\\src\\main\\webapp\\resources\\food";
		log.info("설정전경로:" + restaurantVO.getImg_path());
		String pathString = "aaaa";
		restaurantVO.setImg_path(pathString);
		log.info("설정후경로:" + restaurantVO.getImg_path());

		switch (restaurantVO.getType()) {
		case "한식":
			uploadFolder = uploadFolder + "\\korea";
			break;
		case "양식":
			uploadFolder = uploadFolder + "\\western";
			break;
		case "채식":
			uploadFolder = uploadFolder + "\\vegetarian";
			break;
		case "중식":
			uploadFolder = uploadFolder + "\\china";
			break;
		case "일식":
			uploadFolder = uploadFolder + "\\japan";
			break;
		default:
			break;
		}

		/*
		 * if (restaurantVO.getType().equals("한식")) { uploadFolder = uploadFolder +
		 * "\\korea"; } else if (restaurantVO.getType().equals("일식")) { uploadFolder =
		 * uploadFolder + "\\japan"; } else if (restaurantVO.getType().equals("중식")) {
		 * uploadFolder = uploadFolder + "\\china"; } else if
		 * (restaurantVO.getType().equals("양식")) { uploadFolder = uploadFolder +
		 * "\\western"; } else if (restaurantVO.getType().equals("채식")) { uploadFolder =
		 * uploadFolder + "\\vegetarian"; }
		 */
		log.info(uploadFolder);
		for (MultipartFile multipartFile : uploadFile) {
			log.info("------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();

			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);

			UUID uuid = UUID.randomUUID();
			log.info("uuid: " + uuid);
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			switch (restaurantVO.getType()) {
			case "한식":
				restaurantVO.setImg_path("/resources/food/korea/" + uploadFileName);
				break;
			case "양식":
				restaurantVO.setImg_path("/resources/food/western/" + uploadFileName);
				break;
			case "일식":
				restaurantVO.setImg_path("/resources/food/japan/" + uploadFileName);
				break;
			case "중식":
				restaurantVO.setImg_path("/resources/food/china/" + uploadFileName);
				break;
			case "채식":
				restaurantVO.setImg_path("/resources/food/vegetarian/" + uploadFileName);
				break;
			default:
				break;
			}

			File saveFile = new File(uploadFolder, uploadFileName);
			log.info("세이브파일: " + saveFile);
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		restaurantService.RestRegister(restaurantVO);
		return "redirect:/tasteforming/myPage/myBoard";
		}catch (NullPointerException e) {
			return "redirect:/accessError";
		}
	}

	/*
	 * @PostMapping("/ShopRegisterAction") public void
	 * uploadAjaxPost(MultipartFile[] uploadFile) {
	 * log.info("update ajax post......");
	 * 
	 * String uploadFolder =
	 * "C:\\sts-bundle\\spring_work\\TasteForming\\src\\main\\webapp\\resources\\food";
	 * log.info(uploadFolder); for (MultipartFile multipartFile : uploadFile) {
	 * log.info("------------"); log.info("Upload File Name: " +
	 * multipartFile.getOriginalFilename()); log.info("Upload File Size: " +
	 * multipartFile.getSize());
	 * 
	 * String uploadFileName = multipartFile.getOriginalFilename();
	 * 
	 * 
	 * uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") +
	 * 1); log.info("only file name: " + uploadFileName);
	 * 
	 * UUID uuid = UUID.randomUUID(); uploadFileName = uuid.toString() + "_" +
	 * uploadFileName;
	 * 
	 * File saveFile = new File(uploadFolder, uploadFileName);
	 * log.info("세이브파일: "+saveFile); try { multipartFile.transferTo(saveFile); }
	 * catch (Exception e) { log.error(e.getMessage()); } } }
	 */

}