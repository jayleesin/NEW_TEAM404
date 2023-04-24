// com.tasteforming.mapper.KimMapper.java

package com.tasteforming.mapper;

import java.util.List;

import com.tasteforming.domain.KimVO;

public interface KimMapper {
    List<KimVO> getAllData();
    void insert(KimVO kimVO);
}
