<% 
    response.setHeader("Cache-Control", "no-cache, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Appointed Patients</title>
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
            <div id="view" style="margin-left:250px;">
            <h2 style="text-align:center;">APPOINTED PATIENTS LIST</h2>
            <table class="table">
			<thead>
				<tr>
					<th scope="col">Sr no.</th>
					<th scope="col">Name</th>
					<th scope="col">Gender</th>
					<th scope="col">Date</th>
					<th scope="col">Contact</th>
					<th scope="col">Category</th>
					<th scope="col">Upgrade</th>
				</tr>
			</thead>
			 <%! PatientModel model = new PatientModel();
			 PatientService ps = new PatientService();     		
               %>
			<tbody>
				<%	
				int did = Integer.parseInt(session.getAttribute("Did").toString());
				List<PatientModel> list = ps.viewAppointedPatient(did);
				int count=0;
				if(list!=null)
				{
					for(PatientModel l:list)
					{
				%>
					<tr>
					<th scope="row"><%=++count %></th>
					<td><%= l.getName() %></td>
					<td><%= l.getGender() %></td>
					<td><%= l.getAppointmentDate()%></td>
					<td><%= l.getCategory() %></td>
					<td><%= l.getContact() %></td>
					<td><a href="UpdatePatientStatus.jsp?Pid=<%=l.getPid()%>" style="color:red;"><i class="lni lni-check-box"></i></a></td>
					</tr>
			 	<%
				 	}
				}
				else
				{
				%>
				 <tr><td></td><td>Patient</td><td></td><td>Not</td><td></td><td>Appointed</td><td></td></tr>
				<%
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