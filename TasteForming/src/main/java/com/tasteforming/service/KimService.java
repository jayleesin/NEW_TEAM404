// com.tasteforming.service.KimService.java

package com.tasteforming.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tasteforming.domain.KimVO;

@Service
public interface KimService {
    public List<KimVO> getAllData();
    public void insert(KimVO kimVO);
}
