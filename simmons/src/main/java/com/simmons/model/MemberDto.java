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
	private int num;
	private int no;
	private String name;
	private String id;
	private String password;
	private String address01;
	private String address02;
	private String address03;
	private String zipCode;
	private String email01;
	private String email02;
	private String phone01;
	private String phone02;
	private String phone03;
	private String homePhone01;
	private String homePhone02;
	private String homePhone03;
	private String birthdayYear;
	private String birthdayMonth;
	private String birthdayDay;
	private String job;
	private String married;
	private String sms;
	private String event;
	private String delivery;
	private String serviceCall;
	private String grade;
}
