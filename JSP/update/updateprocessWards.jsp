//update process wards
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Wards</title>
</head>
<%
String ward_id = request.getParameter("ward_id");
String ward_type = request.getParameter("ward_type");
String status = request.getParameter("status");
String staff_id = request.getParameter("staff_id");
String patient_id = request.getParameter("patient_id");
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
String sql ="select * from wards where ward_id="+ward_id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<body>
<h1>Update Wards Detail</h1>
<form method="post" action="updateprocess2.jsp">
<br> 
Ward ID
<br> <% out.println(ward_id); %>
<input type="hidden" name="ward_id" value="<%=resultSet.getString("ward_id") %>">
<br>
Ward Type:<br>
<input type="text" name="ward_type" value="<%=resultSet.getString("ward_type") %>">
<br>
Status:<br>
<input type="text" name="status" value="<%=resultSet.getString("status") %>">
<br>
Staff ID:<br>
<input type="text" name="staff_id" value="<%=resultSet.getString("staff_id") %>">
<br>
Patient ID:<br>
<input type="text" name="patient_id" value="<%=resultSet.getString("patient_id") %>">
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