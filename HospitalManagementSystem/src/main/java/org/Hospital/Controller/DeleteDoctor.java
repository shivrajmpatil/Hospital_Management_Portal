package org.Hospital.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.Hospital.Service.DoctorService;

/**
 * Servlet implementation class DeleteDoctor
 */
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
