<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Receptionist</title>
</head>
<body>
	<% 
	if(session.getAttribute("Admin")==null)
	{
		response.sendRedirect("AdminLogin.jsp");
	}
	%>
<%@ include file="AdminDash.html" %>
	<div class="p-3">
            <div id="view">
            <h2 style="text-align:center;">RECEPTIONIST</h2>
            <table class="table">
			<thead>
				<tr>
					<th scope="col">Sr no.</th>
					<th scope="col">Name</th>
					<th scope="col">Gender</th>
					<th scope="col">Contact</th>
					<th scope="col">Username</th>
					<th scope="col">Password</th>
					<th scope="col">Update</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>
			 <%! ReceptionistModel model = new ReceptionistModel();
       			 ReceptionistService rs = new ReceptionistService();     		
               %>
			<tbody>
				<%	
				List<ReceptionistModel> list = rs.viewAllReceptionist();
				int count=0;
				if(list!=null)
				{
					for(ReceptionistModel l:list)
				{
				%>
				<tr>
					<th scope="row"><%=++count %></th>
					<td><%= l.getName() %></td>
					<td><%= l.getGender() %></td>
					<td><%= l.getContact() %></td>
					<td><%= l.getUsername() %></td>
					<td><%= l.getPassword() %></td>
					<td><a href="UpdateReceptionist.jsp?Rid=<%=l.getRid()%>&Name=<%=l.getName()%>&Gender=<%=l.getGender()%>&Contact=<%=l.getContact()%>&Username=<%=l.getUsername()%>&Password=<%=l.getPassword()%>"><i class="lni lni-pencil-alt"></i></a></td>
					<td><a href="DeleteReceptionist?Rid=<%=l.getRid()%>" style="color:red;"><i class="lni lni-trash-can"></i></a></td>
				</tr>
			
			 	<%
				 }
				}
				%>
			</tbody>
		</table>
       		</div>
	
        </div>
    </div>

    <footer>

        <p>&copy; 2024 Our Hospital. All rights reserved.</p>

    </footer>
</body>
</html>