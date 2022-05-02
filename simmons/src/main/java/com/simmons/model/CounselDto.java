package com.simmons.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component
public class CounselDto {
	private int num;
	private int no;
	private String name;
	private String title;
	private String phone01;
	private String phone02;
	private String phone03;
	private String callTime;
	private String city;
	private String email01;
	private String email02;
	private String contents;
	private String privacy;
	private String marketing;
	private String regDate;
	private String replyRegDate;
	private String reply;
	private String answer;
}
