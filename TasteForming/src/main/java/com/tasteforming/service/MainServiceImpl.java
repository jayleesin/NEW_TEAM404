package com.tasteforming.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.tasteforming.domain.RestaurantVO;
import com.tasteforming.mapper.MainMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// 김정우
@Service
@AllArgsConstructor
@Component
@Log4j
public class MainServiceImpl implements MainService{
	
	/*
	 * @Autowired
	 * 
	 * @Qualifier("mainServiceImpl")
	 */
	private MainMapper mapper;
	
	/*
	 * public MainServiceImpl() { super(); }
	 */
	// 타입에 맞는 레스토랑을 담을 머레이리스트로 구현
	// 맵에 다가 타입별로 어레이리스트를 구현
	
	@Override
	public Map<String, List<RestaurantVO>> getType() {
	    Map<String, List<RestaurantVO>> typeMap = new HashMap<>();

	    for (RestaurantVO restaurant : mapper.getAllData()) {
	        String type = restaurant.getType();
	        if (!typeMap.containsKey(type)) {
	            typeMap.put(type, new ArrayList<>());
	        }
	        typeMap.get(type).add(restaurant);
	    }
	    return typeMap;
	}
	
	@Override
	public List<RestaurantVO> getAllData(){
		return mapper.getAllData();
		
	}
	
	@Override
	public List<RestaurantVO> getSearch(String keyword) {
		return mapper.getSearch(keyword);
	}

	@Override
	public RestaurantVO get(long res_no) {
		log.info("get_Res_no===========" + res_no);
		return mapper.read(res_no);
	}

	@Override
	public List<RestaurantVO> SearchType(String keyword) {

		return null;
	}
}
