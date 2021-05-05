<%-- 
    Document   : registrar
    Created on : 30/04/2021, 06:49:43 PM
    Author     : demon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuarios</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String url, userName, password, driver;
            
            url = "jdbc:mysql://localhost/registro_producto";
            userName = "root";
            password = "erick3015";
            driver = "com.mysql.jdbc.Driver";
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                
                try{
                    String tipo, gramos, tamaño, envase, precio;
                    
                    tipo = request.getParameter("tipo");
                    gramos = request.getParameter("gramos");
                    tamaño = request.getParameter("tamaño");
                    envase = request.getParameter("envase");
                    precio = request.getParameter("precio");
                    
                    set = con.createStatement();
                    
                    String q = "insert into registro_producto(tipo_usu, gramos_usu, tamaño_usu, envase_usu, precio_usu) "
                            + "values('"+tipo+"', '"+gramos+"', '"+tamaño+"', '"+envase+"', '"+precio+"')";
                    
                    int registro = set.executeUpdate(q);
                    
                    %>
                    
                    <h1>Registro Exitoso nwn</h1>
                    
                    <%
                        set.close();
                        
                
                }catch(SQLException ed){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(ed.getMessage());
                    %>
                    
                    <h1>Registro No Exitoso, error al leer la tabla nwn</h1>
                    
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
        
        
    </body>
</html>

