package org.Hospital.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.Hospital.Service.PatientService;

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
