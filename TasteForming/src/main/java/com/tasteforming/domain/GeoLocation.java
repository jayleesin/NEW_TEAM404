package com.tasteforming.domain;

import lombok.Data;

// 위도 경도 찾기
@Data
public class GeoLocation {

	private int latitude;
	private int longitude;
	private int[] address;
	
	public int[] GetLocation(String address) {
		int[] location = new int[2];
		return location;
				
	}
}
