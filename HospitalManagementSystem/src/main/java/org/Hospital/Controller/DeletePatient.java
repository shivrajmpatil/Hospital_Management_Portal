package org.Hospital.Controller;

import java.io.IOException;

import org.Hospital.Service.PatientService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeletePatient")
public class DeletePatient extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int Pid = Integer.parseInt(request.getParameter("Pid"));
		
		PatientService ps = new PatientService();
		boolean b = ps.deletePatient(Pid);
		
		if(b)
		{
			RequestDispatcher r = request.getRequestDispatcher("ViewPatient");
			r.forward(request, response);
		}
	}

}
