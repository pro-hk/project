package com.simmons.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component
public class FaqDto {
	private int num;
	private int no;
	private String category;
	private String question;
	private String answer;
}
