// com.tasteforming.service.KimServiceImpl.java

package com.tasteforming.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tasteforming.domain.KimVO;
import com.tasteforming.mapper.KimMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class KimServiceImpl implements KimService {
    
    @Autowired
    private KimMapper kimMapper;
    
    @Override
    public List<KimVO> getAllData(){
        return kimMapper.getAllData();
    }

    @Override
    public void insert(KimVO kimVO) {
        kimMapper.insert(kimVO);
    }

}
