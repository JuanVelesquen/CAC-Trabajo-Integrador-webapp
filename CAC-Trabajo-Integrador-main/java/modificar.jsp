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
   <main > 	             
   <% 
	   String id = request.getParameter("id");
	   Connection cn = null;
	   Statement stm = null;
	   
	   	int suma = 0;
		int cant = 0;
	   
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
   		margin-top:auto;
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
   	main{
   		margin-bottom:1rem;
   	}
   </style>
                
	<section id="section">
	    <div class="title">
        <h2>Gestion de ticket</h2>
     </div>
   
<style>

.btn-modificar-eliminar{
   width: 50%;
   gap:1rem;
   cursor: pointer;
   margin: 0;
   text-decoration: none;
   border: 0;
   background-color: #96C93E;
   color: white;
   padding: 0.5rem;
   border-radius: 5px;
   transition: 300ms ease-in;
}

.btn-modificar-eliminar button:hover{
   background-color: #489543;
}
	.btn-modificar{
   cursor: pointer;
   width:25%;
   margin: 2rem;
   text-decoration: none;
   border: 0;
   background-color: #96C93E;
   color: white;
   padding: 0.5rem;
   border-radius: 5px;
   transition: 300ms ease-in;
}

.btn-modificar:hover{
   background-color: #489543;
}
</style>

   <%
   try{
	   String email= null;
	   boolean flag =  false;
       stm = cn.createStatement();
       ResultSet rs = null;
       rs = stm.executeQuery("SELECT * FROM `base_de_datos` WHERE id = '"+id+"'");
       while(rs.next()){
    	   if(rs.getBoolean(8)){
    		out.println("<table>");
			out.println("<tr>");
			out.println("<th><h3>Nombre</h3></th>");
			out.println("<th><h3>Apellido</h3></th>");
			out.println("<th><h3>Email</h3></th>");
			out.println("<th><h3>Categoria</h3></th>");
			out.println("<th><h3>Cantidad</h3></th>");
			out.println("<th><h3>Total</h3></th>");
			out.println("</tr>)");
			String nombre = rs.getString(2);
			System.out.println(nombre);
			String apellido = rs.getString(3);
			System.out.println(apellido);
			email =  rs.getString(4);
			System.out.println(email);
			String cat =  rs.getString(5);
			System.out.println(cat);
			String cantidad =  rs.getString(6) ;
			System.out.println(cantidad);
			suma = rs.getInt(7);
			out.println("<tr>");
			out.println(" <th  id=nombreTH>"+ nombre + " </th>");
			out.println(" <th id=apellidoTH>"+ apellido + " </th>");
			out.println(" <th id=correoTH>"+ email + " </th>");
			out.println(" <th id=categoriaTH>"+ cat + " </th>");
			out.println(" <th id=cantidadTH>"+ cantidad + " </th>");
			out.println(" <th id=totalTH> $"+ suma + " </th>");
			out.println("</tr>");
			out.println("</table>");
			out.println("<form");
			out.println("<div class=btn-modificar-elimina>");
			out.println("<button  class=btn-modificar type=button id=eliminar >cancelar ticket</button>");
			out.println("<button  class=btn-modificar type=button id=modificar >modificar ticket</button>");
			out.println(" </form>");
			flag = true;
	    	}else if(!rs.getBoolean(8)){
	     	   out.println("<table>");
	    	   out.println("<tr>");
	       		out.println(" <th> TICKET BUSCADO YA HA SIDO CANCELADO </th>");
	       		out.println("</tr>");
	       	 out.println("</table>");
	    		flag = true;
	    	}    	     
       }
       if(!flag){
    	   out.println("<table>");
    	   out.println("<tr>");
       		out.println(" <th> NUMERO DE TICKET NO ENCONTRADO EN LA BASE DE DATOS </th>");
       		out.println("</tr>");
       		out.println("</table>");
       }
   }catch(SQLException e){

       System.out.println("ERROR: NO SE PUDO EJECUTAR LA CONSULTA");

   } 
   %>
   <form action="../java/modificarConfirmacion.jsp" id="form-new">
   		<%out.println("<input type=hidden class=ticketNumber name=id value="+id+"></input>");%>
   </form>
		
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
   <script src="../js/modificarTicket.js"></script>
   
</body>

</html>
    