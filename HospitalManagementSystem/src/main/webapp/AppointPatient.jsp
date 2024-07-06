<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*,java.util.*,java.sql.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appoint Patient</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/Hospital.css">
    <style>
        .Patient {
        	width: 500px;
        	margin: 0px 450px;
        }
    </style>
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
            <div class="frm Patient">
            <%! 
            	PatientService ps = new PatientService();     		
               %>
            <h2>Appoint Patient</h2>
            <form action="" name="frm">
                <input type="text" name="Pid" placeholder="Enter Patinet Id" required><br><br>
                <input type="Date" name="Date" placeholder="YYYY-MM-DD" required><br><br>
                <input type="text" name="Disease" placeholder="Patient Disease" required><br><br>
                <input type="text" name="Did" placeholder="Enter Doctor Id" required><br><br>
                <button type="submit" name="s">Appoint Patient</button>
            </form>
           
			<% String s= request.getParameter("s");
      		 if(s!=null)
      		 {
    		   int pid = Integer.parseInt(request.getParameter("Pid"));
    		  String date = request.getParameter("Date");
    		   String disease = request.getParameter("Disease");
    		   int did = Integer.parseInt(request.getParameter("Did"));
    		   Date d1= Date.valueOf(date);
    		   
    		   PatientModel model = new PatientModel();
    		 	 model.setPid(pid);
				model.setAppointmentDate(d1 );
				model.setDid(did);
				model.setDisease(disease);
				int check = ps.setAppointment(model);
    	  	 	if(check>0)
    	  		 {
    		  		 out.println("<h3>Appointment Done....!</h3>");
    	  		 }
    	   		else
    	   		{
    			   out.println("<h4>*Your are selected previous Date</h4>");
    	  		 }
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