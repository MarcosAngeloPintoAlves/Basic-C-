<%-- 
    Document   : index
    Created on : 02/10/2016, 21:04:05
    Author     : Marcos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="meupacote.AreaBean"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Area de um triangulo com Bean</title>
    </head>
    <body>
        <jsp:useBean id="area" class="meupacote.AreaBean"/>
        <jsp:setProperty name="area" property="*"/>
           
        <%
            int base=0;
            int altura=0;
        if(request.getParameter("base")!= null && request.getParameter("altura") != null)
        {
        base = Integer.parseInt(request.getParameter("base"));
        altura = Integer.parseInt(request.getParameter("altura")); 
        area.setArea(base, altura);
        }
        else
        area.setArea(0,0);   
        %> 
        
        <strong>
   <h1> Área = <%=area.getArea()%></h1>    
        </strong>
        <form method="post" action="index.jsp">
            Base :<input type="text" size="20" name="base"/>
            Altura :<input type="text" size="20" name="altura"/>
            <br/>
            <input type="submit" name="area" value="Calcular"/>
        </form>
    </body>
</html>
