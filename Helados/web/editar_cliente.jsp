<%-- 
    Document   : editar
    Created on : 30/04/2021, 07:22:52 PM
    Author     : demon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Datos</title>
    </head>
    <body>
        <h1>Tabla de Actualización de Datos</h1>
        <form method="post" name="formularioactualizar"  action="actualizar_cliente.jsp">
            <table border="2" >
                <%
                    Connection con = null;
                    Statement set = null;
                    ResultSet rs = null;

                    String url, userName, password, driver;

                    url = "jdbc:mysql://localhost/registro_cliente";
                    userName = "root";
                    password = "erick3015";
                    driver = "com.mysql.jdbc.Driver";
                    try{
                        Class.forName(driver);
                        con = DriverManager.getConnection(url, userName, password);
                        try{
                            int id = Integer.parseInt(request.getParameter("id"));
                            String q = "select id_usu, nombre_usu, apellido_p_usu, apellido_m_usu, edad_usu, fecha_usu, domicilio_usu, tel_usu from registro_cliente "
                                    + "where id_usu="+id;
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                            %>
                    
                    <tr>
                        <td>ID</td>
                        <td> <input type="hidden" name="id2" value="<%=rs.getInt("id_usu")%>" > </td>
                    </tr>
                    <tr>
                        <td>Nombre:</td>
                        <td> <input type="text" name="nombre2" value="<%=rs.getString("tipo_usu")%>" > </td>
                    </tr>
                    <tr>
                        <td>Apellido Paterno:</td>
                        <td> <input type="text" name="ciudad2" value="<%=rs.getString("gramos_usu")%>" > </td>
                    </tr>
                    <tr>
                        <td>Apellido Materno:</td>
                        <td> <input type="text" name="tel2" value="<%=rs.getString("tamaño_usu")%>" > </td>
                    </tr> 
                    <tr>
                        <td>Edad:</td>
                        <td> <input type="text" name="tel2" value="<%=rs.getString("envase_usu")%>" > </td>
                    </tr> 
                    <tr>
                        <td>Fecha de Nacimineto:</td>
                        <td> <input type="text" name="tel2" value="<%=rs.getString("precio_usu")%>" > </td>
                    </tr> 
                    <tr>
                        <td>Domicilio:</td>
                        <td> <input type="text" name="tel2" value="<%=rs.getString("descuneto_usu")%>" > </td>
                    </tr> 
                            
                            
                            <%
                            
                            }
                            rs.close();
                            set.close();
                        
                        }catch(SQLException ed){
                            System.out.println("Error al consultar los datos");
                            System.out.println(ed.getMessage());
                            %>
                    <tr>
                        <td>ID</td>
                        <td> <input type="hidden" name="id2" value="" > </td>
                    </tr>
                    <tr>
                        <td>Tipo:</td>
                        <td> <input type="text" name="nombre2" value="" > </td>
                    </tr>
                    <tr>
                        <td>Gramos:</td>
                        <td> <input type="text" name="ciudad2" value="" > </td>
                    </tr>
                    <tr>
                        <td>Tamaño:</td>
                        <td> <input type="text" name="tel2" value="" > </td>
                    </tr> 
                    <tr>
                        <td>Envase:</td>
                        <td> <input type="text" name="tel2" value="" > </td>
                    </tr> 
                    <tr>
                        <td>Precio:</td>
                        <td> <input type="text" name="tel2" value="" > </td>
                    </tr> 
                    <tr>
                        <td>Descuento:</td>
                        <td> <input type="text" name="tel2" value="" > </td>
                    </tr>   
                            
                            <%
                        
                        }
                        con.close();
                    
                    }catch(Exception e){
                        System.out.println("Error al conectar con la bd");
                        System.out.println(e.getMessage());
                        System.out.println(e.getStackTrace());
                        %>
                    
                    <h1>Sitio en construcción</h1>
                    
                    <%
                    
                    }
                    
                    %>
                
                
            </table>
                    <input type="submit" value="Actualizar Datos" >
                    <input type="reset" value="Borrar Datos" >
            
        </form>
                    <br>
                    <a href="administrador.html" >Regresar al Menú Principal</a>
                    <br>
                    <a href="registrar_promocion.jsp" >Registrar Nueva Promocion</a>
    </body>
