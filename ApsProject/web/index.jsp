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
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        <title>APS Unicarioca | Desenvolvimento de Aplicações Web | Centro Universitário Carioca</title>
        
        <link rel="shortcut icon" href="project/img/favicon.png" type="image/png">
        
        <!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="vendors/css/materialize.min.css"  media="screen,projection"/>
        
        <link type="text/css" rel="stylesheet" href="project/css/main.css"  media="screen,projection"/>
        
    </head>
    <%-- Definindo Variáveis  --%>
    <%String mensagem = "Diário de Classe"; %>
    <jsp:useBean id="dao" class="br.edu.unicarioca.DAO.MockingAluno"/>
    
    <c:if test="${not empty param.matricula}">
        <jsp:setProperty name="dao" property="itemBusca" value="${param.matricula}"/>
    </c:if>
   
    <body>
        
        <!-- HEADER -->
        <header class="header">
        
            <nav class="top-nav">
                <div class="container">
                  <div class="nav-wrapper center valign-wrapper">
                    <h1 class="title center valign">
                        <a class="center page-title">
                            <%out.println(mensagem);%> | APS Unicarioca - Desenvolvimento de Aplicações Web
                        </a>    
                    </h1>   
                  </div>
                  
                </div>
            </nav>
            
            <ul id="slide-out" class="side-nav fixed">
                
                <div class="logo center">
                    <img class="img-logo" src="project/img/logo-unicarioca.png" alt="unicarioca"/>
                </div>    
                
                <div class="divider"></div>
                <form id="consulta-matricula" action="index.jsp" method="POST" class="col s12">
                    <div class="row">
                        <div class="input-field col s12">
                                   
                            <div class="row">
                                <div class="input-field col s12">
                                    <p>
                                        <i class="material-icons prefix">account_circle</i>
                                        <label for="matricula">Matrícula: </label>
                                        <input id="matricula" name="matricula" value="${param.matricula}"  type="text" placeholder="Ex: 2000000001" class="validate">
                                    </p>                                
                                    
                                </div>
                                                                
                                <div class="input-field col s12">
                                    <button class="btn waves-effect waves-light center" type="submit" name="action">
                                        Buscar Alunos
                                        <i class="material-icons right">search</i>
                                    </button>
                                    
                                </div>
                                   
                                <div class="input-field col s12">
                                    <p>
                                        <input id="listar-todos" type="checkbox" class="filled-in" />
                                        <label for="listar-todos">Listar Todos</label>
                                    </p>
                                    
                                </div>    
                                
                            </div>          
                        </div>
                    </div>
                </form>
                                    
            </ul>
           
        </header>
        <!-- /HEADER -->
            
        <!-- MAIN -->
        <main class="main">
            
            <div class="container">
                
                <section class="list">
                    <c:forEach items="${dao.lista}" var="aluno">
                        <div class="row">
                            <div class="col s12">
                                <div class="card blue-grey darken-3 z-depth-4">
                                    <div class="card-content white-text">
                                        <span class="card-title">Nome: ${aluno.nome}</span>
                                        <p>Matrícula: ${aluno.matricula}</p>
                                        <p class="num-faltas">${aluno.listaPresencas}</p>
                                    </div>
                                    <div class="card-action">
                                        <!-- Modal Trigger -->
                                        <a class="trigger waves-effect waves-light btn" href="#modal1">Gráfico de Faltas <i class="material-icons right">assessment</i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </section>
                
            </div>
            
            <div class="fixed-action-btn">
                
                <a href="#" data-activates="slide-out" class="button-collapse btn-floating btn-large waves-effect waves-light red hide-on-large-only"><i class="material-icons">menu</i></a>
            
            </div>
            
            <!-- Modal Structure -->
            <div id="modal1" class="modal">
                <div class="modal-content">
                    <div class="charts"><img src=""/></div>
                </div>
                <div class="modal-footer">
                  <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Voltar</a>
                </div>
            </div>
            
        </main>
        <!-- /MAIN -->
        
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="vendors/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="vendors/js/materialize.min.js"></script>
        <script type="text/javascript" src="project/js/main.js"></script>
        
    </body>
</html>
