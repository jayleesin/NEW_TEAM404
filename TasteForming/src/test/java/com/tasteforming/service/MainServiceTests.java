package com.tasteforming.service;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tasteforming.domain.RestaurantVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src//main//webapp//WEB-INF//spring//root-context.xml")
@Log4j
public class MainServiceTests {

	@Setter(onMethod_ = @Autowired)
	private MainService service;
	
	@Test
	public void getType() {
		Map<String, List<RestaurantVO>> map = new HashMap();
		map = service.getType();
		log.info("=============================================");
		for(String key : map.keySet()) {
			log.info(map.get(key));
		}
	}
}
