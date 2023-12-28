<%@page import="com.suptech.entities.Message"%>
<%@page import="com.suptech.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.suptech.dao.CartDao"%>
<%@page errorPage="error_exception.jsp"%>
<%
User activeUser = (User) session.getAttribute("activeUser");
if (activeUser == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("login.jsp");
	return;  
}
String from = (String)session.getAttribute("from");
%>
<!DOCTYPE html>
<html data-theme="light">
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<div class="container mt-5" style="font-size: 17px;">
		<div class="row">

			<!-- left column -->
			<div class="col-md-8">
				<div class="card">
					<div class="container px-3 py-3">
						<div class="card">
							<div class="container-fluid text-white"
								style="background-color: #389aeb;">
								<h4>Delivery Address</h4>
							</div>
						</div>
						<div class="mt-3 mb-3">
							<h5><%=user.getUserName()%>
								&nbsp;
								<%=user.getUserPhone()%></h5>
							<%
							StringBuilder str = new StringBuilder();
							str.append(user.getUserAddress() + ", ");
							str.append(user.getUserCity() + ", ");
							str.append(user.getUserCity() + ", ");
							str.append(user.getUserPincode());
							out.println(str);
							%>
							<br>
							<div class="text-end">
			<button class="btn" onclick="my_modal_2.showModal()">Change address</button>

							</div>
						</div>
						<hr>
						<div class="card">
							<div class="container-fluid text-white"
								style="background-color: #389aeb;">
								<h4>Payment Options</h4>
							</div>
						</div>
						<form action="OrderOperationServlet" method="post">
							<div class="form-check mt-2">
								<input class="form-check-input" type="radio" name="payementMode"
									value="Card Payment" required><label class="form-check-label">Credit
									/Debit /ATM card</label><br>
								<div class="mb-3">

									<input class="form-control mt-3" type="number"
										placeholder="Enter card number" name="cardno">
									<div class="row gx-5">
										<div class="col mt-3">
											<input class="form-control" type="number"
												placeholder="Enter CVV" name="cvv">
										</div>
										<div class="col mt-3">
											<input class="form-control" type="text"
												placeholder="Valid through i.e '07/23'">
										</div>
									</div>
									<input class="form-control mt-3" type="text"
										placeholder="Enter card holder name" name="name">
								</div>
								<input class="form-check-input" type="radio" name="payementMode"
									value="Cash on Delivery"><label
									class="form-check-label">Cash on Delivery</label>
							</div>
							<div class="text-end">
								<button type="submit"
									class="btn btn-lg btn-outline-primary mt-3">Place
									Order</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- end of column -->

			<!-- right column -->
			<div class="col-md-4">
				<div class="card">
					<div class="container px-3 py-3">
						<h4>Price Details</h4>
						<hr>
						<%
						if (from.trim().equals("cart")) {
							CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
							int totalProduct = cartDao.getCartCountByUserId(user.getUserId());
							float totalPrice = (float) session.getAttribute("totalPrice");
						%>
						<table class="table table-borderless">
							<tr>
								<td>Total Item</td>
								<td><%=totalProduct%></td>
							</tr>
							<tr>
								<td>Total Price</td>
								<td> <%=totalPrice%></td>
							</tr>
							<tr>
								<td>Delivery Charges</td>
								<td> 40</td>
							</tr>
							<tr>
								<td>Packaging Charges</td>
								<td> 29</td>
							</tr>
							<tr>
								<td><h5>Amount Payable :</h5></td>
								<td><h5>
										
										<%=totalPrice + 69%></h5></td>
							</tr>
						</table>
						<%
						} else {
							ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
							int pid = (int) session.getAttribute("pid");
							float price = productDao.getProductPriceById(pid);
						%>
						<table class="table table-borderless">
							<tr>
								<td>Total Item</td>
								<td>1</td>
							</tr>
							<tr>
								<td>Total Price</td>
								<td> <%=price%></td>
							</tr>
							<tr>
								<td>Delivery Charges</td>
								<td> 40</td>
							</tr>
							<tr>
								<td>Packaging Charges</td>
								<td> 29</td>
							</tr>
							<tr>
								<td><h5>Amount Payable :</h5></td>
								<td><h5>
										
										<%=price + 69%></h5></td>
							</tr>
						</table>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<!-- end of column -->
		</div>
	</div>


	<!--Change Address Modal -->
	<!-- Open the modal using ID.showModal() method -->
	<dialog id="my_modal_2" class="modal">
	  <div class="modal-box">
	    <h3 class="font-bold text-lg">Change Address!</h3>
				<form action="UpdateUserServlet" method="post">
					<input type="hidden" name="operation" value="changeAddress">
					<div class="modal-body mx-3">
						<div class="mt-2">
							<label class="form-label fw-bold">Address</label>
							<textarea name="user_address" rows="3"
								placeholder="Enter Address(Area and Street))"
								class="form-control" required></textarea>
						</div>
						<div class="mt-2">
							<label class="form-label fw-bold">Zipcode</label> <input
								class="form-control" type="number" name="pincode"
								placeholder="Zipcode" maxlength="6" required>
						</div>
												<div class="mt-2">
							<label class="form-label fw-bold">State</label> <select name="city"
										class="form-select">
										<option selected>--Select City--</option>
										<option value="Agadir-Ida-Ou-Tanane">Agadir-Ida-Ou-Tanane</option>
										<option value="Al Haouz">Al Haouz</option>
										<option value="Al Hoceima">Al Hoceima</option>
										<option value="Aousserd">Aousserd</option>
										<option value="Assa-Zag">Assa-Zag</option>
										<option value="Azilal">Azilal</option>
										<option value="Beni Mellal">Beni Mellal</option>
										<option value="Ben Slimane">Ben Slimane</option>
										<option value="Boujdour">Boujdour</option>
										<option value="Boulemane">Boulemane</option>
										<option value="Casablanca">Casablanca</option>
										<option value="Chefchaouen">Chefchaouen</option>
										<option value="Chichaoua">Chichaoua</option>
										<option value="Dakhla-Oued Ed-Dahab">Dakhla-Oued Ed-Dahab</option>
										<option value="Drâa-Tafilalet">Drâa-Tafilalet</option>
										<option value="El Hajeb">El Hajeb</option>
										<option value="El Jadida">El Jadida</option>
										<option value="Errachidia">Errachidia</option>
										<option value="Es-Semara">Es-Semara</option>
										<option value="Essaouira">Essaouira</option>
										<option value="Fahs-Anjra">Fahs-Anjra</option>
										<option value="Fès-Meknès">Fès-Meknès</option>
										<option value="Figuig">Figuig</option>
										<option value="Guelmim">Guelmim</option>
										<option value="Guercif">Guercif</option>
										<option value="Ifrane">Ifrane</option>
										<option value="Inezgane-Aït Melloul">Inezgane-Aït Melloul</option>
										<option value="Jerada">Jerada</option>
										<option value="Kénitra">Kénitra</option>
										<option value="Khémisset">Khémisset</option>
										<option value="Khénifra">Khénifra</option>
										<option value="Khouribga">Khouribga</option>
										<option value="Laâyoune">Laâyoune</option>
										<option value="Larache">Larache</option>
										<option value="Marrakech">Marrakech</option>
										<option value="M'diq-Fnideq">M'diq-Fnideq</option>
										<option value="Mediouna">Mediouna</option>
										<option value="Meknès">Meknès</option>
										<option value="Midelt">Midelt</option>
										<option value="Mohammadia">Mohammadia</option>
										<option value="Nador">Nador</option>
										<option value="Nouaceur">Nouaceur</option>
										<option value="Ouarzazate">Ouarzazate</option>
										<option value="Oued Ed-Dahab">Oued Ed-Dahab</option>
										<option value="Ouezzane">Ouezzane</option>
										<option value="Oujda-Angad">Oujda-Angad</option>
										<option value="Rabat-Salé-Kénitra">Rabat-Salé-Kénitra</option>
										<option value="Rehamna">Rehamna</option>
										<option value="Safi">Safi</option>
										<option value="Salé">Salé</option>
										<option value="Sefrou">Sefrou</option>
										<option value="Settat">Settat</option>
										<option value="Sidi Ifni">Sidi Ifni</option>
										<option value="Sidi Kacem">Sidi Kacem</option>
										<option value="Sidi Slimane">Sidi Slimane</option>
										<option value="Skhirate-Témara">Skhirate-Témara</option>
										<option value="Tan-Tan">Tan-Tan</option>
										<option value="Tanger-Tétouan-Al Hoceima">Tanger-Tétouan-Al Hoceima</option>
										<option value="Taourirt">Taourirt</option>
										<option value="Taounate">Taounate</option>
										<option value="Taroudant">Taroudant</option>
										<option value="Tata">Tata</option>
										<option value="Taza">Taza</option>
										<option value="Tétouan">Tétouan</option>
										<option value="Tinghir">Tinghir</option>
										<option value="Tiznit">Tiznit</option>
										<option value="Zagora">Zagora</option>

									</select>
						</div>
					</div>
					<div class="modal-footer">

						<button type="submit" class="btn btn-primary">Save</button>
					</div>
				</form>
	  </div>
	  <form method="dialog" class="modal-backdrop">
	    <button>close</button>
	  </form>
	</dialog>

	<!-- end modal -->

</body>
</html>