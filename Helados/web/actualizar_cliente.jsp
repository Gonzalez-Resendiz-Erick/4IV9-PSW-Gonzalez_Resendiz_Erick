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

            url = "jdbc:mysql://localhost/registro_cliente";
            userName = "root";
            password = "erick3015";
            driver = "com.mysql.jdbc.Driver";
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                try{
                    int id = Integer.parseInt(request.getParameter("id2"));
                    
                    String nombre, apellido_p, apellido_m, edad, fecha, domicilio, tel;
                    
                    nombre = request.getParameter("nombre2");
                    apellido_p = request.getParameter("apellido_p2");
                    apellido_m = request.getParameter("apellido_m2");
                    edad = request.getParameter("edad2");
                    fecha = request.getParameter("fecha2");
                    domicilio = request.getParameter("domicilio2");
                    tel = request.getParameter("tel2");
                    
                    String q = "update registro_cliente set nombre_usu = '"+nombre+"', "
                            + "apellido_p_usu = '"+apellido_p+"', apellido_m_usu = '"+apellido_m+"' "
                            + "edad_usu = '"+edad+"', fecha_usu = '"+fecha+"' "
                            + "domicilio_usu = '"+domicilio+"', tel_usu = '"+tel+"' "
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
                    
                    <h1>Registro No es posible Actualizarlo con Exito, juguito contigo</h1>
                    
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
        <a href="registrar_cliente.jsp" >Registrar Nuevo Cliente</a>
        
    </body>
</html>
