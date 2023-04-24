package com.tasteforming.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RestaurantVO {

	private long res_No;
	private String res_Name;
	private Date create_Date;
	private String address;
	private String info;
	private String userId;
	private String menu;
	private String type;
	private String img_path;
	private long likeCnt;
}

/*
 * RES_NO NOT NULL NUMBER(10) RES_NAME NOT NULL VARCHAR2(100) CREATE_DATE DATE
 * ADDRESS NOT NULL VARCHAR2(100) INFO VARCHAR2(500) USERID NOT NULL
 * VARCHAR2(20) MENU NOT NULL VARCHAR2(100) TYPE NOT NULL VARCHAR2(100) IMG_PATH
 * NOT NULL VARCHAR2(200) TEL VARCHAR2(20)
 */