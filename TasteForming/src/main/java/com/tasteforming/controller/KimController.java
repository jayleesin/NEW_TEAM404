// com.tasteforming.controller.KimController.java

package com.tasteforming.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tasteforming.domain.KimVO;
import com.tasteforming.service.KimService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/kim/*")
@AllArgsConstructor
@Log4j
public class KimController {
    
    private final KimService kimService;
    
    
//    @GetMapping("insert")
//    public void insert(KimVO kimVO) {
//        kimService.insert(kimVO);
//    }
    @GetMapping("kim")
    public void sample() {
    	
    }
}