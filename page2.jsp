<%-- 
    Document   : page2
    Created on : 06/10/2016, 10:20:45
    Author     : aluno
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pacote.CCadastro"%>
<%@page import="pacote.CBanco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de exibição</title>
    </head>
    <body>
        <%
            CCadastro obj = new CCadastro(); 
            ResultSet tabela = obj.consulta();
            
            DecimalFormat formatar;
            formatar = new DecimalFormat("00.00");
            
            if(tabela!=null)
            {
                while(tabela.next())
                {
                    out.println("<h1>Código: " + tabela.getInt(1) + " Nome: " + tabela.getString(2) + 
                            " Idade: " + tabela.getString(3) + " Peso: " + formatar.format(tabela.getDouble(4))+ "</h1>");
                }
            }
        %>
        
        <form action="page2.jsp"/>
        <fieldset>
            Código: <input type="text" name="codigo"/>
            Nome: <input type="text" name="nome" size="10" id="iNome"/>
            Idade: <input type="text" name="idade" size="5" id="iIdade"/>
            Peso: <input type="text" name="peso" size="5" id="iPeso"/>
        </fieldset>   
        <br>
        <input type="submit" name="b1" value="Alterar"/>
        <input type="submit" name="b1" value="Remover"/>
        <%
            obj = new CCadastro();
            

            if ((request.getParameter("b1")!= null)&&(request.getParameter("codigo").length()>0)&&(request.getParameter("nome") != null) && (request.getParameter("idade").length() > 0)
                    && (request.getParameter("peso").length() > 0)) 
            {
                String bt = request.getParameter("b1");
                
                if (bt.equals("Alterar"))
                {
                    int codigo = Integer.parseInt(request.getParameter("codigo"));
                    String nome = request.getParameter("nome");
                    int idade = Integer.parseInt(request.getParameter("idade"));
                    double peso = Double.parseDouble(request.getParameter("peso"));
                    obj.codigo = codigo;

                    obj.idade = idade;
                    obj.nome = nome;
                    obj.peso = peso;
                    obj.alterar();
                    response.sendRedirect("page2.jsp");
                } 
                else
                if (bt.equals("Remover"))
                {
                    int codigo = Integer.parseInt(request.getParameter("codigo"));
                    obj.codigo = codigo;
                    obj.remover();
                    response.sendRedirect("page2.jsp");
                }
            }
        %>
    </form>
        
    </body>
</html>
