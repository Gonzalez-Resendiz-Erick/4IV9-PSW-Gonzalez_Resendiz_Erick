<%-- 
    Document   : consultar
    Created on : 30/04/2021, 07:03:11 PM
    Author     : demon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Usuarios</title>
    </head>
    <body>
        <h1>Tabla General de Cuentas de Usuario</h1>
        <table border="2" >
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tipo</th>
                    <th>Gramos</th>
                    <th>Tamaño</th>
                    <th>Envase</th>
                    <th>Precio</th>
                    <th>Descuento</th>
                </tr>
            </thead>
            <tbody>
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
                            String q = "select * from registro_promocion order by tipo_usu asc";
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                            %>
                <tr>
                    <td> <%=rs.getInt("id_usu")%> </td>
                    <td> <%=rs.getString("tipo_usu")%> </td>
                    <td> <%=rs.getString("gramos_usu")%> </td> 
                    <td> <%=rs.getString("tamaño_usu")%> </td> 
                    <td> <%=rs.getString("envase_usu")%> </td>
                    <td> <%=rs.getString("precio_usu")%> </td>
                    <td> <%=rs.getString("descuento_usu")%> </td>

                </tr>            
                            
                            
                            <%
                                
                                
                            }
                            rs.close();
                            set.close();
                        
                        }catch(SQLException ed){
                            System.out.println("Error al consultar la tabla");
                            System.out.println(ed.getMessage());
                            %>
            </tbody>
            <h1>Error el recurso de la consulta no esta disponible</h1>
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
                
                
            </tbody>
            
            
        </table>
            <br>
            <a href="cliente.html" >Regresar al Menú Principal</a>
    </body>
</html>