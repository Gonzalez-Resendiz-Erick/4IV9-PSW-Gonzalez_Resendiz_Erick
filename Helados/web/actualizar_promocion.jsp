<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar Registros</title>
        
    </head>
    <body>
        <%
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;

            String url, userName, password, driver;

            url = "jdbc:mysql://localhost/registro_promocion";
            userName = "root";
            password = "erick3015";
            driver = "com.mysql.jdbc.Driver";
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                try{
                    int id = Integer.parseInt(request.getParameter("id2"));
                    
                    String tipo, gramos, tamaño, envase, precio, descuento;
                    
                    tipo = request.getParameter("tipo1");
                    gramos = request.getParameter("gramos1");
                    tamaño = request.getParameter("tamaño1");
                    envase = request.getParameter("envase1");
                    precio = request.getParameter("precio1");
                    descuento = request.getParameter("descuento1");
                    
                    String q = "update registro_promocion set tipo_usu = '"+tipo+"', "
                            + "gramos_usu = '"+gramos+"', tamaño_usu = '"+tamaño+"' "
                            + "envase_usu = '"+envase+"', precio_usu = '"+precio+"' "
                            + "descuento_usu = '"+descuento+"' "
                            + "where id_usu = "+id+"";
                    
                    set = con.createStatement();
                    
                    int actualizar = set.executeUpdate(q);
                    
                    %>
                    
                    <h1>Registro Actualizado con Exito</h1>
                    
                    <%     
                    set.close();    
                
                }catch(SQLException ed){
                    System.out.println("Error al actualizar el dato");
                    System.out.println(ed.getMessage());
                     %>
                    
                    <h1>Registro No es posible Actualizarlo con Exito</h1>
                    
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
        
        <br>
        <a href="administrador.html" >Regresar al Menú Principal</a>
        <br>
        <a href="registrar_promocion.jsp" >Registrar Nuevo Usuario</a>
        
    </body>
</html>
