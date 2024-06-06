<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Bill</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/Hospital.css">
    <style>
        .Patient {
        	width:600px;
            margin: 100px 400PX;
        }
    </style>
</head>

<body>
  <%@ include file="ReceptionistDash.html" %>
        <div class="p-3">
            <div class="frm Patient">
            <%! 
            	PatientService ps = new PatientService();     		
               %>
            <h2>Enter Patient Id & Amount to Add</h2>
            <form action="" name="frm">
            	<input type="text" name="Pid" placeholder="Enter Patient Id" ><br><br>
            	<input type="text" name="Amount" placeholder="Enter Amount" value="0"><br><br>
                <button type="submit" name="s">Add Amount</button>&nbsp;&nbsp;
                <button type="submit" name="s">View Bill</button>
            </form>
           
			<% String s= request.getParameter("s");
      		 if(s!=null)
      		 {
    		   int Pid = Integer.parseInt(request.getParameter("Pid"));
    		   int Amount = Integer.parseInt(request.getParameter("Amount"));
    		   
    		   boolean b = ps.updateBill(Pid, Amount);
    		   
    	   		if(b)
    	   		{	
    	   			Amount = ps.getBill(Pid);
    	   			out.println("<br><table><tr><th>Patient Bill</th></tr>");
    	   			out.println("<tr><th>Patient Id. :</th><td>"+Pid+"</td></tr>");
    	   			out.println("<tr><th>Bill Amount :</th><td>"+Amount+"</td></tr></table>");
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