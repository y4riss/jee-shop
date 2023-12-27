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


    
<link rel="stylesheet" type="text/css" href="./CSS/style.css" />
<link href="https://cdn.jsdelivr.net/npm/daisyui@4.4.24/dist/full.min.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>
<navbar class="w-full min-h-screen text-gray-900 bg-gradient-to-br from-transparent to-yellow-100">
  <nav class="flex justify-between items-center py-8 px-6 mx-auto max-w-screen-xl md:px-12 lg:px-16 xl:px-24">
    <button
      class="sidebar-open block md:hidden relative z-30 focus:outline-none transform  -translate-x-1/2 -translate-y-1/2 active:scale-75 transition-transform">
      <svg xmlns="http://www.w3.org/2000/svg" class="btn-open h-5 w-5 transform transition duration-500 ease-in-out"
        viewBox="0 0 20 20" fill="currentColor">
        <path fill-rule="evenodd"
          d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
          clip-rule="evenodd" />
      </svg>
      <svg xmlns="http://www.w3.org/2000/svg"
        class="btn-close hidden h-5 w-5 transform transition duration-500 ease-in-out" viewBox="0 0 20 20"
        fill="currentColor">
        <path fill-rule="evenodd"
          d="M3 7a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 13a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
          clip-rule="evenodd" />
      </svg>
    </button>
    <a href="#" class="text-3xl md:text-4xl font-bold tracking-wide">
    	Sup-<span class="text-yellow-500">Tech</span>
    </a>
    <div
      class="menu-resposive hidden fixed flex inset-0 transition-all bg-white/70 backdrop-blur-xl z-20 md:static md:bg-transparent md:flex items-center justify-center space-y-8 md:space-y-0 flex-col md:flex-row md:space-x-8 -mt-56 md:mt-0 ">
      <ul class="flex flex-col md:flex-row items-center space-y-6 md:space-y-0 md:space-x-6 lg:md:-x-8">
        <li class="text-lg md:text-base lg:text-lg font-medium group text-yellow-500">
          <a href="/ecommerce/index.jsp">Accueil
          </a>
          <div
            class="h-0.5 bg-yellow-500 scale-x-0 group-hover:scale-100 transition-transform origin-left rounded-full duration-300 ease-out">
          </div>
        </li>
        <li class="text-lg md:text-base lg:text-lg font-medium group">
          <a href="/ecommerce/products.jsp">Produits
          </a>
          <div
            class="h-0.5 bg-yellow-500 scale-x-0 group-hover:scale-100 transition-transform origin-left rounded-full duration-300 ease-out">
          </div>
        </li>
          <li class="text-lg md:text-base lg:text-lg font-medium group">
	            <details class="dropdown">
				  <summary class="cursor-pointer">Categories</summary>
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
          <div
            class="h-0.5 bg-yellow-500 scale-x-0 group-hover:scale-100 transition-transform origin-left rounded-full duration-300 ease-out">
          </div>
        </li>
        <!-- when user is logged in -->
		<%
		if (user != null) {
		    CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
		    int cartCount = cartDao.getCartCountByUserId(user.getUserId());
		%>
	  <div class="flex items-center">
	  
	    <div class="dropdown dropdown-end">
	      <div tabindex="0" role="button" class="btn btn-ghost btn-circle">
	        <div class="indicator">
	          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" /></svg>
	          <span class="badge badge-sm indicator-item"><%=cartCount%></span>
	        </div>
	      </div>
	      <div tabindex="0" class="mt-3 z-[1] card card-compact dropdown-content w-52 bg-base-100 shadow">
	        <div class="card-body">
	          <span class="font-bold text-lg"><%=cartCount%> Items</span>
	          <div class="card-actions">
	            <a href="cart.jsp" class="btn btn-primary btn-block">View cart</a>
	          </div>
	        </div>
	      </div>
	    </div>
	    <div class="dropdown dropdown-end">
	      <div tabindex="0" role="button" class="btn btn-ghost btn-circle avatar">
	        <div class="w-10 rounded-full">
	          <img alt="Tailwind CSS Navbar component" src="./Images/profile.png" />
	        </div>
	      </div>
	      <ul tabindex="0" class="menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-100 rounded-box w-52">
	        <li>
	          <a href="profile.jsp" class="justify-between">
	            Profile
	          </a>
	        </li>
	        <li><a href="LogoutServlet?user=user">Logout</a></li>
	      </ul>
	    </div>
	    <p class="font-bold" ><%=user.getUserName()%></p>
	  </div>
	  	<%}else if (admin != null){ %>
	  	
				  <div class="flex items-center">
				          <button type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span>&#8801;</span>
        </button>
				<p class="mr-2" >Welcome, <span class="font-bold" ><%=admin.getName()%></span></p>
				<a href="LogoutServlet?user=admin" class="btn">Logout</a>
				</div>
		<% }else { %>
        <li class="text-lg md:text-base lg:text-lg font-medium group">
       	    <div class="dropdown dropdown-end">
	      <div tabindex="0" role="button" class="">
	        	Se connecter
	      </div>
	      <ul tabindex="0" class="menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-100 rounded-box w-52">
	        <li>
	          <a href="login.jsp" class="justify-between">
	            Client
	          </a>
	        </li>
	        <li><a href="adminlogin.jsp">Admin</a></li>
	      </ul>
	    </div>
          <div
            class="h-0.5 bg-yellow-500 scale-x-0 group-hover:scale-100 transition-transform origin-left rounded-full duration-300 ease-out">
          </div>
        </li>
        <li class="text-lg md:text-base lg:text-lg font-medium group">
          <a href="register.jsp">S'inscrire
          </a>
          <div
            class="h-0.5 bg-yellow-500 scale-x-0 group-hover:scale-100 transition-transform origin-left rounded-full duration-300 ease-out">
          </div>
        </li>
        <%} %>
      </ul>
    </div>
    <button class="search-menu flex justify-center items-center h-12 px-5 font-medium text-gray-100 bg-yellow-500 whitespace-nowrap hover:bg-yellow-600 hover:text-white
    rounded-xl shadow-lg hover:shadow-xl transform hover:scale-105 transition duration-500 focus:outline-none">
      <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
        <path fill-rule="evenodd"
          d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
          clip-rule="evenodd" />
      </svg>
    </button>
  </nav>
  <div class="search-form hidden flex items-center space-x-4 px-6 mx-auto max-w-screen-xl md:px-12 lg:px-16 xl:px-24 
  transform duration-500 transition-all my-4">
    <div class="flex bg-gray-200 p-2 w-full space-x-2 rounded-lg items-center">
      <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 opacity-75 ml-4" fill="none" viewBox="0 0 24 24"
        stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
          d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
      </svg>
      <form action="products.jsp" method="get" class="flex w-full gap-2 ">
      <input
        class="w-full px-4 bg-gray-50 outline-none border-transparent focus:border-transparent focus:ring-0 rounded-lg text-sm sm:text-base"
        type="text"  name="search" type="search"  autocomplete="off" placeholder="Search for products" aria-label="Search"/>
    	<button type="submit"  class="btn">Submit</button>
    	</form>
    </div>
  </div>
</navbar>

<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

  body {
    font-family: 'Poppins', sans-serif;
  }
</style>

<script>
  const btn = document.querySelector("button.sidebar-open")
  const menu = document.querySelector(".menu-resposive")
  const buttonOpen = document.querySelector(".btn-open")
  const buttonClose = document.querySelector(".btn-close")

  btn.addEventListener("click", () => {
    menu.classList.toggle("hidden")
    formSearch.classList.toggle("hidden", true)
    buttonOpen.classList.toggle("hidden"),
      buttonClose.classList.toggle("hidden")
  })

  const buttonMenu = document.querySelector("button.search-menu")
  const formSearch = document.querySelector(".search-form")

  buttonMenu.addEventListener("click", () => {
    formSearch.classList.toggle("hidden")
  })
</script>

