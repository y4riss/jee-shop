<%@page import="com.suptech.entities.Message"%>
<%@page import="com.suptech.entities.Product"%>
<%@page import="com.suptech.dao.ProductDao"%>
<%@page import="com.suptech.entities.Wishlist"%>
<%@page import="java.util.List"%>
<%@page errorPage="error_exception.jsp"%>
<%@page import="com.suptech.entities.User"%>
<%@page import="com.suptech.helper.ConnectionProvider"%>
<%@page import="com.suptech.dao.WishlistDao"%>

<%
User u1 = (User) session.getAttribute("activeUser");
if (u1 == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("login.jsp");
	return;  
}
WishlistDao wishListDao = new WishlistDao(ConnectionProvider.getConnection());
List<Wishlist> wlist = wishListDao.getListByUserId(u1.getUserId());
ProductDao pDao = new ProductDao(ConnectionProvider.getConnection());
%>
<div class="container px-3 py-3">
	<%
	if (wlist == null || wlist.size() == 0) {
	%>
	<div class="container mt-5 mb-5 text-center">

		<h4 class="mt-3">Empty Wishlist</h4>
		You have no items in your wishlist. Start adding!
	</div>
	<%
	} else {
	%>
	<h4>
		My Wishlist (<%=wlist.size()%>)
	</h4>
	<hr>
	<div class="container">
		<table class="table table-hover">
			<%
			for (Wishlist w : wlist) {
				Product p = pDao.getProductsByProductId(w.getProductId());
			%>
			<tr class="text-center">
				<td><img src="Product_imgs\<%=p.getProductImages()%>"
					style="width: 50px; height: 50px; width: auto;"></td>
				<td class="text-start"><%=p.getProductName()%></td>
				<td><%=p.getProductPriceAfterDiscount()%></td>
				<td><a
					href="WishlistServlet?uid=<%=u1.getUserId()%>&pid=<%=p.getProductId()%>&op=delete"
					class="btn btn-warning" role="button">Remove</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<%
	}
	%>
</div>
