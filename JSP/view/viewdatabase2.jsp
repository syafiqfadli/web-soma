<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book List</title>
</head>
<%
//String id = request.getParameter("userid");
//String driver = "com.mysql.jdbc.Driver";
//String connectionUrl = "jdbc:mysql://localhost:3306/";
//String database = "test";
//String userid = "root";
//String password = "";
String dbUser = "ISKANDAR";
String dbPasswd = "iskandar";
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

<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>No.</td>
<td>ISBN</td>
<td>Book Title</td>
<td>Year Published</td>
<td>Purchase Price</td>
<td>Sale Price</td>

</tr>
<%

int count = 1;
try{
/*connection = DriverManager.getConnection(connectionUrl+database, userid, password);*/
connection=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
statement=connection.createStatement();
String sql ="select * from book";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=count++ %></td>
<td><%=resultSet.getString("ISBN") %></td>
<td><%=resultSet.getString("title") %></td>
<td><%=resultSet.getString("bookyear") %></td>
<td><%=resultSet.getString("purchaseprice") %></td>
<td><%=resultSet.getString("saleprice") %></td>
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
<br><a href="viewdatabase2.jsp">View All Books</a> <br>
<br><a href="viewdatabase.jsp">View Books by Title</a> <br>
<a href="insert.html">Insert New Records</a><br>
<a href="update.jsp">Update Book Detail</a><br>
<a href="delete.jsp">Delete Book </a>
</body>
</html>