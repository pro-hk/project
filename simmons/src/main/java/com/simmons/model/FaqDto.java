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
	private int no;
	private String faqCategory;
	private String question;
	private String answer;
}
