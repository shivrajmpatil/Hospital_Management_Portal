<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Receptionist</title>
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
  <%@ include file="AdminDash.html" %>
        <div class="p-3">
            <div class="frm receptionist">
            <%
            	int rid = Integer.parseInt(request.getParameter("Rid"));
            	String name = request.getParameter("Name");
 		  	 	String gender = request.getParameter("Gender");
 		  	 	String contact = request.getParameter("Contact");
 		   		String username = request.getParameter("Username");
 		   		String password = request.getParameter("Password");
            %>
            <h2>Receptionist</h2>
            <form action="" name="frm">
            	<input type="hidden" name="Rid" value="<%=rid %>">
                <input type="text" name="Name" value="<%=name %>" required><br>
                <input type="radio" name="Gender" value="male" required>Male
                <input type="radio" name="Gender" value="female" required>Female
                <input type="radio" name="Gender" value="other" required>Other<br>
                <input type="text" name="Contact" value="<%=contact %>" required><br>
                Username:<br>
                <input type="text" name="Username" value="<%=username %>" required><br>
                Password:<br>
                <input type="text" name="Password" value="<%=password %>" required><br><br>
                <button type="submit" name="s">Update Receptionist</button>
            </form>
            <%! 
       			 ReceptionistService ds = new ReceptionistService();     		
               %>
			<% String s= request.getParameter("s");
      		 if(s!=null)
      		 { 
    		   ReceptionistModel model = new ReceptionistModel(rid,name,gender,contact,username,password);
    	  	 	boolean b = ds.isReceptionistUpdate(model);
    	   
    	  	 	if(b)
    	  		 {
    		  		 RequestDispatcher r = request.getRequestDispatcher("ViewReceptionist.jsp");
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