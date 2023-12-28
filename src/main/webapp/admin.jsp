<%@page import="com.suptech.entities.*"%>
<%@page import="com.suptech.dao.*"%>
<%@page import="com.suptech.helper.*"%>
<%@page import="com.suptech.servlets.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error_exception.jsp"%>
<%
Admin activeAdmin = (Admin) session.getAttribute("activeAdmin");
if (activeAdmin == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("adminlogin.jsp");
	return;
}

OrderDao orderDao = new OrderDao(ConnectionProvider.getConnection());
ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
UserDao userDao = new UserDao(ConnectionProvider.getConnection());
OrderedProductDao ordProdDao = new OrderedProductDao(ConnectionProvider.getConnection());
List<Order> orderList = orderDao.getAllOrder();
List<User> userList = userDao.getAllUser();
List<Product> productList = productDao.getAllProducts();


%>
<!DOCTYPE html>
<html data-theme="light">
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<%@include file="Components/common_css_js.jsp"%>
<style type="text/css">
.cus-active {
	background-color: #e6eefa !important;
	width: 100%;
}

.list-btn {
	font-size: 18px !important;
}

.list-btn:hover {
	color: #2874f0 !important;
}

.no-border {
	border: 0;
	box-shadow: none;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!--admin dashboard -->
	<div class="flex h-screen ">
	    <aside class="bg-gray-800 text-white w-1/6 py-4 px-3">
        <!-- Admin details -->
        <div class="text-center">
            <img src="Images/admin.png" class="w-16 h-16 rounded-full mx-auto mb-2">
            <h3 class="text-lg font-semibold mb-2">
                Welcome, <%=activeAdmin.getName()%>
            </h3>
        </div>
        <!-- Navigation links -->
        <nav class="space-y-2">
            <a href="display_category.jsp" class="block p-3 text-sm rounded hover:bg-gray-700 transition duration-300">Category</a>
            <a href="display_products.jsp" class="block p-3 text-sm rounded hover:bg-gray-700 transition duration-300">Products</a>
            <a href="display_orders.jsp" class="block p-3 text-sm rounded hover:bg-gray-700 transition duration-300">Orders</a>
            <a href="display_users.jsp" class="block p-3 text-sm rounded hover:bg-gray-700 transition duration-300">Users</a>
            <a href="display_admin.jsp" class="block p-3 text-sm rounded hover:bg-gray-700 transition duration-300">Admin</a>
        </nav>
    </aside>
     <!-- Statistics and Metrics -->
    <main class="flex-1 p-4">
        <div class="bg-white p-6 rounded-lg shadow-md">
            <h2 class="text-2xl font-semibold mb-4">Statistics</h2>

            <!-- Metrics Cards -->
            <div class="grid grid-cols-2 gap-4">
                <!-- Total Products -->
                <div class="p-4 bg-blue-200 rounded-lg">
                    <h3 class="text-lg font-semibold">Total Products</h3>
                    <p class="text-3xl font-bold"><%=productList.size() %></p>
                </div>

                <!-- Total Orders -->
                <div class="p-4 bg-green-200 rounded-lg">
                    <h3 class="text-lg font-semibold">Total Orders</h3>
                    <p class="text-3xl font-bold"><%= orderList.size() %></p>
                </div>

                <!-- Total Users -->
                <div class="p-4 bg-yellow-200 rounded-lg">
                    <h3 class="text-lg font-semibold">Total Users</h3>
                    <p class="text-3xl font-bold"><%= userList.size() %></p>
                </div>
            </div>
        </div>
        
        <div class="p-2 bg-gray-900 text-center text-white">Add new product / category</div>
         <div class="flex items-center justify-center p-10 gap-10">
         <button class="btn btn-warning" onclick="prod_modal.showModal()">Add product</button>
        <button class="btn btn-warning " onclick="cat_modal.showModal()">Add category</button>
        </div>
        
        <!-- add category modal-->
<!-- Open the modal using ID.showModal() method -->
<dialog id="cat_modal" class="modal">
  <div class="modal-box">
    <h3 class="font-bold text-lg">Add category</h3>
    				<form action="AddOperationServlet?operation=addCategory" method="post"
					enctype="multipart/form-data">
					<div class="modal-body">
						<div class="mb-3">
							<label class="form-label"><b>Category Name</b></label> <input
								type="text" name="category_name"
								placeholder="Enter category here" class="form-control" required>
						</div>
						<div class="mb-3">
							<label for="formFile" class="form-label"><b>Category
									Image</b></label> <input class="form-control" type="file"
								name="category_img" id="formFile">
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary me-3">Add
							Category</button>
					</div>
				</form>
  </div>
  <form method="dialog" class="modal-backdrop">
    <button>close</button>
  </form>
</dialog>

	<!-- end of modal -->
	
	<!-- add product modal-->
<dialog id="prod_modal" class="modal">
  <div class="modal-box">
    <h3 class="font-bold text-lg">Add product</h3>
    				<form action="AddOperationServlet" method="post"
					name="addProductForm" enctype="multipart/form-data">
					<div class="modal-body">
						<input type="hidden" name="operation" value="addProduct">
						<div>
							<label class="form-label"><b>Product Name</b></label> <input
								type="text" name="name" placeholder="Enter product name"
								class="form-control" required>
						</div>
						<div class="mb-2">
							<label class="form-label"><b>Product Description</b></label>
							<textarea class="form-control" name="description" rows="4"
								placeholder="Enter product description"></textarea>
						</div>
						<div class="row">
							<div class="col-md-6 mb-2">
								<label class="form-label"><b>Unit Price</b></label> <input
									type="number" name="price" placeholder="Enter price"
									class="form-control" required>
							</div>
							<div class="col-md-6 mb-2">
								<label class="form-label"><b>Discount Percentage</b></label> <input
									type="number" name="discount" onblur="validate()"
									placeholder="Enter discount if any!" class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 mb-2">
								<label class="form-label"><b>Product Quantity</b></label> <input
									type="number" name="quantity"
									placeholder="Enter product quantity" class="form-control">
							</div>
							<div class="col-md-6 mb-2">
								<label class="form-label"><b>Select Category Type</b></label> <select
									name="categoryType" class="form-control">
									<option value="0">--Select Category--</option>
									<%
									for (Category c : categoryList) {
									%>
									<option value="<%=c.getCategoryId()%>">
										<%=c.getCategoryName()%></option>
									<%
									}
									%>
								</select>
							</div>
						</div>
						<div class="mb-2">
							<label class="form-label"><b>Product Image</b></label> <input
								type="file" name="photo" class="form-control" required>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary me-3">Add
							Product</button>
					</div>
				</form>
  </div>
  <form method="dialog" class="modal-backdrop">
    <button>close</button>
  </form>
</dialog>

	<!-- end of modal -->
	
	
        
    </main>
	</div>
	<!-- end dashboard -->
	<script type="text/javascript">
		function validate() {
			var dis = document.addProductForm.discount.value;
			if (dis > 100 || dis < 0) {
				alert("Discount need tobe between 0-100 !");
				//document.addProductForm.discount.focus();
				return false;
			}
		}
	</script>
</body>
</html>