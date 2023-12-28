<%@ page import="com.suptech.dao.WishlistDao" %>
<%@ page import="com.suptech.entities.User" %>
<%@ page import="com.suptech.dao.CategoryDao" %>
<%@ page import="com.suptech.entities.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.suptech.helper.ConnectionProvider" %>
<%@ page import="com.suptech.dao.ProductDao" %>
<%
    User u = (User) session.getAttribute("activeUser");
    WishlistDao wishlistDao = new WishlistDao(ConnectionProvider.getConnection());

    String searchKey = request.getParameter("search");
    String catId = request.getParameter("category");
    CategoryDao categoryDao = new CategoryDao(ConnectionProvider.getConnection());
    String message = "";

    ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
    List<Product> prodList = null;
    if (searchKey != null) {
        if (!searchKey.isEmpty()) {
            message = "Showing results for \"" + searchKey + "\"";
        } else {
            message = "No product found!";
        }
        prodList = productDao.getAllProductsBySearchKey(searchKey);

    } else if (catId != null && !(catId.trim().equals("0"))) {
        prodList = productDao.getAllProductsByCategoryId(Integer.parseInt(catId.trim()));
        message = "Showing results for \"" + categoryDao.getCategoryName(Integer.parseInt(catId.trim())) + "\"";
    } else {
        prodList = productDao.getAllProducts();
        message = "All Products";
    }

    if (prodList != null && prodList.size() == 0) {
        message = "No items are available for \""
                + (searchKey != null ? searchKey : categoryDao.getCategoryName(Integer.parseInt(catId.trim()))) + "\"";
        prodList = productDao.getAllProducts();
    }
%>
<!DOCTYPE html>

<html data-theme="light">

<head>
    <meta charset="ISO-8859-1">
    <title>Products</title>
    <%@ include file="Components/common_css_js.jsp"%>
    <!-- Add Tailwind CSS link here or include it in your project -->
    <link rel="stylesheet" href="path/to/tailwind.css">
    <style>
        /* Add your custom styles here */
    </style>
</head>

<body >
    <!--navbar -->
    <%@ include file="Components/navbar.jsp"%>

    <!--show products-->
    <h4 class="p-4 text-center font-bold bg-gray-900 text-white my-4"><%=message %></h4>
    <div class="container mx-auto my-3 px-5">

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-3 gap-5 items-center justify-center p-2">
            <%
            for (Product p : prodList) {
            %>
    <div class="relative m-10 flex w-full max-w-xs flex-col overflow-hidden rounded-lg border border-gray-100 bg-white shadow-md">
  <a class="relative mx-3 mt-3 flex h-60 overflow-hidden rounded-xl" href="#">
    <img class="object-cover" src="./Product_imgs/<%=p.getProductImages()%>" alt="product image" />
    <span class="absolute top-0 left-0 m-2 rounded-full bg-black px-2 text-center text-sm font-medium text-white"><%=p.getProductDiscount()%>% OFF</span>
  </a>
  <div class="mt-4 px-5 pb-5">
    <a href="#">
      <h5 class="text-xl tracking-tight text-slate-900"><%=p.getProductName() %></h5>
    </a>
    <div class="mt-2 mb-5 flex items-center justify-between">
      <p>
        <span class="text-3xl font-bold text-slate-900"> <%= p.getProductPriceAfterDiscount()%> </span>
        <span class="text-sm text-slate-900 line-through"><%=p.getProductPrice() %></span>
      </p>
      <div class="flex items-center">
        <svg aria-hidden="true" class="h-5 w-5 text-yellow-300" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
        </svg>
        <svg aria-hidden="true" class="h-5 w-5 text-yellow-300" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
        </svg>
        <svg aria-hidden="true" class="h-5 w-5 text-yellow-300" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
        </svg>
        <svg aria-hidden="true" class="h-5 w-5 text-yellow-300" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
        </svg>
        <svg aria-hidden="true" class="h-5 w-5 text-yellow-300" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
        </svg>
        <span class="mr-2 ml-3 rounded bg-yellow-200 px-2.5 py-0.5 text-xs font-semibold">5.0</span>
      </div>
    </div>
    <a href="viewProduct.jsp?pid=<%=p.getProductId()%>"  class="flex items-center justify-center rounded-md bg-slate-900 px-5 py-2.5 text-center text-sm font-medium text-white hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-blue-300">
      <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
      </svg>
      View details</a
    >
  </div>
</div>
            <%
            }
            %>
        </div>
    </div>
</body>

</html>
