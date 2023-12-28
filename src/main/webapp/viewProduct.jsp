<%@page import="com.suptech.dao.WishlistDao"%>
<%@page import="com.suptech.dao.ProductDao"%>
<%@page import="com.suptech.entities.Product"%>
<%@page errorPage="error_exception.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
int productId = Integer.parseInt(request.getParameter("pid"));
ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
Product product = (Product) productDao.getProductsByProductId(productId);
%>
<!DOCTYPE html>
<html data-theme="light">
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./CSS/style.css" />
<link href="https://cdn.jsdelivr.net/npm/daisyui@4.4.24/dist/full.min.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>
<title>View Product</title>
<%@include file="Components/common_css_js.jsp"%>
<style type="text/css">
.real-price {
	font-size: 26px !important;
	font-weight: 600;
}

.product-price {
	font-size: 18px !important;
	text-decoration: line-through;
}

.product-discount {
	font-size: 16px !important;
	color: #027a3e;
}
</style>
</head>
<body>

	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>
<section class=" bg-white py-11 font-poppins ">
        <div class="max-w-6xl px-4 py-4 mx-auto lg:py-8 md:px-6">
            <div class="flex flex-wrap -mx-4">
                <div class="w-full mb-8 md:w-1/2 md:mb-0">
                    <div class="sticky top-0 z-50 overflow-hidden ">
                        <div class="relative mb-6 lg:mb-10 lg:h-2/4 flex items-center justify-center ">
                            <img src="./Product_imgs/<%=product.getProductImages()%>" alt=""
                                class="object-cover w-full lg:h-full max-w-[300px] max-h-[300px] ">
                        </div>
                        <div class="flex-wrap hidden md:flex items-center justify-center">
                            <div class="w-1/2 p-2 sm:w-1/4 flex items-center justify-center">
                                <a href="#" class="block border border-blue-300 hover:border-blue-300">
                                    <img src="./Product_imgs/<%=product.getProductImages()%>" alt=""
                                        class="object-cover w-full lg:h-20 max-w-[60px]">
                                </a>
                            </div>
                            <div class="w-1/2 p-2 sm:w-1/4 flex items-center justify-center">
                                <a href="#" class="block border border-transparent hover:border-blue-300">
                                    <img src="./Product_imgs/<%=product.getProductImages()%>" alt=""
                                        class="object-cover w-full lg:h-20 max-w-[60px]">
                                </a>
                            </div>
                            <div class="w-1/2 p-2 sm:w-1/4 flex items-center justify-center">
                                <a href="#" class="block border border-transparent hover:border-blue-300">
                                    <img src="./Product_imgs/<%=product.getProductImages()%>" alt=""
                                        class="object-cover w-full lg:h-20 max-w-[60px]">
                                </a>
                            </div>
                            <div class="w-1/2 p-2 sm:w-1/4 flex items-center justify-center">
                                <a href="#" class="block border border-transparent hover:border-blue-300">
                                    <img src="./Product_imgs/<%=product.getProductImages()%>" alt=""
                                        class="object-cover w-full lg:h-20 max-w-[60px]">
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="w-full px-4 md:w-1/2 ">
                    <div class="lg:pl-20 ">
                        <div class="mb-8 ">
                            <h2 class="max-w-xl mb-6 text-2xl font-bold  md:text-4xl">
                                <%=product.getProductName()%></h2>
                            <p class="inline-block mb-6 text-4xl font-bold text-gray-700 ">
                                <span>$1500.99</span>
                                <span
                                    class="text-base font-normal text-gray-500 line-through ">$1800.99</span>
                            </p>
                            <p class="max-w-md text-gray-700 dark:text-gray-400">
                        <%=product.getProductDescription()%>
                            </p>
	<span class="fs-5 "><b>Category : </b></span> <span><%=catDao.getCategoryName(product.getCategoryId())%></span><br/>
	<span class="fs-5"><b>Status : </b></span> <span id="availability">
						<%
						if (product.getProductQuantity() > 0) {
							out.println("Available");
						} else {
							out.println("Currently Out of stock");
						}
						%>
                            
                        </div>

                        <div >
                           <form method="post" class="flex flex-wrap items-center gap-4 ">
						<div class="container-fluid text-center mt-3 flex">
							<%
							if (user == null) {
							%>
							<button type="button" onclick="window.open('login.jsp', '_self')"
								class="btn btn-lg btn-primary"
							>Add to Cart</button>
							&emsp;
							<button type="button" onclick="window.open('login.jsp', '_self')"
								class="btn btn-lg btn-primary"
								
								>Buy Now</button>
							<%
							} else {
							%>
							<button type="submit"
								formaction="./AddToCartServlet?uid=<%=user.getUserId()%>&pid=<%=product.getProductId()%>"
								class="btn btn-lg btn-primary"
								>Add to Cart</button>
							&emsp; <a
								href="checkout.jsp" id="buy-btn"
								
								class="btn btn-lg btn-primary"
								 role="button"
								aria-disabled="true">Buy Now</a> 
							<%
							}
							%>
						</div>
					</form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<script>
		$(document).ready(function() {
			if ($('#availability').text().trim() == "Currently Out of stock") {
				$('#availability').css('color', 'red');
				$('.btn').addClass('disabled');
			}
			$('#buy-btn').click(function(){
				<%
				session.setAttribute("pid", productId);
				session.setAttribute("from", "buy");
				%>	
				});
		});
	</script>
</body>
</html>