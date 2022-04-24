package com.simmons.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Component
public class AsDto {
	private int no;
	private String name;
	private String phone01;
	private String phone02;
	private String phone03;
	private int zipCode;
	private String address01;
	private String address02;
	private String address03;
	private String email01;
	private String email02;
	private String buyDate;
	private String buyPlace;
	private String category;
	private String standard;
	private String pname;
	private String title;
	private String contents;
	private String fileName;
	private String realFileName;
	private String privacy;
	private String marketing;
}
