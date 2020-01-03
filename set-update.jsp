<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/test";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String id = request.getParameter("id");
String date=request.getParameter("date");
String note=request.getParameter("note");

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int id = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update reminders set id=?,date=?,note=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, date);
ps.setString(3, note);

int i = ps.executeUpdate();
if(i > 0)
{
out.print("Updated Successfully");
}
else
{
out.print("unsuccessful");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>