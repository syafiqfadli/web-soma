<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert New Patient</title>

</head>
<body>
<%
   String patient_id = request.getParameter("patient_id");
   String first_name = request.getParameter("first_name");
   String last_name = request.getParameter("last_name");
   String gender = request.getParameter("gender");
   String birth_date= request.getParameter("birth_date");
   String doctor_id = request.getParameter("doctor_id");
   String contact_no = request.getParameter("contact_no");
   String address = request.getParameter("address");
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
	 if(patient_id!=null && first_name!=null && last_name!=null && gender!=null && birth_date!=null && doctor_id!=null && contact_no!=null && address!=null){
	 		 // check if the text box having only blank spaces
	     if(patient_id!="" && first_name!="" && last_name!="" && gender!="" && birth_date!="" && doctor_id!="" && contact_no!="" && address!="") {
	         try {
              
              con=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
              String queryString = "INSERT INTO patients(patient_id, first_name,last_name,gender,birth_date,doctor_id,contact_no,address) VALUES (?, ?, ?, ?, ?,?,?,?)";
              	      
              //pstatement = con.prepareStatement(queryString);
              pstatement = con.prepareStatement(queryString);
 		pstatement.setString(1, patient_id);              
		pstatement.setString(2, first_name);
                pstatement.setString(3, last_name);
			  pstatement.setString(4, gender);
			  pstatement.setString(5, birth_date);
			  pstatement.setString(6, doctor_id);
			  pstatement.setString(7, contact_no);
  			  pstatement.setString(8, address);

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