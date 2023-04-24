package com.tasteforming.service;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.tasteforming.domain.TestVO;
import com.tasteforming.mapper.MainMapper;
import com.tasteforming.mapper.InsertMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Component
@Log4j
public class InsertServiceImpl implements InsertService {

	private InsertMapper mapper;
	@Override
	public void insert(TestVO test) {
		mapper.insert(test);
	}
}
