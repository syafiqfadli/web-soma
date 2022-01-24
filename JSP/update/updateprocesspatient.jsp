//update process patients
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Patient</title>
</head>
<%
String patient_id = request.getParameter("patient_id");
String first_name = request.getParameter("first_name");
String last_name = request.getParameter("last_name");
String gender = request.getParameter("gender");
String birth_date= request.getParameter("birth_date");
String contact_no = request.getParameter("contact_no");
String address = request.getParameter("address");
String doctor_id = request.getParameter("doctor_id");
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
String sql ="select * from patient where patient_id="+patient_id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<body>
<h1>Update Patient Detail</h1>
<form method="post" action="updateprocess2.jsp">
<br> 
Patient ID
<br> <% out.println(patient_id); %>
<input type="hidden" name="patient_id" value="<%=resultSet.getString("patient_id") %>">
<br>
First Name:<br>
<input type="text" name="first_name" value="<%=resultSet.getString("first_name") %>">
<br>
Last Name:<br>
<input type="text" name="last_name" value="<%=resultSet.getString("last_name") %>">
<br>
Gender:<br>
<input type="text" name="gender" value="<%=resultSet.getString("gender") %>">
<br>
Birth Date:<br>
<input type="text" name="birth_date" value="<%=resultSet.getString("birth_date") %>">
<br>
Contact:<br>
<input type="text" name="contact" value="<%=resultSet.getString("contact") %>">
<br>
Address:<br>
<input type="text" name="address" value="<%=resultSet.getString("address") %>">
<br>
Doctor ID:<br>
<input type="text" name="doctor_id" value="<%=resultSet.getString("doctor_id") %>">
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