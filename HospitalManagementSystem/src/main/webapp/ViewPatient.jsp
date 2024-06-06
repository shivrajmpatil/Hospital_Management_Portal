<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Patient</title>
</head>
<body>
<%@ include file="ReceptionistDash.html" %>
	<div class="p-3">
        <div id="view">
            <h2>PATIENTS</h2>
            <table class="table" ">
			<thead>
				<tr>
					<th scope="col">Sr no.</th>
					<th scope="col">Name</th>
					<th scope="col">Gender</th>
					<th scope="col">Age</th>
					<th scope="col">Disease</th>
					<th scope="col">Blood G.</th>
					<th scope="col">Contact</th>
					<th scope="col">Address</th>
					<th scope="col">Update</th>
					<th scope="col">Delete</th>
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
					<td scope="row"><b><%=++count %></b></td>
					<td><%= l.getName() %></td>
					<td><%= l.getGender() %></td>
					<td><%= l.getAge() %></td>
					<td><%= l.getDisease() %></td>
					<td><%= l.getBloodgroup() %></td>
					<td><%= l.getContact() %></td>
					<td><%= l.getAddress() %></td>
					<td><a href="UpdatePatient.jsp?Pid=<%=l.getPid()%>&Name=<%=l.getName()%>&Gender=<%=l.getGender()%>&Age=<%=l.getAge()%>&Disease=<%=l.getDisease() %>&Bloodgroup=<%=l.getBloodgroup() %>&Contact=<%=l.getContact()%>&Address=<%=l.getAddress()%>"><i class="lni lni-pencil-alt"></i></a></td>
					<td><a href="DeletePatient?Pid=<%=l.getPid()%>" style="color:red;"><i class="lni lni-trash-can"></i></a></td>
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