<%-- 
    Document   : consultarpromo
    Created on : 2/05/2021, 05:47:14 AM
    Author     : mauri
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Cuentas</title>
    </head>
    <body>
        <h1>Tabla de Cuentas General</h1>
        <br>
        <table border="2" width="100%" >
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Ciudad</th>
                    <th>Telefono</th>
                    <th>Editar</th>
                    <th>Borar</th>
                </tr>
            </thead>
            <tbody>
                
                <% 
                    
            //aqui va codigo java
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String url, userName, password, driver;
            
            url = "jdbc:mysql://localhost:3306/crudexamen";
            userName = "root";
            password = "maika";
            driver = "com.mysql.jdbc.Driver";
                    try{
                        
                        Class.forName(driver);
                        con = DriverManager.getConnection(url, userName, password);
                        
                        try{
                            String q = "select * from cpromo order by id_promo asc";
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                            
                %>
                <tr>
                    <td> <%=rs.getInt("id_promo")%> </td>
                   <td> <%=rs.getInt("id_prod")%> </td>
                    <td> <%=rs.getString("nom_promo")%> </td>
                     <td> <%=rs.getInt("porcent_desc")%> </td>
                      <td> <%=rs.getInt("precio_final")%> </td>
                   <!--<td> <a href="editar.jsp?id=<%//=rs.getInt("id_usu")%>" >Editar</a> </td>
                    <td> <a href="borrar.jsp?id=<%//=rs.getInt("id_usu")%>" >Borrar</a> </td> -->
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
            <h1>Recurso no disponible solo juguito contigo UwU</h1>
                            <%
                        
                        }
                        con.close();
                    
                    }catch(Exception e){
                        System.out.println("Error al conectar con la bd");
                        System.out.println(e.getMessage());
                        System.out.println(e.getStackTrace());
                        %>
        <h1>Sitio en Construcci??n</h1>            
                    <%
                    
                    }
                    
                    %>
                
            </tbody>
        </table>
                    <br>
                    <a href="index.html" >Regresar al Men?? Principal</a>
                    <br>
                    <a href="registrarpromo.html" >Registrar nueva promoci??n</a>     
                    <br>
                    <form method="post" name="formularioeliminarpromo" action="borrarpromocion.jsp">
                        <br>
                     <label>Eliminar por id</label>
                    <input type="text" name="id" size="10" maxlength="6">
                    <br>
                    <input type="submit" value="Borrar id" >
                    </form>
    </body>
</html>