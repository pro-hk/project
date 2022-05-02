package com.simmons.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Component
public class QnaDto {
	private int num;
	private int no;
	private String id;
	private String title;
	private String contents;
	private String regDate;
	private String answer;
	private String reply;
}
