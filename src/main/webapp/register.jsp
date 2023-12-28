<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html data-theme="light">
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<%@include file="Components/common_css_js.jsp"%>
<style>
label {
	font-weight: bold;
}
</style>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<div class="container-fluid mt-4">
		<div class="row g-0">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body px-5">

						<div class="container text-center">
							<img src="Images/signUp.png" style="max-width: 80px;"
								class="img-fluid">
						</div>
						<h3 class="text-center">Create Account</h3>
						<%@include file="Components/alert_message.jsp"%>

						<!--registration-form-->
						<form id="register-form" action="RegisterServlet" method="post">
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">Your name</label> <input type="text"
										name="user_name" class="form-control"
										placeholder="First and last name" required>
								</div>
								<div class="col-md-6 mt-2">
									<label class="form-label">Email</label> <input type="email"
										name="user_email" placeholder="Email address"
										class="form-control" required>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">Mobile number</label> <input
										type="number" name="user_mobile_no"
										placeholder="Mobile number" class="form-control">
								</div>
								<div class="col-md-6 mt-5">
									<label class="form-label pe-3">Gender</label> <input
										class="form-check-input" type="radio" name="gender"
										value="Male"> <span class="form-check-label pe-3 ps-1">
										Male </span> <input class="form-check-input" type="radio"
										name="gender" value="Female"> <span
										class="form-check-label ps-1"> Female </span>
								</div>
							</div>
							<div class="mt-2">
								<label class="form-label">Address</label> <input type="text"
									name="user_address"
									placeholder="Enter Address(Area and Street))"
									class="form-control" required>
							</div>  
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">Zipcode</label> <input
										class="form-control" type="number" name="pincode"
										placeholder="Zipcode" maxlength="6" required>
								</div>  
							</div>
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">City</label> <select name="city"
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
								<div class="col-md-6 mt-2">
									<label class="form-label">Password</label> <input
										type="password" name="user_password"
										placeholder="Enter Password" class="form-control" required>
								</div>
							</div>

							<div id="submit-btn" class="container text-center mt-4">
								<button type="submit" class="btn btn-outline-primary me-3">Submit</button>
								<button type="reset" class="btn btn-outline-primary">Reset</button>
							</div>
							<div class="mt-3 text-center">
								<h6>
									Already have an account?<a href="login.jsp"
										style="text-decoration: none"> Sign in</a>
								</h6>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
		<!--footer -->
	<%@include file="Components/footer.jsp"%>
</body>
</html>