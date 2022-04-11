package com.simmons.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component
public class ProductDto {
	private int no;
	private String category;
	private String pname;
	private String component;
	private String material;
	private String productor;
	private String delivery;
	private String guarantee;
	private String precaution;
	private String test;
	private String img;
	private String realImg;
	private String contents;
	private String hardness;
	private String type;
	private String pattern;
}
