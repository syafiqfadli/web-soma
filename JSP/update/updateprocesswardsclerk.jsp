//update process wards clerks
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Wards Clerks</title>
</head>
<%
String staff_id = request.getParameter("staff_id");
String first_name = request.getParameter("first_name");
String last_name = request.getParameter("last_name");
String dbUser = "C207430";
String dbPasswd = "207430";
String dbURL = "jdbc:oracle:thin:@fsktmdbora.upm.edu.my:1521:FSKTM";

try {

Class.forName("oracle.jdbc.driver.OracleDriver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{

connection=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
statement=connection.createStatement();
String sql ="select * from wards_clerks where staff_id="+staff_id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<body>
<h1>Update Wards Clerks Detail</h1>
<form method="post" action="updateprocess2.jsp">
<br> 
Staff ID
<br> <% out.println(patient_id); %>
<input type="hidden" name="staff_id" value="<%=resultSet.getString("staff_id") %>">
<br>
First Name:<br>
<input type="text" name="first_name" value="<%=resultSet.getString("first_name") %>">
<br>
Last Name:<br>
<input type="text" name="last_name" value="<%=resultSet.getString("last_name") %>">
<br><br>
<input type="submit" value="submit" onclick="return confirm('Confirm?')">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

<br><a href="index.jsp">Home</a> <br>	
<br><a href="viewdatabase2.jsp">View Patient List</a> <br>
<br><a href="viewdatabase.jsp">View patient by Ward</a> <br>
<a href="insert.html">Insert New Patient</a><br>
<a href="update.jsp">Update Patient Detail</a><br>
<a href="delete.jsp">Delete Patient </a>

</body>
</html>