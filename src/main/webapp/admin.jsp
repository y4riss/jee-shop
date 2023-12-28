<%@page import="com.suptech.entities.Message"%>
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
	<div class="container-fluid py-4 px-3">
		<%@include file="Components/alert_message.jsp"%>
		<div class="row">
			<div class="container text-center" id="details">
				<img src="Images/admin.png" style="max-width: 180px;"
					class="img-fluid">
				<h3>
					Welcome "<%=activeAdmin.getName()%>"
				</h3>
			</div>
		</div>
		<div class="container">
			<div class="row px-3 py-3">
				<div class="col-md-4">
					<a href="display_category.jsp">
						<div class="card text-bg-light mb-3 text-center">
							<div class="card-body">
								<img src="Images/categories.png" style="max-width: 80px;"
									class="img-fluid">
								<h4 class="card-title mt-3">Category</h4>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="display_products.jsp">
						<div class="card text-bg-light mb-3 text-center">
							<div class="card-body">
								<img src="Images/products.png" style="max-width: 80px;"
									class="img-fluid">
								<h4 class="card-title mt-3">Products</h4>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="display_orders.jsp">
						<div class="card text-bg-light mb-3 text-center">
							<div class="card-body">
								<img src="Images/order.png" style="max-width: 80px;"
									class="img-fluid">
								<h4 class="card-title mt-3">Order</h4>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row px-3">
				<div class="col-md-4 offset-md-2">
					<a href="display_users.jsp">
						<div class="card text-bg-light mb-3 text-center">
							<div class="card-body">
								<img src="Images/users.png" style="max-width: 80px;"
									class="img-fluid">
								<h4 class="card-title mt-3">User's</h4>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="display_admin.jsp">
						<div class="card text-bg-light mb-3 text-center">
							<div class="card-body">
								<img src="Images/add-admin.png" style="max-width: 80px;"
									class="img-fluid">
								<h4 class="card-title mt-3">Admin</h4>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!--end-->

	<!-- add category modal-->

	<!-- end of modal -->

	<!-- add product modal-->

	<!-- end of modal -->

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