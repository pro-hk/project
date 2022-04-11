package com.simmons.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component
public class NoticeDto {
	private int no;
	private String title;
	private String contents;
	private String regDate;
}
