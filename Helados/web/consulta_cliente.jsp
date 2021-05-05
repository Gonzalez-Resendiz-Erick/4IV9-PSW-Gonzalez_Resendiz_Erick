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
                    <th>Nombre</th>
                    <th>Apellido Paterno</th>
                    <th>Apellido Materno</th>
                    <th>Edad</th>
                    <th>Fecha</th>
                    <th>Domicilio</th>
                    <th>tel</th>
                    <th>Editar</th>
                    <th>Borrar</th>
                </tr>
            </thead>
            <tbody>
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
                            String q = "select * from registro_cliente order by nom_usu asc";
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                            %>
                <tr>
                    <td> <%=rs.getInt("id_usu")%> </td>
                    <td> <%=rs.getString("nombre_usu")%> </td>
                    <td> <%=rs.getString("apellido_p_usu")%> </td> 
                    <td> <%=rs.getString("apellido_m_usu")%> </td> 
                    <td> <%=rs.getString("edad_usu")%> </td> 
                    <td> <%=rs.getString("fecha_usu")%> </td> 
                    <td> <%=rs.getString("domicilio_usu")%> </td> 
                    <td> <%=rs.getString("tel_usu")%> </td> 
                    <td> <a href="editar.jsp?id=<%=rs.getInt("id_usu")%>" > Editar </a> </td>
                    <td> <a href="borrar.jsp?id=<%=rs.getInt("id_usu")%>" > Borrar </a> </td>

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
            <h1>Error el recurso de la consulta no esta disponible, solo juguito contigo</h1>
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
            <a href="administrador.html" >Regresar al Menú Principal</a>
            <br>
    </body>
</html>