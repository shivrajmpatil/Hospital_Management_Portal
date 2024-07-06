<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All Patients</title>
</head>
<body>
	<%
	 if(session.getAttribute("Did")==null)
	 {
		response.sendRedirect("DoctorLogin.jsp");
	 }
	 %>
<%@ include file="DoctorDash.html" %>
	<div class="p-3">
	<% if(session.getAttribute("Did")==null)
	{
		response.sendRedirect("DoctorLogin.jsp");
	}
		response.setHeader("Cache-Control", "no-cache, must-revalidate");
		%>
            <div id="view" style="margin-left:250px;">
            <h2>ALL PATIENTS LIST</h2>
            <table class="table">
			<thead>
				<tr>
					<th scope="col">Sr no.</th>
					<th scope="col">Name</th>
					<th scope="col">Disease</th>
					<th scope="col">Gender</th>
					<th scope="col">Age</th>
					<th scope="col">Blood.G</th>
					<th scope="col">Contact</th>
					<th scope="col">Address</th>
				</tr>
			</thead>
			 <%! PatientModel model = new PatientModel();
			 PatientService ps = new PatientService();     		
               %>
			<tbody>
				<%	
				List<PatientModel> list = ps.viewAllPatient();
				int count=0;
				if(list!=null)
				{
					for(PatientModel l:list)
					{
				%>
					<tr>
					<th scope="row"><%=++count %></th>
					<td><%= l.getName() %></td>
					<td><%= l.getDisease()%></td>
					<td><%= l.getGender() %></td>
					<td><%= l.getAge() %></td>
					<td><%= l.getBloodgroup() %></td>
					<td><%= l.getContact() %></td>
					<td><%= l.getAddress() %></td>
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