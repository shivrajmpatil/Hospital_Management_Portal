<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Updated Patient</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/Hospital.css">
    <style>
        .Patient {
        	width:800px;
            margin: 100px 200PX;
        }
    </style>
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
            <div class="frm Patient" style="text-align:center;">
            <%! 
            	PatientService ps = new PatientService();     		
               %>
           
			<% 
    		   int Pid = Integer.parseInt(request.getParameter("Pid"));
			   String Name = request.getParameter("Name");
			   String Bloodgroup = request.getParameter("Bloodgroup");
			   int Age = Integer.parseInt(request.getParameter("Age"));
			   String Disease =request.getParameter("Disease");
			   String Category = request.getParameter("Category");
			   String Ocat = request.getParameter("Ocat");
   			   String Prescription = request.getParameter("Prescription");
   			   
   			   PatientModel model = new PatientModel();
   			    model.setPid(Pid);
   				model.setPrescription(Prescription);
   				model.setDisease(Disease);
   				model.setCategory(Category);
   				
   				boolean b = ps.setPrescription(model);
   				
   				if(b)
   				{
   					if(Category!=null)
   					{
   						if(!Category.equals(Ocat) && Category.equals("IPD"))
   						{
   							b = ps.admmitPatient(model);
   							
   						}
   						
   						if(!Category.equals(Ocat) && Category.equals("OPD"))
   						{
   							b = ps.dischargePatinet(model);
   						}
   					}
   				}
    		   
    		   model = ps.getPatientStatus(Pid); 
    	   	 %>
    	   	 <h3>Patient Updated Successfully.</h3>
    	   	 <table>
    	   	 <tr><th>P.ID :</th><td><%=model.getPid() %></td></tr>
    	   	  <tr><th>Name :</th><td><%=model.getName() %></td></tr>
    	   	   <tr><th>Bloodgroup :</th><td><%=model.getBloodgroup() %></td></tr>
    	   	    <tr><th>Age :</th><td><%=model.getAge() %></td></tr>
    	   	     <tr><th>Disease :</th><td><%=model.getDisease() %></td></tr>
    	   	     <tr><th>Category :</th><td><%=model.getCategory() %></td></tr>
    	   	     <tr><th>Prescription :</th><td><%=model.getPrescription() %></td></tr>
    	   	 </table>
       		</div>
        </div>
    </div>

    <footer>

        <p>&copy; 2024 Our Hospital. All rights reserved.</p>

    </footer>
</body>

</html>