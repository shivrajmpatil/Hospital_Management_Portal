<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Doctors List</title>
</head>
<body>
<%@ include file="ReceptionistDash.html" %>
	<div class="p-3">
            <div id="view" style="margin-left:300px;">
            <h2>ALL DOCTORS LIST</h2>
            <table class="table">
			<thead>
				<tr>
					<th scope="col">Sr no.</th>
					<th scope="col">D.Id</th>
					<th scope="col">Name</th>
					<th scope="col">Specilization</th>
					<th scope="col">Gender</th>
					<th scope="col">Contact</th>
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
					<th scope="row"><%= l.getDid() %></th>
					<td><%= l.getName() %></td>
					<td><%= l.getSpecilization() %></td>
					<td><%= l.getGender() %></td>
					<td><%= l.getContact() %></td>
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