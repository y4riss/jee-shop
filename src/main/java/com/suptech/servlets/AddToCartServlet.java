package com.suptech.servlets;

import javax.servlet.http.*;

import java.io.IOException;

import javax.servlet.ServletException;
import com.suptech.dao.CartDao;
import com.suptech.dao.ProductDao;
import com.suptech.entities.Cart;
import com.suptech.entities.Message;
import com.suptech.helper.ConnectionProvider;

public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int uid = Integer.parseInt(req.getParameter("uid"));
		int pid = Integer.parseInt(req.getParameter("pid"));

		CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
		int qty = cartDao.getQuantity(uid, pid);
		HttpSession session = req.getSession();
		Message message = null;
		
		if (qty == 0) {
			Cart cart = new Cart(uid, pid, qty + 1);
			cartDao.addToCart(cart);
			message = new Message("Product is added to cart successfully!", "success", "alert-success");
			
		}else {
			int cid = cartDao.getIdByUserIdAndProductId(uid, pid);
			cartDao.updateQuantity(cid, qty+1);
			message = new Message("Product quantity is increased!", "success", "alert-success");
		}
		//updating quantity of product in database
		ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
		productDao.updateQuantity(pid, productDao.getProductQuantityById(pid) - 1);
		session.setAttribute("message", message);
		resp.sendRedirect("viewProduct.jsp?pid="+pid);
	}

}
