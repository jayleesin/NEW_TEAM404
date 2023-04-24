package com.tasteforming.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}

	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}

	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		String uploadFolder = "C:\\sts-bundle\\spring_work\\TasteForming\\src\\main\\webapp\\resources\\food";

		for (MultipartFile multipartFile : uploadFile) {
			log.info("------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());

			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}

	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("update ajax post......");

		String uploadFolder = "C:\\sts-bundle\\spring_work\\TasteForming\\src\\main\\webapp\\resources\\food";

		for (MultipartFile multipartFile : uploadFile) {
			log.info("------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);

			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;

			File saveFile = new File(uploadFolder, uploadFileName);
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}

}
