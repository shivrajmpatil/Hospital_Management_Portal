package org.Hospital.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.Hospital.Service.DoctorService;

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
