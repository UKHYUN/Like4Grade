<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>


<%
	String local = request.getParameter("local");

	if(local.equals("경기")) {
		ArrayList<AddrBook> datas = ab.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("addrbook_list.jsp");
	}

	else if(local.equals("01")){ //경기도
		if(ab.insertDB(addrbook)){
			response.sendRedirect("pension_area_control.jsp?local=01");
		}
		else
			throw new Exception("DB 입력 오류");
	}

%>
