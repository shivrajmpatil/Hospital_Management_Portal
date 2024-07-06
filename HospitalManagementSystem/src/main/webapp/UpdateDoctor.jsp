<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Doctor</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/Hospital.css">
    <script src="JS/Validation.js"></script>
    <style>
        .doctor {
        	width: 500px;
            margin: 0px 400PX;
        }
    </style>
</head>

<body>
	<%
	 if(session.getAttribute("Admin")==null)
	 {
		response.sendRedirect("AdminLogin.jsp");
	 }
	 %>
  <%@ include file="AdminDash.html" %>
        <div class="p-3">
            <div class="frm doctor">
            <%! 
       			 DoctorService ds = new DoctorService();  
               %>
               <%
               String s= null;
               int did = Integer.parseInt(request.getParameter("Did"));
               String name = request.getParameter("Name");
               int sid = Integer.parseInt(request.getParameter("Sid"));
               String specialization = request.getParameter("Specialization");
    		   String gender = request.getParameter("Gender");
    		   String contact = request.getParameter("Contact");
    		   String username = request.getParameter("Username");
               %>
            <h2>Update Doctor</h2>
            <form action="" name="frm">
            	<input type="hidden" name="Did" value="<%=did %>">
                <input type="text" name="Name" value="<%=name %>" required><br><br>
                <select name="Sid">
              <option value="<%=sid%>" selected="selected"><%=specialization %></option>
               
                	<% List<DoctorModel> list = ds.viewSpecilization();
                		for(DoctorModel l : list)
                		{
                			%>
                			<option value="<%=l.getSid()%>"><%=l.getSpecilization()%></option>
                			<% 
                		}
                	%>
                </select>
                <input type="hidden" name="Specialization" value="<%=specialization %>">
                <br><br>
                <input type="radio" name="Gender" value="Male" required>Male
                <input type="radio" name="Gender" value="Female" required>Female
                <input type="radio" name="Gender" value="Other" required>Other<br><br>
                <input type="text" name="Contact" value="<%=contact%>" required><br><br>
                 Username:<br>
                <input type="text" name="Username" value="<%=username %>" required><br><br>
                <button type="submit" name="s">Update Doctor</button>
            </form>
           
			<% s= request.getParameter("s");
      		 if(s!=null)
      		 { 
    		   DoctorModel model = new DoctorModel(did,name,gender,contact,username,sid);
    	  	 	int value = ds.updateDoctor(model);
    	   
    	  	 	if(value>0)
    	  		 {
    		  		 RequestDispatcher r = request.getRequestDispatcher("ViewDoctor.jsp");
    		  		 r.forward(request, response);
    	  		 }
    	  		 else if(value==0)
    	  		 {
    		 		  out.println("<h4>Username Already Present</h4>");
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