package com.simmons.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component
public class MemberDto {
	private int no;
	private String name;
	private String id;
	private String password;
	private String address;
	private String addr01;
	private String addr02;
	private String addr03;
	private int zipCode;
	private String email;
	private String email01;
	private String email02;
	private String phone;
	private String phone01;
	private String phone02;
	private String phone03;
	private String homePhone;
	private String homePhone01;
	private String homePhone02;
	private String homePhone03;
	private String year;
	private String month;
	private String day;
	private String birthday;
	private String job;
	private String married;
	private String sms;
	private String event;
	private String delivery;
	private String serviceCall;
	private String grade;
}
