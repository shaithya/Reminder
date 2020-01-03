<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String date=request.getParameter("date");
String note=request.getParameter("note");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into reminders(date,note)values('"+date+"','"+note+"')");
out.println("Data is successfully inserted!");
}

catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%> 