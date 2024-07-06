<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Receptionist</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/Hospital.css">
    <style>
        .receptionist {
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
            <div class="frm receptionist">
            <h2>New Receptionist</h2><br>
            <form action="" name="frm">
                <input type="text" name="name" placeholder="Receptionist Name" required><br>
                <input type="radio" name="gender" value="Male">Male
                <input type="radio" name="gender" value="Female">Female
                <input type="radio" name="gender" value="Other">Other<br>
                <input type="text" name="contact" placeholder="Contact" required><br><br>
                Create a unique username & a strong password.<br>
                <input type="text" name="user" placeholder="User Name" required><br><br>
                <input type="text" name="pass" placeholder="Password" required><br><br>
                <button type="submit" name="s">Add Receptionist</button>
            </form>
            <%! 
       			 ReceptionistService ds = new ReceptionistService();     		
               %>
			<% String s= request.getParameter("s");
      		 if(s!=null)
      		 {
    		   String name = request.getParameter("name");
    		   String gender = request.getParameter("gender");
    		   String contact = request.getParameter("contact");
    		   String username = request.getParameter("user");
    		   String pass = request.getParameter("pass");
    		   
    		   ReceptionistModel model = new ReceptionistModel(name,gender,contact,username,pass);
    	  	 	int value = ds.isReceptionistAdd(model);
    	   
    	  	 	if(value>0)
    	  		 {
    		  		 RequestDispatcher r = request.getRequestDispatcher("ViewReceptionist.jsp");
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