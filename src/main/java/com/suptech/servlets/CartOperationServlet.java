package com.suptech.servlets;

import javax.servlet.http.*;
import javax.servlet.ServletException;

import java.io.IOException;

import com.suptech.entities.Message;
import com.suptech.helper.ConnectionProvider;

import com.suptech.dao.CartDao;
import com.suptech.dao.ProductDao;


public class CartOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
		ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
		int cid =Integer.parseInt(request.getParameter("cid"));
		int opt =Integer.parseInt(request.getParameter("opt"));
		
		int qty = cartDao.getQuantityById(cid);
		int pid = cartDao.getProductId(cid);
		int quantity = productDao.getProductQuantityById(pid);	
		
		if(opt == 1) {
			if(quantity > 0) {
				cartDao.updateQuantity(cid, qty+1);
				//updating(decreasing) quantity of product in database
				productDao.updateQuantity(pid, productDao.getProductQuantityById(pid) - 1);
				response.sendRedirect("cart.jsp");
				
			}else {
				HttpSession session = request.getSession();
				Message message = new Message("Product out of stock!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("cart.jsp");
			}
			
		}else if(opt == 2) {
			cartDao.updateQuantity(cid, qty-1);
			
			//updating(increasing) quantity of product in database
			productDao.updateQuantity(pid, productDao.getProductQuantityById(pid) + 1);
			response.sendRedirect("cart.jsp");
			
		}else if(opt == 3) {
			cartDao.removeProduct(cid);
			HttpSession session = request.getSession();
			Message message = new Message("Product removed from cart!", "success", "alert-success");
			session.setAttribute("message", message);
			
			//updating quantity of product in database
			//adding all the product qty back to database
			productDao.updateQuantity(pid, productDao.getProductQuantityById(pid) + qty);
			response.sendRedirect("cart.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
