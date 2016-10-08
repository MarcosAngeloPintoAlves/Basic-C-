<%-- 
    Document   : index
    Created on : 05/10/2016, 23:35:26
    Author     : Marcos
--%>
<%@page import="pacote.CCadastro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página inicial</title>
        
        <script lang="javascript" type="text/javascript">
            function valida()
            {
                var nome="";
                var idade=0;
                var peso=0.0;
                
                nome=document.getElementById("iNome").value;
                idade=parseInt(document.getElementById("iIdade").value);
                peso=parseFloat(document.getElementById("iPeso").value);
                
                if(nome.length > 2)
                    {
                        if (idade >= 18)
                        {
                            if ((peso > 30) && (peso < 550))
                            {
                                return(true);
                            } else
                            {
                                alert("Peso inválido.");

                                document.getElementById("iNome").value = "";
                                document.getElementById("iIdade").value = "";
                                document.getElementById("iPeso").value = "";

                                return(false);
                            }
                        } else
                        {
                            alert("Idade inválida.");

                            document.getElementById("iNome").value = "";
                            document.getElementById("iIdade").value = "";
                            document.getElementById("iPeso").value = "";

                            return(false);
                        }
                    } else
                    {
                        alert("Nome inválido.");

                        document.getElementById("iNome").value = "";
                        document.getElementById("iIdade").value = "";
                        document.getElementById("iPeso").value = "";

                        return(false);
                    }
                }
        </script>
    </head>
    <body>
        
        <%
        CCadastro obj = new CCadastro();
   
        if ((request.getParameter("nome") != null) && (request.getParameter("idade").length() > 0)
                    && (request.getParameter("peso").length() > 0)) 
        {
                String nome = request.getParameter("nome");
                int idade = Integer.parseInt(request.getParameter("idade"));
                double peso = Double.parseDouble(request.getParameter("peso"));

                obj.setNome(nome);
                obj.setIdade(idade);
                obj.setPeso(peso);
                obj.gravar();
                out.println("Gravado com sucesso.");
            }
        else 
        {
                obj.setNome("Padrão.");
                obj.setIdade(18);
                obj.setPeso(50);
            }
        %>
        
        <form method="post" action="index.jsp" onsubmit="return valida()">
            <fieldset>
            Nome: <input type="text" name="nome" size="10" id="iNome"/>
            Idade: <input type="text" name="idade" size="5" id="iIdade"/>
            Peso: <input type="text" name="peso" size="5" id="iPeso"/>
            </fieldset>
            <!--Altura: <input type="text" name="" size="5" id="iAltura"/>
            </br>
            CPF: <input type="text" name="cpf" size="20" id="iCPF"/>
            RG: <input type="text" name="rg" size="20" id="iRG"/>            
            </br>-->

            <input type="submit" value="Cadastrar" name="b1"/>
        </form>
        <br>
        <form method="post" action="page2.jsp">
            <input type="submit" value="Mostrar"/>
        </form>
    </body>
</html>
