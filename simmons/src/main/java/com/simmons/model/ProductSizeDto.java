package com.simmons.model;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@Component
public class ProductSizeDto {
	private String pname;
	private String sizes;
	private String spec;
	private String price;
	private String sizeName;
}
