//update beds
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Beds</title>
</head>

<%
String bed_no = request.getParameter("bed_no");
String ward_id = request.getParameter("ward_id");
String patient_id= request.getParameter("patient_id");
//String driver = "com.mysql.jdbc.Driver";
//String connectionUrl = "jdbc:mysql://localhost:3306/";
//String database = "test";
//String userid = "root";
//String password = "";
String dbUser = "C207430";
String dbPasswd = "207430";
String dbURL = "jdbc:oracle:thin:@fsktmdbora.upm.edu.my:1521:FSKTM";

try {
/*Class.forName(driver);*/
Class.forName("oracle.jdbc.driver.OracleDriver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<body>
<h1>Bed List</h1>
<table border="1">
<tr>
<td>Bed Number</td>
<td>Ward ID</td>
<td>Patient ID</td>
</tr>

<%
try{
//connection = DriverManager.getConnection(connectionUrl+database, userid, password);
connection=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
statement=connection.createStatement();
String sql ="select * from beds";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("bed_no") %></td>
<td><%=resultSet.getString("ward_id") %></td>
<td><%=resultSet.getString("patient_id") %></td>
<td><a href="updateprocess.jsp?isbn=<%=resultSet.getString("patient_id")%>">update</a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>
<br><a href="index.jsp">Home</a> <br>	
<br><a href="viewdatabase2.jsp">View Patient List</a> <br>
<br><a href="viewdatabase.jsp">View patient by Ward</a> <br>
<a href="insert.html">Insert New Patient</a><br>
<a href="update.jsp">Update Patient Detail</a><br>
<a href="delete.jsp">Delete Patient </a>

</body>
</html>