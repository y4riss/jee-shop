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
		<h1 class="border rounded border-black py-2 px-4 bg-gray-100 font-bold w-fit" >Categories</h1>
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
	</div>
	<!-- end of list -->



	<!-- latest product listed -->
<div>
    <div>
        <h1>Latest Products</h1>
    </div>
    <%
    for (int i = 0; i < Math.min(3, productList.size()); i++) {
    %>
    <div>
        <a href="viewProduct.jsp?pid=<%=productList.get(i).getProductId()%>" style="text-decoration: none;">
            <div>
                <div>
                    <img src="Product_imgs\<%=productList.get(i).getProductImages()%>" alt="<%=productList.get(i).getProductName()%>">
                </div>
                <div>
                    <h5><%=productList.get(i).getProductName()%></h5>
                    <div>
                        <span>&#8377;<%=productList.get(i).getProductPriceAfterDiscount()%></span>
                        &ensp;<span>&#8377;<%=productList.get(i).getProductPrice()%></span>&ensp;
                        <span><%=productList.get(i).getProductDiscount()%>&#37; off</span>
                    </div>
                </div>
            </div>
        </a>
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