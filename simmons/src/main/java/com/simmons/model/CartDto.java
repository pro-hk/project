package com.simmons.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Component
public class CartDto {
	private int no;
	private String pname;
	private String img;
	private int count;
	private String price;
	private String sizes;
	private String id;
}
