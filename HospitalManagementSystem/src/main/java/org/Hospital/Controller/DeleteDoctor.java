package org.Hospital.Controller;

import java.io.IOException;

import org.Hospital.Service.DoctorService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
 
@WebServlet("/DeleteDoctor")
public class DeleteDoctor extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int Did = Integer.parseInt(request.getParameter("Did"));
		
		DoctorService ds = new DoctorService();
		
		boolean b = ds.deleteDoctor(Did);
		
		if(b)
		{
			RequestDispatcher r = request.getRequestDispatcher("ViewDoctor.jsp");
			r.forward(request, response);
		}
	}

}
