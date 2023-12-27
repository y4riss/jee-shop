<%@page import="com.eazydeals.entities.Admin"%>
<%@page import="com.eazydeals.entities.Cart"%>
<%@page import="com.eazydeals.dao.CartDao"%>
<%@page import="com.eazydeals.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.eazydeals.entities.Category"%>
<%@page import="com.eazydeals.helper.ConnectionProvider"%>
<%@page import="com.eazydeals.dao.CategoryDao"%>
<%
User user = (User) session.getAttribute("activeUser");
Admin admin = (Admin) session.getAttribute("activeAdmin");

CategoryDao catDao = new CategoryDao(ConnectionProvider.getConnection());
List<Category> categoryList = catDao.getAllCategories();
%>

<nav class="flex gap-20 py-6 align-center justify-center items-center">

    <!-- admin nav bar -->
    <%
    if (admin != null) {
    %>
    <div>
        <a href="admin.jsp"><i></i>&ensp;EazyDeals</a>
        <button type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span>&#8801;</span>
        </button>
        <div>
            <button type="button" data-bs-toggle="modal" data-bs-target="#add-category"><i></i>Add Category</button>
            <button type="button" data-bs-toggle="modal" data-bs-target="#add-product"><i></i>Add Product</button>
            <a href="admin.jsp"><%=admin.getName()%></a>
            <a href="LogoutServlet?user=admin"><i></i>&nbsp;Logout</a>
        </div>
    </div>
    <%
    } else {
    %>

    <!-- end -->

    <!-- for all -->

    <div>
        <ul  class="flex align-baseline justify-center gap-10">
			<li > <a href="index.jsp"  ><img src="./Images/logo.png" class="logo rounded rounded-lg" /></a></li>        
            <li><a href="products.jsp" role="button" aria-expanded="false" class="btn btn-sm"> Produits </a></li>
            <li>
	            <details class="dropdown">
				  <summary class="btn btn-sm">Categories</summary>
				  <ul class="p-2 shadow menu dropdown-content z-[1] bg-base-100 rounded-box w-52">
                       <li><a href="products.jsp?category=0">Tous les produits</a></li>
                        <%
                        for (Category c : categoryList) {
                        %>
                        <li><a href="products.jsp?category=<%=c.getCategoryId()%>"><%=c.getCategoryName()%></a></li>
                        <%
                        }
                        %>
				  </ul>
				</details>
            </li>
        </ul>
    </div>
    <div class="w-full">
        <form class=" w-full flex" role="search" action="products.jsp" method="get">
            <input class="input input-bordered w-full " name="search" type="search"  autocomplete="off" placeholder="Search for products" aria-label="Search">
            <button  class="btn" type="submit">Search</button>
        </form>
    </div>

    <!-- when user is logged in -->
    <%
    if (user != null) {
        CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
        int cartCount = cartDao.getCartCountByUserId(user.getUserId());
    %>
    <div class="flex gap-2 mr-2">
        <a href="cart.jsp" aria-current="page"><i></i> &nbsp;Cart<span><%=cartCount%></span></a>
        <a href="profile.jsp" aria-current="page"><%=user.getUserName()%></a>
        <a href="LogoutServlet?user=user"><i></i>&nbsp;Logout</a>
    </div>
    <%
    } else {
    %>
    <div class="flex  gap-2 mr-2">
        <a  class="btn btn-sm" href="register.jsp"><i></i>&nbsp;Register</a>
        <a class="btn btn-sm" href="login.jsp"><i></i>&nbsp;Login</a>
        <a  class="btn btn-sm"href="adminlogin.jsp">&nbsp;Admin</a>
    </div>
    <%
    }
    }
    %>
    <!-- end  -->
</nav>

