<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wards Clerks</title>

</head>
<body>
<%
   String staff_id = request.getParameter("staff_id");
   String first_name = request.getParameter("first_name");
   String last_name = request.getParameter("last_name");
   //out.println(title);
  
  
    String dbUser = "c207430";
  	String dbPasswd = "207430";
  	//String dbURL = "jdbc:oracle:thin:@sid3.comp.nus.edu.sg:1521:sid3";
  	String dbURL = "jdbc:oracle:thin:@fsktmdbora.upm.edu.my:1521:FSKTM";
	
	Connection con=null;
	ResultSet rst=null;
	PreparedStatement pstatement=null;
	
     Class.forName("oracle.jdbc.driver.OracleDriver");
     int updateQuery = 0;
     
     	 // check if the text box is empty
	 if(staff_id!=null && first_name!=null && last_name!=null){
	 		 // check if the text box having only blank spaces
	     if(staff_id!="" && first_name!="" && last_name!="" ) {
	         try {
              
              con=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
              String queryString = "INSERT INTO wards(staff_id, first_name,last_name) VALUES (?, ?, ?)";
              	      
              //pstatement = con.prepareStatement(queryString);
              pstatement = con.prepareStatement(queryString);
 		pstatement.setString(1, staff_id);              
		pstatement.setString(2, first_name);
                pstatement.setString(3, last_name);
			  			  
              updateQuery = pstatement.executeUpdate();
                            if (updateQuery != 0) { %>
	           <br>
	           <TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1">
		      <tr><th>Data is inserted successfully in database.</th></tr>
		      
		   </table>
		   
		   <br><a href="index.jsp">Home</a> <br>
		   <br><a href="viewdatabase2.jsp">View All Patients</a> <br>
			<br><a href="viewdatabase.jsp">View Patients by Ward</a> <br>
			<a href="insert.html">Insert New Patient</a><br>
			<a href="update.jsp">Update Patient Detail</a><br>
			<a href="delete.jsp">Update Patient Detail</a><br>
			<a href="delete.jsp">Delete Patient </a>
              <%
              }
            } 
            catch (Exception ex) {
            //out.println("Unable to connect to batabase.");
            %><TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1">
		      <tr><th>data insert failed.</th></tr>
		      
		   </table>
		   <br><a href="index.jsp">Home</a> <br>
		   <br><a href="viewdatabase2.jsp">View All Patients</a> <br>
			<br><a href="viewdatabase.jsp">View Patients by Ward/a> <br>
			<a href="insert.html">Insert New Patients</a><br>
			<a href="update.jsp">Update Patient Detail</a><br>
			<a href="delete.jsp">Update Patient Detail</a><br>
			<a href="delete.jsp">Delete Patient </a><%
               }
            finally {
                // close all the connections.
                pstatement.close();
                con.close();
            }
	  }
	}
%>
</body>
</html>