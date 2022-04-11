package com.simmons.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ScriptWriter {
	public static void init(HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
	}
	
	public static void alert(HttpServletResponse response, String alertMsg) {
		init(response);
		try {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('"+alertMsg+"');");
			out.println("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void alertAndNext(HttpServletResponse response, String alertMsg, String nextURL){
		init(response);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println("<script>");
			out.println("alert('"+alertMsg+"');");
			out.println("location.href='"+nextURL+"';");
			out.println("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void alertAndBack(HttpServletResponse response, String alertMsg) {
		init(response);
		try {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('"+alertMsg+"');");
			out.println("history.back();");
			out.println("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
