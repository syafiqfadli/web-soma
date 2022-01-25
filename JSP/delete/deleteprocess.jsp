<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Page</title>
</head>

<%
String isbn=request.getParameter("isbn");
String dbUser = "ISKANDAR";
String dbPasswd = "iskandar";
String dbURL = "jdbc:oracle:thin:@fsktmdbora.upm.edu.my:1521:FSKTM";
try
{
//Class.forName("com.mysql.jdbc.Driver");
Class.forName("oracle.jdbc.driver.OracleDriver");
//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "");
Connection conn = DriverManager.getConnection(dbURL,dbUser,dbPasswd);
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM book WHERE isbn="+isbn);
out.println("Data Deleted Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<body>
<br><a href="index.jsp">Home</a> <br>	
<br><a href="viewdatabase2.jsp">View All Books</a> <br>
<br><a href="viewdatabase.jsp">View Books by Title</a> <br>
<a href="insert.html">Insert New Records</a><br>
<a href="update.jsp">Update Book Detail</a><br>
<a href="delete.jsp">Delete Book </a>
</body>
</html>