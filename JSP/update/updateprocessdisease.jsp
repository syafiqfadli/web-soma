//update process patients disease
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Patients Disease</title>
</head>
<%
String disease_id = request.getParameter("disease_id");
String disease = request.getParameter("disease");
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
String sql ="select * from patients_disease where disease_id="+disease_id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<body>
<h1>Update Patient Disease Detail</h1>
<form method="post" action="updateprocess2.jsp">
<br> 
Disease ID
<br> <% out.println(disease_id); %>
<input type="hidden" name="disease_id" value="<%=resultSet.getString("disease_id") %>">
<br>
Disease:<br>
<input type="text" name="disease" value="<%=resultSet.getString("disease") %>">
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