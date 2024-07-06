package org.Hospital.Controller;

import java.io.IOException;

import org.Hospital.Service.DoctorService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteSpec")
public class DeleteSpecilization extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int Sid = Integer.parseInt(request.getParameter("Sid"));
		System.out.println(Sid);
		DoctorService ds = new DoctorService();
		
		boolean b = ds.deleteSpecilization(Sid);
		
		if(b)
		{
			RequestDispatcher r = request.getRequestDispatcher("ViewSpecilization.jsp");
			r.forward(request, response);
		}
		else
		{
			RequestDispatcher r = request.getRequestDispatcher("ViewSpecilization.jsp");
			r.forward(request, response);
		}
		
	}

}
