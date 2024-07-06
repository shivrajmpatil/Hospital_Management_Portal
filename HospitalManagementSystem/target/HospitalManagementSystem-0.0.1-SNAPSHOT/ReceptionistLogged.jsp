<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receptionist Logged</title>
<style>
	
</style>
</head>

<body>
   <%@ include file="ReceptionistDash.html" %>
        <div class="p-3">
        
            <div class="frm profile">
            <% ReceptionistModel model = new ReceptionistModel();
            	ReceptionistService rs = new ReceptionistService();
            	
            	int rid = Integer.parseInt(session.getAttribute("Rid").toString());
            	
            	model = rs.getProfile(rid);
            	
            	if(model!=null)
            	{
            %>
                <h3>Receptionist Profile</h3>
                <table>
                	<tr><th>Name : </th><td><%= model.getName() %></td></tr>
                	<tr><th>Contact : </th><td><%= model.getContact() %></td></tr>
                	<tr><th>Username : </th><td><%= model.getUsername() %></td></tr>
                	<tr><th>Password : </th><td><%= model.getPassword() %></td></tr>
                </table>
             <%} %>         
			</div>
        </div>
    </div>
    

    <footer>

        <p>&copy; 2024 Our Hospital. All rights reserved.</p>

    </footer>
</body>

</html>