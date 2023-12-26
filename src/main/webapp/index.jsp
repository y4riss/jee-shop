<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>

<html>
<head>
    <title>Home Page</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        nav {
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>

<header>
    <h1>Welcome to our Online Store</h1>
</header>

<nav>
    <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Products</a></li>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Contact</a></li>
    </ul>
</nav>

<h2>Featured Products</h2>


        <%
        
        ResultSet produits = DatabaseConnection.getResultFromSqlQuery("select * from produit");
		while(produits.next()) {
        %>

                    <h1><%=produits.getString("nom")%></h1>
		<%} %>

</body>
</html>
