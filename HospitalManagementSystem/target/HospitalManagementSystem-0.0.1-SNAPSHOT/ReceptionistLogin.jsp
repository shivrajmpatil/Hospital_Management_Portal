<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Hospital.Service.*,org.Hospital.Model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receptionist Login</title>
<link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/Hospital.css">
    <style>
        .receptionistLogin {
            margin: 0px 550PX;
        }
    </style>
</head>

<body>
    <header>
        <div id="title">
            <h1><b>LOTUS HEALTH CARE</b></h1>
        </div>
    </header>
    <nav>
        <ul>
            <li>
                <a href="HomePage.jsp"><b>Home</b></a>
            </li>
            <li>
                <a href="AdminLogin.jsp"><b>Admin Login</b></a>
            </li>
            <li>
                <a href="DoctorLogin.jsp"><b>Doctor Login</b></a>
            </li>
            <li>
                <a href="ReceptionistLogin.jsp"><b>Reception Login</b></a>
            </li>
        </ul>
    </nav>
    <main class="backimg" style="background-image: url(Image/back.jpg); background-size:cover; height:85vh">
        <div class="frm receptionistLogin">
            <h2>RECEPTIONIST LOGIN</h2>
            <form action="" name="frm">
                <label for="username">User Name</label><br>
                <input type="text" name="user"><br>
                <label for="password">Password</label><br>
                <input type="password" name="pass"><br><br>
                <button type="submit" name="s">Submit</button>
            </form>
       
	<% String s= request.getParameter("s");
       if(s!=null)
       {
    	   String user = request.getParameter("user");
    	   String pass = request.getParameter("pass");
    	   
    	   ReceptionistModel model = new ReceptionistModel();
    	   model.setUsername(user);
    	   model.setPassword(pass);
    	   ReceptionistService rs = new ReceptionistService();
    	   int Rid = rs.checkLogin(model);
    	   
    	   if(Rid>0)
    	   {
    		HttpSession Session = request.getSession(true);
    		Session.setAttribute("Rid", Rid);
    	   	RequestDispatcher r = request.getRequestDispatcher("ViewPatient.jsp");
    	   	r.forward(request, response);
    	   }
    	   else
    		   out.println("<h6>*Wrong Inputs</h6>");
       }
             %>
             </div>
    </main>
    <footer>

        <p>&copy; 2024 Our Hospital. All rights reserved.</p>

    </footer>

</body>

</html>