<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Specilization</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/Hospital.css">
    <script type="text/javascript" src="JS/Validation.js"></script>
    <style>
        .specilization {
        	width: 500px;
            margin: 0px 400PX;
        }
    </style>
</head>

<body>
  <%@ include file="AdminDash.html" %>
        <div class="p-3">
            <div class="frm specilization">
            <h2>Specilization</h2>
            <form action="" name="frm">
                <label for="specilization">Specilization Name</label><br>
                <input type="text" id="spe" value="" onkeyup="validSep(this.value)" name="specilization"><br><br>
                <button type="submit" name="s">Add Specilization</button>
            </form>
            <%! DoctorModel model = new DoctorModel();
       			 DoctorService ds = new DoctorService();     		
               %>
			<% String s= request.getParameter("s");
      		 if(s!=null)
      		 {
    		   String Spe = request.getParameter("specilization");
    	 	 	 model.setSpecilization(Spe);
    	  	 	int value = ds.isSpecilizationAdd(model);
    	   
    	  	 	if(value>0)
    	  		 {
    		  		 RequestDispatcher r = request.getRequestDispatcher("ViewSpecilization.jsp");
    		  		 r.forward(request, response);
    	  		 }
    	  		 else if(value==0)
    	  		 {
    		 		  out.println("<h4>Specilization Already Present</h4>");
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