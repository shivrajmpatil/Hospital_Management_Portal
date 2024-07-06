<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Patient Status</title>
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
            <div class="frm Patient">
            <%
            	PatientService ps = new PatientService();     		
           
    		   int Pid = Integer.parseInt(request.getParameter("Pid"));
    		   
    		   PatientModel models = ps.getPatientStatus(Pid);
    		   
    	   		if(models!=null)
    	   		{	String Name = models.getName();
    	   			String Bloodgroup = models.getBloodgroup();
    	   			int Age = models.getAge();
    	   			String Ocat = models.getCategory();
    	   			String Disease = models.getDisease();
    	   			String Category = models.getCategory();
    	   			out.println("<table>");
    	   			out.println("<tr><th>P.Id :</th> <td>"+Pid+"</td></tr>");
    	   			out.println("<tr><th>Name :</th> <td>"+Name+"</td></tr>");
    	   			out.println("<tr><th>Bloodgroup :</th> <td>"+Bloodgroup+"</td></tr>");
    	   			out.println("<tr><th>Age :</th> <td>"+models.getAge()+"</td></tr>");
    	   			out.println("</table>");
    	   			out.println("<form action='UpdatedPatient.jsp?Pid=Pid&Name=Name&Bloodgroup=Bloodgroup&Age=Age&Disease"+Disease+"&Category"+Category+"&Ocat="+Ocat+"&Prescription=Prescription'>");
    	   			out.println("<input type='hidden' name='Pid' value='"+Pid+"'>");
    	   			out.println("<input type='hidden' name='Name' value='"+Name+"'>");
    	   			out.println("<input type='hidden' name='Bloodgroup' value='"+Bloodgroup+"'>");
    	   			out.println("<input type='hidden' name='Age' value='"+Age+"'>");
    	   			out.println("<b>Disease :&nbsp;&nbsp;</b><input type='text' name='Disease' value='"+Disease+"'>&nbsp;&nbsp;&nbsp;&nbsp;");
    	   			out.println("<b>Category :&nbsp;&nbsp;</b><select name='Category'>");
    	   			out.println("<option value='"+Category+"' selected>"+models.getCategory()+"</option>");
    	   			out.println("<option value='IPD'>IPD</option>");
    	   			out.println("<option value='OPD'>OPD</option></select><br>");
    	   			out.println("<input type='hidden' name='Ocat' value='"+Ocat+"'>");
    	   			out.println("<b>Last-Prescription :</b> <pre>"+models.getPrescription()+"</pre>");
    	   			out.println("<b>New-Prescription :&nbsp;&nbsp;</b><input type='text' name='Prescription'required>&nbsp;&nbsp;");
    	   			out.println("<button type='submit' name='u'>Update</button>");
    	   			out.println("</form>");
    	   			
    	   		}
             %>
       		</div>
	
        </div>
    </div>

    <footer>

        <p>&copy; 2024 Our Hospital. All rights reserved.</p>

    </footer>
</body>

</html>