<%-- 
    Document   : registrar
    Created on : 30/04/2021, 04:14:21 PM
    Author     : demon
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar Registro</title>
    </head>
    <body>
        
        <% 
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
                    
                     String nom, appat,appmat,dom, tel_part ,tel_fij, q;
                    int  dia, mes, año;

                    nom =  request.getParameter("nombreform") ;
                    appat = request.getParameter("appatform")  ;
                    appmat = request.getParameter("appmatform");   
                    dia=Integer.parseInt(request.getParameter("dianac"));
                    mes=Integer.parseInt(request.getParameter("mesnac"));
                    año=Integer.parseInt(request.getParameter("anonac"));
                    dom=  request.getParameter("domform");  
                    tel_part=request.getParameter("telparform");
                    tel_fij=request.getParameter("telfijform");
                    set = con.createStatement();
                    q = "update registro set nom_usu = '"+nombre+"', ciu_usu = '"+ciudad+"', "
                            + "tel_usu = '"+tel+"' where id_usu = "+id+"";
                    
                    set = con.createStatement();
                    
                    int actuzalizar = set.executeUpdate(q);
                    
                    %>
            <h1>Registro Actualizado con Exito</h1>        
                    <%
                    set.close();
                
                }catch(SQLException ed){
                    System.out.println("Error al actualizar el registro de la tabla");
                    System.out.println(ed.getMessage());
                    %>
            <h1>Registro No Actualizado con Exito, error en el recurso, solo juguito again</h1>        
                    <%
                }
                con.close();
                
            
            }catch(Exception e){
                System.out.println("Error al conectar con la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                %>
        <h1>Sitio en Construcción</h1>            
                    <%
            
            }
            %>
        
        <br>
                    <a href="index.html" >Regresar al Menú Principal</a>
                    <br>
                    <a href="consultar.jsp" >Consulta de Tabla General de Usuarios</a> 
        
    </body>
</html>