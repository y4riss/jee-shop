<%@page import="com.eazydeals.dao.ProductDao"%>
<%@page import="com.eazydeals.entities.Product"%>
<%@page import="com.eazydeals.helper.ConnectionProvider"%>
<%@page errorPage="error_exception.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
List<Product> productList = productDao.getAllLatestProducts();
List<Product> topDeals = productDao.getDiscountedProducts();
%>
<!DOCTYPE html>
<html data-theme="light">
<head>
<link rel="stylesheet" type="text/css" href="./CSS/style.css" />
<link href="https://cdn.jsdelivr.net/npm/daisyui@4.4.24/dist/full.min.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>
<meta charset="ISO-8859-1">
<title>Home</title>

</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>


	
	<!-- Category list -->
	<div class="">
		<div class="">
	<div class="p-2 text-center text-black font-bold"  style="background : #e0fdaf;">Categories</div>
			<div class="flex justify-center align-center gap-40 p-4">
				<%
				for (Category c : categoryList) {
				%>
				<div class="">
					<a href="products.jsp?category=<%=c.getCategoryId()%>"
						>
						<div class=" rounded overflow-hidden ">
							<div class="w-[100px] h-[100px] rounded overflow-hidden">
								<img src="./Images/<%=c.getCategoryImage()%>" class="h-full"
									>
							</div>
							<h6 class="font-bold" ><%=c.getCategoryName()%></h6>
						</div>
					</a>
				</div>

				<%
				}
				%>
			</div>
		</div>
			<div class="p-4 text-center text-white" style="background : #e0fdaf;"></div>
		
	</div>
	<!-- end of list -->

	<!-- header-->
<header class=" gap-10 h-fit p-4">
    <div class="left flex flex-col items-center justify-center gap-10 ">
        <img src="./Images/cameras.webp" class="w-[200px] rounded rounded-lg" />
        <img src="./Images/cameras.webp" class="w-[200px] rounded rounded-lg" />
    </div>
    <div class="right  h-[300px] rounded overflow-hidden">
        <img src="./Images/header_img.png" class="w-full h-[300px]" />
    </div>
</header>

	<!-- end of header -->

	<!-- latest product listed -->
	    <div>
        <h1 class="bg-gray-600 p-10 text-white text-center" >Latest Products</h1>
    </div>
<div class="grid grid-cols-3 gap-10 bg-red-200">

    <%
    for (int i = 0; i < Math.min(3, productList.size()); i++) {
    %>
    <div class="relative m-10 flex w-full max-w-xs flex-col overflow-hidden rounded-lg border border-gray-100 bg-white shadow-md">
  <a class="relative mx-3 mt-3 flex h-60 overflow-hidden rounded-xl" href="#">
    <img class="object-cover" src="https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8c25lYWtlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60" alt="product image" />
    <span class="absolute top-0 left-0 m-2 rounded-full bg-black px-2 text-center text-sm font-medium text-white"><%=productList.get(i).getProductDiscount()%>% OFF</span>
  </a>
  <div class="mt-4 px-5 pb-5">
    <a href="#">
      <h5 class="text-xl tracking-tight text-slate-900"><%=productList.get(i).getProductName() %></h5>
    </a>
    <div class="mt-2 mb-5 flex items-center justify-between">
      <p>
        <span class="text-3xl font-bold text-slate-900"> <%= productList.get(i).getProductPriceAfterDiscount()%> </span>
        <span class="text-sm text-slate-900 line-through"><%=productList.get(i).getProductPrice() %></span>
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
    <a href="viewProduct.jsp?pid=<%=productList.get(i).getProductId()%>"  class="flex items-center justify-center rounded-md bg-slate-900 px-5 py-2.5 text-center text-sm font-medium text-white hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-blue-300">
      <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
      </svg>
      Add to cart</a
    >
  </div>
</div>
    

    <%
    }
    %>
</div>

	<!-- end of list -->

	<!-- product with heavy deals -->
<div>
    <h3>Hot Deals</h3>
    <div>
        <%
        for (int i = 0; i < Math.min(4, topDeals.size()); i++) {
        %>
        <div>
            <a href="viewProduct.jsp?pid=<%=topDeals.get(i).getProductId()%>" style="text-decoration: none;">
                <div>
                    <div>
                        <img src="Product_imgs\<%=topDeals.get(i).getProductImages()%>" alt="<%=topDeals.get(i).getProductName()%>">
                    </div>
                    <div>
                        <h5><%=topDeals.get(i).getProductName()%></h5>
                        <div>
                            <span>&#8377;<%=topDeals.get(i).getProductPriceAfterDiscount()%></span>
                            &ensp;<span>&#8377;<%=topDeals.get(i).getProductPrice()%></span>&ensp;
                            <span><%=topDeals.get(i).getProductDiscount()%>&#37; off</span>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <%
        }
        %>
    </div>
</div>

	<!-- end -->

	<!-- confirmation message for successful order -->
	<%
	String order = (String) session.getAttribute("order");
	if (order != null) {
	%>
	<script type="text/javascript">
		console.log("testing..4...");
		Swal.fire({
		  icon : 'success',
		  title: 'Order Placed, Thank you!',
		  text: 'Confirmation will be sent to <%=user.getUserEmail()%>',
		  width: 600,
		  padding: '3em',
		  showConfirmButton : false,
		  timer : 3500,
		  backdrop: `
		    rgba(0,0,123,0.4)
		  `
		});
	</script>
	<%
	}
	session.removeAttribute("order");
	%>
	<!-- end of message -->
	
</body>
</html>