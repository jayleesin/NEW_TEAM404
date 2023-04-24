// com.tasteforming.domain.KimVO.java

package com.tasteforming.domain;

import java.util.Date;

import lombok.Data;

@Data
public class KimVO {
	private String member_Id;
	private String password;
	private String role;
	private String name;
	private String address;
    // 생성자, getter, setter 등 필요한 메소드 작성
}
