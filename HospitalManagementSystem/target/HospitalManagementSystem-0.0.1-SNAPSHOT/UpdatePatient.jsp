<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Patient</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/Hospital.css">
    <style>
        .Patient {
        	width: 500px;
            margin: 0px 400PX;
        }
    </style>
</head>

<body>
  <%@ include file="ReceptionistDash.html" %>
        <div class="p-3">
            <div class="frm Patient">
            <%
            PatientService ps = new PatientService();
            int pid = Integer.parseInt(request.getParameter("Pid"));
            String name = request.getParameter("Name");
 		   String gender = request.getParameter("Gender");
 		   int age = Integer.parseInt(request.getParameter("Age"));
 		   String bloodgroup = request.getParameter("Bloodgroup");
 		   String contact = request.getParameter("Contact");
 		   String disease = request.getParameter("Disease");
 		   String address = request.getParameter("Address");
               %>
            <h2>Update Patient</h2>
            <form action="" name="frm">
            	<input type="hidden" name="Pid" value="<%=pid %>">
            	<input type="text" name="Name" value="<%=name %>" required><br>
                <input type="radio" name="Gender" value="Male" required>Male
                <input type="radio" name="Gender" value="Female" required>Female
                <input type="radio" name="Gender" value="Other" required>Other<br>
                Bloodgroup:
                <select name="Bloodgroup">
                	<option value="<%=bloodgroup %>" selected="selected"><%=bloodgroup %></option>
                	<option value="O+">O+</option>
                	<option value="A+">A+</option>
                	<option value="B+">B+</option>
                	<option value="AB+">AB+</option>
                	<option value="O-">O-</option>
                	<option value="AB-">AB-</option>
                </select><br>
                Age:<br>
                <input type="text" name="Age" value="<%=age %>" required><br>
                Contact:<br>
                <input type="text" name="Contact" value="<%=contact %>" required><br>
                Disease<br>
                <input type="text" name="Disease" value="<%=disease %>" required><br>
                Address<br>
                <input type="text" name="Address" value="<%=address %>" required><br><br>
                <button type="submit" name="s">Update Patient</button>
            </form>
           
			<% String s= request.getParameter("s");
      		 if(s!=null)
      		 {
    		   PatientModel model = new PatientModel(pid,name,bloodgroup,age,gender,contact,disease,address);
    	  	 	boolean b = ps.updatePatient(model);
    	   
    	  	 	if(b)
    	  		 {
    		  		 RequestDispatcher r = request.getRequestDispatcher("ViewPatient.jsp");
    		  		 r.forward(request, response);
    	  		 }
    	   		else
    	   		{
    			   out.println("<h4>Some problem is there</h4>");
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