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

<nav class="grid grid-cols-12 bg-white p-4">

    <!-- admin nav bar -->
    <%
    if (admin != null) {
    %>
    <div class="col-span-3">
        <a href="admin.jsp" class="text-xl font-semibold"><i class="fa-sharp fa-solid fa-house"></i>&ensp;EazyDeals</a>
        <button type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span>&#8801;</span>
        </button>
        <div class="flex justify-end items-center space-x-4">
            <button type="button" data-bs-toggle="modal" data-bs-target="#add-category"><i
                    class="fa-solid fa-plus fa-xs"></i>Add Category</button>
            <button type="button" data-bs-toggle="modal" data-bs-target="#add-product"><i
                    class="fa-solid fa-plus fa-xs"></i>Add Product</button>
            <a href="admin.jsp"><%=admin.getName()%></a>
            <a href="LogoutServlet?user=admin"><i class="fa-solid fa-user-slash fa-sm"></i>&nbsp;Logout</a>
        </div>
    </div>
    <%
    } else {
    %>

    <!-- end -->

    <!-- for all -->
    <div class="col-span-3 flex items-center">
        <a href="index.jsp" class="text-xl font-semibold"><i class="fa-sharp fa-solid fa-house"></i>&ensp;SupTech</a>
    </div>
    <div class="col-span-3 flex items-center justify-center">
        <ul class="flex space-x-4">
            <li><a href="products.jsp" role="button" aria-expanded="false"> Produits </a></li>
            <li>
                <details class="dropdown">
                    <summary class="cursor-pointer">Categorie</summary>
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
    <div class="col-span-3">
        <form class="w-full flex" role="search" action="products.jsp" method="get">
            <input class="input input-bordered w-full max-w-xs" name="search" type="search"
                placeholder="Search for products" aria-label="Search">
            <button type="submit" class="btn">Search</button>
        </form>
    </div>

    <!-- when user is logged in -->
    <%
    if (user != null) {
        CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
        int cartCount = cartDao.getCartCountByUserId(user.getUserId());
    %>
    <div class="col-span-3 flex justify-end items-center space-x-4">
        <a href="cart.jsp" aria-current="page"><i class="fa-solid fa-cart-shopping"></i> &nbsp;Cart<span
                class="badge"><%=cartCount%></span></a>
        <a href="profile.jsp" aria-current="page"><%=user.getUserName()%></a>
        <a href="LogoutServlet?user=user"><i class="fa-solid fa-user-slash"></i>&nbsp;Logout</a>
    </div>
    <%
    } else {
    %>
    <div class="col-span-3 flex justify-end items-center space-x-4">
        <a href="register.jsp"><i class="fa-solid fa-user-plus"></i>&nbsp;Register</a>
        <a href="login.jsp"><i class="fa-solid fa-user-lock"></i>&nbsp;Login</a>
        <a href="adminlogin.jsp">&nbsp;Admin</a>
    </div>
    <%
    }
    }
    %>
    <!-- end  -->
</nav>
