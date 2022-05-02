package com.simmons.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Component
public class BuyListDto {
	int no;
	String pname;
	String count;
	String price;
	String name;
	String phone;
	String phone01;
	String phone02;
	String phone03;
	String email;
	String email01;
	String email02;
	String sizes;
	String address;
	String addr01;
	String addr02;
	String addr03;
	String id;
	String member;
}
