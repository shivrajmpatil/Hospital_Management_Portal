<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Doctor</title>
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
            <h2>DOCTORS</h2>
            <table class="table" >
			<thead>
				<tr>
					<th scope="col">Sr no.</th>
					<th scope="col">Name</th>
					<th scope="col">Specilization</th>
					<th scope="col">Gender</th>
					<th scope="col">Contact</th>
					<th scope="col">Username</th>
					<th scope="col">Update</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>
			 <%! DoctorModel model = new DoctorModel();
			 DoctorService ds = new DoctorService();     		
               %>
			<tbody>
				<%	
				List<DoctorModel> list = ds.viewAllDoctor();
				int count=0;
				if(list!=null)
				{
					for(DoctorModel l:list)
					{
				%>
					<tr>
					<th scope="row"><%=++count %></th>
					<td><%= l.getName() %></td>
					<td><%= l.getSpecilization() %></td>
					<td><%= l.getGender() %></td>
					<td><%= l.getContact() %></td>
					<td><%= l.getUsername() %></td>
					<td><a href="UpdateDoctor.jsp?Did=<%=l.getDid()%>&Name=<%=l.getName()%>&Sid=<%=l.getSid()%>&Specialization=<%=l.getSpecilization()%>&Gender=<%=l.getGender() %>&Contact=<%=l.getContact()%>&Username=<%=l.getUsername()%>"><i class="lni lni-pencil-alt"></i></a></td>
					<td><a href="DeleteDoctor?Did=<%=l.getDid()%>" style="color:red;"><i class="lni lni-trash-can"></i></a></td>
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