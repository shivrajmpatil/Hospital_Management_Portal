package org.Hospital.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.Hospital.Service.ReceptionistService;

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
