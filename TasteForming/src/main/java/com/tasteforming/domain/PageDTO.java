package com.tasteforming.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri; //현재페이지 변수 값을 받기 위해 선언
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = (int) Math.ceil((double) total / 20);
		
		this.endPage = (int) Math.ceil(cri.getPageNum() / 10.0) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total*1.0)/cri.getAmount()));
		
		if (this.endPage > realEnd) {
		    this.endPage = realEnd;
		}
		this.startPage = this.endPage - 9;
		if (this.startPage < 1) {
		    this.startPage = 1;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
	}
}
