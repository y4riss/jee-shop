<%@page import="com.suptech.entities.Message"%>
<%@page import="com.suptech.entities.User"%>
<%
User user1 = (User) session.getAttribute("activeUser");
if (user1 == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("login.jsp");
	return;
}
%>

<style>
label {
	font-weight: bold;
}
</style>
<div class="container px-3 py-3">
	<h3>Personal Information</h3>
	<form id="update-user" action="UpdateUserServlet" method="post">
		<input type="hidden" name="operation" value="updateUser">
		<div class="row">
			<div class="col-md-6 mt-2">
				<label class="form-label">Your name</label> <input type="text"
					name="name" class="form-control" placeholder="First and last name"
					value="<%=user1.getUserName()%>">
			</div>
			<div class="col-md-6 mt-2">
				<label class="form-label">Email</label> <input type="email"
					name="email" placeholder="Email address" class="form-control"
					value="<%=user1.getUserEmail()%>">
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 mt-2">
				<label class="form-label">Mobile number</label> <input type="number"
					name="mobile_no" placeholder="Mobile number" class="form-control"
					value="<%=user1.getUserPhone()%>">
			</div>
			<div class="col-md-6 mt-5">
				<label class="form-label pe-3">Gender</label>
				<%
				String gender = user1.getUserGender();
				if (gender.trim().equals("Male")) {
				%>
				<input class="form-check-input" type="radio" name="gender"
					value="Male" checked> <span
					class="form-check-label pe-3 ps-1"> Male </span> <input
					class="form-check-input" type="radio" name="gender" value="Female">
				<span class="form-check-label ps-1"> Female </span>

				<%
				} else {
				%>
				<input class="form-check-input" type="radio" name="gender"
					value="Male"> <span class="form-check-label pe-3 ps-1">
					Male </span> <input class="form-check-input" type="radio" name="gender"
					value="Female" checked> <span class="form-check-label ps-1">
					Female </span>
				<%
				}
				%>

			</div>
		</div>
		<div class="mt-2">
			<label class="form-label">Address</label> <input type="text"
				name="address" placeholder="Enter Address(Area and Street))"
				class="form-control" value="<%=user1.getUserAddress()%>">
		</div>
		<div class="row">
			<div class="col-md-6 mt-2">
				<label class="form-label">Zipcode</label> <input
					class="form-control" type="number" name="pincode"
					placeholder="Pincode" maxlength="6"
					value="<%=user1.getUserPincode()%>">
			</div>
		</div>
		<div class="row mt-2">
			<label class="form-label">City</label>
			<div class="input-group mb-3">
				<p class="form-control"><%=user1.getUserCity()%></p>
					 <select name="city"
					id="state-list" class="form-select">
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
					<option value="Dr�a-Tafilalet">Dr�a-Tafilalet</option>
					<option value="El Hajeb">El Hajeb</option>
					<option value="El Jadida">El Jadida</option>
					<option value="Errachidia">Errachidia</option>
					<option value="Es-Semara">Es-Semara</option>
					<option value="Essaouira">Essaouira</option>
					<option value="Fahs-Anjra">Fahs-Anjra</option>
					<option value="F�s-Mekn�s">F�s-Mekn�s</option>
					<option value="Figuig">Figuig</option>
					<option value="Guelmim">Guelmim</option>
					<option value="Guercif">Guercif</option>
					<option value="Ifrane">Ifrane</option>
					<option value="Inezgane-A�t Melloul">Inezgane-A�t Melloul</option>
					<option value="Jerada">Jerada</option>
					<option value="K�nitra">K�nitra</option>
					<option value="Kh�misset">Kh�misset</option>
					<option value="Kh�nifra">Kh�nifra</option>
					<option value="Khouribga">Khouribga</option>
					<option value="La�youne">La�youne</option>
					<option value="Larache">Larache</option>
					<option value="Marrakech">Marrakech</option>
					<option value="M'diq-Fnideq">M'diq-Fnideq</option>
					<option value="Mediouna">Mediouna</option>
					<option value="Mekn�s">Mekn�s</option>
					<option value="Midelt">Midelt</option>
					<option value="Mohammadia">Mohammadia</option>
					<option value="Nador">Nador</option>
					<option value="Nouaceur">Nouaceur</option>
					<option value="Ouarzazate">Ouarzazate</option>
					<option value="Oued Ed-Dahab">Oued Ed-Dahab</option>
					<option value="Ouezzane">Ouezzane</option>
					<option value="Oujda-Angad">Oujda-Angad</option>
					<option value="Rabat-Sal�-K�nitra">Rabat-Sal�-K�nitra</option>
					<option value="Rehamna">Rehamna</option>
					<option value="Safi">Safi</option>
					<option value="Sal�">Sal�</option>
					<option value="Sefrou">Sefrou</option>
					<option value="Settat">Settat</option>
					<option value="Sidi Ifni">Sidi Ifni</option>
					<option value="Sidi Kacem">Sidi Kacem</option>
					<option value="Sidi Slimane">Sidi Slimane</option>
					<option value="Skhirate-T�mara">Skhirate-T�mara</option>
					<option value="Tan-Tan">Tan-Tan</option>
					<option value="Tanger-T�touan-Al Hoceima">Tanger-T�touan-Al Hoceima</option>
					<option value="Taourirt">Taourirt</option>
					<option value="Taounate">Taounate</option>
					<option value="Taroudant">Taroudant</option>
					<option value="Tata">Tata</option>
					<option value="Taza">Taza</option>
					<option value="T�touan">T�touan</option>
					<option value="Tinghir">Tinghir</option>
					<option value="Tiznit">Tiznit</option>
					<option value="Zagora">Zagora</option>
					
				</select>
			</div>
		</div>
		<div id="submit-btn" class="container text-center mt-3">
			<button type="submit" class="btn btn-outline-primary me-3">Update</button>
			<button type="reset" class="btn btn-outline-primary">Reset</button>
		</div>
	</form>
</div>

















