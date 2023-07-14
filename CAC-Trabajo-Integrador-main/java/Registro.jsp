<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>TP Integrador CAC</title>
   <link rel="stylesheet" href="../css/style.css">
   <link rel="stylesheet" href="../css/comprarTicket.css">
</head>

<body>
   <header class="nav-container">
      <div class="logo"> 
         <a href="../index.html"><img class="logo__image" src="../assets/img/codoacodo.png" alt=""></a>
         <a href="../index.html"><h2 class="logo__title">Conf Bs As</h2></a>
      </div> 
      <nav>
         <button class="mobile-nav-toggle" aria-controls="primary-navigation" aria-expanded="false"></button>
         <ul class="nav__list-links primary-navigation"  id="primary-navigation" data-visible="false">
            <li><a class="nav__link" href="#">La conferencia</a></li>
            <li><a class="nav__link" href="#orador">Los oradores</a></li>
            <li><a class="nav__link" href="#lugar-fecha">El lugar y la fecha</a></li>
            <li><a class="nav__link nav__link-active" href="#conviertete-orador">Conviértete en orador</a></li>
            <li><a class="nav__link" href="../page/comprarTicket.html"><span>Comprar ticket</span></a></li>
         </ol>
      </nav>
      <script src="../js/nav.js" defer></script>
   </header>
   <main> 	             
   <% 
  		int id = 0;
	   String nombre = request.getParameter("nombre");
	   String apellido = request.getParameter("apellido");
	   String email = request.getParameter("correo");
	   String cat = request.getParameter("categoria");
	   String cantidad = request.getParameter("cantidad") ;
	   boolean estado = true;
	   Connection cn = null;
	   Statement stm = null;
	   
	   	float suma = 0;
		int cant = 0;
		if(cantidad != null){
			cant = Integer.parseInt(cantidad);
		}
		if(cat != null){
	        if(cat.equals("estudiante")){
	            suma = cant * 200 * 0.2f;
	        }else if(cat.equals("trainee")){
	            suma = cant * 200 *  0.5f;
	        }else if(cat.equals("junior")){
	            suma = cant * 200 * 0.85f;
	        }
		}
	   
       try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           System.out.println("SE ESTABLECIO LA CARGA DEL CONTROLADOR EXITOSAMENTE");
       }catch (ClassNotFoundException e){
           System.out.println("ERROR: NO SE PUDO ESTABLECER LA CARGA DEL CONTROLADOR");
           e.printStackTrace();
       }
       try{
    	   cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto_final","root","");
           System.out.println("SE ESTABLECIO LA CONEXION EXITOSAMENTE");
       }catch (SQLException e) {
           System.out.println("ERROR: NO SE PUDO CONECTAR AL SERVIDOR");
           e.printStackTrace();
       }
	   try {
			   if(nombre != null){
				   stm = cn.createStatement();
				   stm.executeUpdate("INSERT INTO `base_de_datos`(`nombre`, `apellido`, `email`, `categoria`, `cantidad`, `total`) VALUES ('"+nombre+"','"+apellido+"','"+email+"','"+cat+"','"+cantidad+"',"+suma+")");
			   }
		   } catch (SQLException e) {
		   System.out.println("ERROR: NO SE PUDO EJECUTAR LA CONSULTA");
	   }
   %>
   <style>
      	table{
   		border-collapse: collapse;
   		margin:10px;
   		width: 80%;
   		margin: auto;
   		max-widt: 663px;
   	}
   	td,th{
   		border:1px solid #dddddd;
   		text-align:center;
   		padding: 8px;
   		   color: rgba(46, 45, 45, 0.555);
   font-family: sans-serif;
   	}
   	li{
   	   color: rgba(46, 45, 45, 0.555);
   		font-family: sans-serif;
   	}
   	footer{
   		margin-top:100px;
   	}
   	.compra-realizada{
   		display:flex;
   		flex-direction:column;
   		align-items: center;
   		
   	}
  	.compra-realizada li{
   		padding:5px;
   		
   		
   	}
   	.title{
   		padding: 1rem;
   	}
   </style>
   
                <div class="title">
                    <h2>Compra Realizada</h2>
                </div>
       <%try{
       stm = cn.createStatement();
       ResultSet rs = null;
       rs = stm.executeQuery("SELECT MAX(id) FROM `base_de_datos`");
       if(rs.next()){
    	   id = rs.getInt(1);   
       }
       System.out.println(id);
       }catch(SQLException e){
       System.out.println("ERROR: NO SE PUDO EJECUTAR LA CONSULTA");

   }
       %>
    <table class="compra-realizada">
    <tr><th><h3>N° de Ticket</h3></th> <th><%out.println(id);%></th></tr>
   	<tr><th><h3>Nombre</h3></th> <th><%= request.getParameter("nombre") %></th></tr>
   	<tr><th><h3>Apellido</h3></th> <th><%= request.getParameter("apellido") %></th></tr>
   	<tr><th><h3>Email</h3></th> <th><%= request.getParameter("correo") %></th></tr>
   	<tr><th><h3>Categoria</h3></th> <th><%= request.getParameter("categoria") %></th></tr>
   	<tr><th><h3>Cantidad</h3></th> <th><% out.println(cantidad);%></th></tr>
   	<tr><th><h3>Total</h3></th> <th> <% out.println("$" + suma);%></th></tr>
   	</table>
	<section>
    <div class="title">
   <h2>Registro de usuarios</h2>
   </div>
   

   <table>
   <tr>
   	<th><h3>Nombre</h3></th>
   	<th><h3>Apellido</h3></th>
   	<th><h3>Email</h3></th>
   	<th><h3>Categoria</h3></th>
   	<th><h3>Cantidad</h3></th>
   	<th><h3>Total</h3></th>
   </tr>
   <%
   try{
       stm = cn.createStatement();
       ResultSet rs = null;
       rs = stm.executeQuery("SELECT * FROM base_de_datos");
       while(rs.next()){
    	if(rs.getBoolean(8)){
			nombre = rs.getString(2);
			System.out.println(nombre);
			apellido = rs.getString(3);
			System.out.println(apellido);
			email =  rs.getString(4);
			System.out.println(email);
			cat =  rs.getString(5);
			System.out.println(cat);
			cantidad =  rs.getString(6) ;
			System.out.println(cantidad);
			suma = rs.getInt(7);
			out.println("<tr>");
			out.println(" <th>"+ nombre + " </th>");
			out.println(" <th>"+ apellido + " </th>");
			out.println(" <th>"+ email + " </th>");
			out.println(" <th>"+ cat + " </th>");
			out.println(" <th>"+ cantidad + " </th>");
			out.println(" <th> $"+ suma + " </th>");
			out.println("</tr>");

    	}
       }
   }catch(SQLException e){
       System.out.println("ERROR: NO SE PUDO EJECUTAR LA CONSULTA");

   }
   %>
   </table>
		
   </section>
  </main>
   <footer>
      <nav>
         <ul class="footer__links">
            <li class="footer__link"><a href="">Preguntas Frecuentes</a></li>
            <li class="footer__link"><a href="">Contáctanos</a></li>
            <li class="footer__link"><a href="">Prensa</a></li>
            <li class="footer__link"><a href="">Conferencias</a></li>
         </ul>
         <ul class="footer__other-links">
            <li class="footer__link "><a href="">Términos y Condiciones</a></li>
            <li class="footer__link"><a href="">Privacidad</a></li>
            <li class="footer__link"><a href="">Estudiantes</a></li>
         </ul>
      </nav>
   </footer>
   <script src="../js/comprarTicket.js"></script>
</body>

</html>
    