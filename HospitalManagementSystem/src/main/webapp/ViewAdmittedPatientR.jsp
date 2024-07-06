<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Admitted Patients</title>
</head>
<body>
	<%
	 if(session.getAttribute("Rid")==null)
	 {
		response.sendRedirect("ReceptionistLogin.jsp");
	 }
	 %>
<%@ include file="ReceptionistDash.html" %>
	<div class="p-3">
            <div id="view" style="margin-left:300px;">
            <h2 style="text-align:center;">ADMITTED PATIENTS LIST</h2>
            <table class="table" style="color: #430A5D;">
			<thead>
				<tr>
					<th scope="col">Sr no.</th>
					<th scope="col">Patient ID</th>
					<th scope="col">Name</th>
					<th scope="col">Disease</th>
					<th scope="col">Admit Date</th>
					<th scope="col">D.ID</th>
				</tr>
			</thead>
			 <%! PatientModel model = new PatientModel();
			 PatientService ps = new PatientService();     		
               %>
			<tbody>
				<%	
				List<PatientModel> list = ps.viewAdmmitPatients();
				int count=0;
				if(list!=null)
				{
					for(PatientModel l:list)
					{
				%>
					<tr>
					<th scope="row"><%=++count %></th>
					<td><%= l.getPid() %></td>
					<td><%= l.getName() %></td>
					<td><%= l.getDisease() %></td>
					<td><%= l.getAdmmitDate()%></td>
					<td><%= l.getDid() %></td>
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