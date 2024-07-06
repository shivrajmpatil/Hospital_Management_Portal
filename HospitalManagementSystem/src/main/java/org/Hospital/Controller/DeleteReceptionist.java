package org.Hospital.Controller;

import java.io.IOException;

import org.Hospital.Service.ReceptionistService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteReceptionist
 */
@WebServlet("/DeleteReceptionist")
public class DeleteReceptionist extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int Rid = Integer.parseInt(request.getParameter("Rid"));
		
		ReceptionistService rs = new ReceptionistService();
		boolean b = rs.isRemoveReceptionist(Rid);
		
		if(b)
		{
			RequestDispatcher r = request.getRequestDispatcher("ViewReceptionist.jsp");
			r.forward(request, response);
		}
	}
}
