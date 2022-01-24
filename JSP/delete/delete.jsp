<%@page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Book</title>
<script type="text/javascript">
	function confirm_delete() {
		return confirm('Confirm to delete this patient?')
		//return confirm('Confirm to delete this patient?');
	}

</script>
</head>

<%
	String patient_id = request.getParameter("patient_id");
	//String driver = "com.mysql.jdbc.Driver";
	//String connectionUrl = "jdbc:mysql://localhost:3306/";
	//String database = "test";
	//String userid = "root";
	//String password = "";
	String dbUser = "c207430";
	String dbPasswd = "207430";
	String dbURL = "jdbc:oracle:thin:@fsktmdbora.upm.edu.my:1521:FSKTM";

	try {
		/*Class.forName(driver);*/
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}

	catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>

<body>
<h1>Neurology Department: Patient List</h1>
<table border="1">
<tr>
<td>Patient ID</td>
<td>First name</td>
<td>Last name</td>
<td>Gender</td>
<td>Birth date</td>
<td>Doctor ID</td>
<td>Contact</td>
<td>Address</td>
<td>Ward ID</td>
<td>Bed No</td>

<td>Delete</td>

</tr>

<%
	try{
		//connection = DriverManager.getConnection(connectionUrl+database, userid, password);
		connection=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
		statement=connection.createStatement();
		String sql ="select * from patients";
		resultSet = statement.executeQuery(sql);
	
		while(resultSet.next()){
%>
		
		<tr>
		<td><%=resultSet.getString("patient_id") %></td>
		<td><%=resultSet.getString("first_name") %></td>
		<td><%=resultSet.getString("last_name") %></td>
		<td><%=resultSet.getString("gender") %></td>
		<td><%=resultSet.getString("birth_date") %></td>
		<td><%=resultSet.getString("doctor_id") %></td>
		<td><%=resultSet.getString("contact_no") %></td>
		<td><%=resultSet.getString("address") %></td>
		<td><%=resultSet.getString("ward_id") %></td>
		<td><%=resultSet.getString("bed_no") %></td>
		<td>

		<a onclick="return confirm('Confirm to delete this patient?')" href="deleteprocess.jsp?patient_id=<%=resultSet.getString("patient_id")%>" >Delete</a></td>

		</tr>
		<%
		}

		connection.close();
	} 
	
	catch (Exception e) {
		e.printStackTrace();
	}
%>

</table>
	<br><a href="index.jsp">Home</a> <br>
	<br><a href="viewdatabase2.jsp">View Patient List</a> <br>
	<br><a href="viewdatabase.jsp">View Patients by Ward/a> <br>
	<a href="insert.html">Insert New Patients</a><br>
	<a href="update.jsp">Update Patient Detail</a><br>
	<a href="delete.jsp">Delete Patient </a>

</body>
</html>