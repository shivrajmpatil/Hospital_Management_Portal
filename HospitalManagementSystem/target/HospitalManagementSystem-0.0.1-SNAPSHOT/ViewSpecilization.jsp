<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Specialization</title>
</head>
<body>
<%@ include file="AdminDash.html" %>
	<div class="p-3">
            <div id="view" style="margin-left:300px;">
            <h2 style="text-align:center;">Specializations</h2>
            <table class="table">
			<thead>
				<tr>
					<th scope="col">Sr no.</th>
					<th scope="col">Specialization</th>
					<th scope="col">Update</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>
			 <%! DoctorModel model = new DoctorModel();
       			 DoctorService ds = new DoctorService();     		
               %>
			<tbody>
				<%	
				List<DoctorModel> list = ds.viewSpecilization();
				int count=0;
				if(list!=null)
				{
					for(DoctorModel l:list)
				{
				%>
				<tr>
					<th scope="row"><%=++count %></th>
					<td><%= l.getSpecilization() %></td>
					<td><a href="UpdateSpecilization.jsp?Sid=<%=l.getSid()%>&Specilization=<%=l.getSpecilization()%>"><i class="lni lni-pencil-alt"></i></a></td>
					<td><a href="DeleteSpec?Sid=<%=l.getSid()%>" style="color:red;"><i class="lni lni-trash-can"></i></a></td>
				</tr>
			
			 	<%
				 }
				}
				%>
			</tbody>
		</table>
		<h6>*Note: If a doctor is present for a specific specialization, you are not able to delete that specialization.</h6>
       		</div>
        </div>
    </div>

    <footer>

        <p>&copy; 2024 Our Hospital. All rights reserved.</p>

    </footer>
</body>
</html>