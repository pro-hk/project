package com.simmons.config;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class SpringConfig extends AbstractAnnotationConfigDispatcherServletInitializer {
	
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {RootAppContext.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {ServletAppContext.class};
	}

	// 주소창에 '/' 이후 주소와 매핑
	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}
	
	// 한글 깨짐 방지
	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("UTF-8");
		return new Filter[] {encodingFilter};
	}
	
	// 파일 업로드 세팅
	@Override
	protected void customizeRegistration(Dynamic registration) {
		MultipartConfigElement config = new MultipartConfigElement(null, 1024*1024*100, 1024*1024*1000, 0);
		registration.setMultipartConfig(config);
	}
}
