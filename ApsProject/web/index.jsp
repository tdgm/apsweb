<%-- 
    Document   : index
    Created on : Oct 20, 2016, 3:03:20 PM
    Author     : podgorski
--%>

<%@page import="java.util.List"%>
<%@page import="br.edu.unicarioca.DAO.Aluno"%>
<%@page import="br.edu.unicarioca.DAO.MockingAluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alunos Unicarioca</title>
    </head>
    <%-- Definindo Variáveis  --%>
    <%String mensagem = "Diário de Classe"; %>
    <jsp:useBean id="dao" class="br.edu.unicarioca.DAO.MockingAluno"/>
    
    <c:if test="${not empty param.matricula}">
        <jsp:setProperty name="dao" property="itemBusca" value="${param.matricula}"/>
    </c:if>
   
    <body style="background-color: #333;color: #FFF;font-family: monospace;font-size: 20px;">

        <form action="index.jsp" method="POST">
            
            Matricula: <input type="text" name="matricula" value="${param.matricula}" style="padding: 15px 32px;width: 200px;text-align: center;text-decoration: none;font-size: 16px;">
           
            <input type="submit" value="Buscar Aluno" style=" background-color: #4CAF50; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block;font-size: 16px;"  />
        </form>
        
        <h1><%out.println(mensagem);%></h1>
        <ul style="padding: 10px;">
            <c:forEach items="${dao.lista}" var="aluno">
                <li style="list-style-type: none;padding: 10px;border-bottom: 1px dashed #FFF;margin-bottom: 1px;">
                    <p>${aluno.matricula} - ${aluno.nome}</p>
                    <p>${aluno.listaPresencas}</p>
                </li>
            </c:forEach>
          
        </ul>
    </body>
</html>
