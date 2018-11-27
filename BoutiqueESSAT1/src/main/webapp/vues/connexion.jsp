<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<c:set var="context" value="${pageContext.request.contextPath }"/>

<c:set var="cx" value="files" />
<link href="${context}/${cx}/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
</head>
<body>



<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">          
            <a class="navbar-brand" href="#">E-Boutique ESSAT</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${context}/home">Home</a></li>
                <li><a href='#'>Promotions</a></li>
                <li><a href='#'>Ventes Flash</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">                
                <li><a href="${context}/panier"> Mon Panier 
                <span class="badge"> ${fn:length(sessionScope.pan.lignes) }</span>
                </a>   </li>
                <c:if test="${sessionScope.clt != null }">
                 <li>
                 <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    ${sessionScope.clt.nom } <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="#">Mes Commandes</a></li>
		         
		            <li><a href="${context }/dec">Déconnexion</a></li>		            
		          </ul>
                </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>


<div class="container">
 
    
<div class="container">

    <div class="row" style="margin-top: 80px;">       


        <div class="col-md-6">
            <div class="panel panel-info">
                <div class="panel-body">					
					
			<form class="form-horizontal" method="POST" action="${context}/verif">
				 <h4 align="center">
				   Vous Avez Déjà un Compte E-Boutique ?<br> Connectez-Vous !
				 </h4>
				 <br>
				 <div class="form-group">
					<label class="col-md-4 control-label">Email</label>
					<div class="col-md-8">
					  <input type="email" class="form-control" name="email" placeholder="Email">
					</div>
				  </div>
				  <div class="form-group">
					<label class="col-md-4 control-label">Mot de passe</label>
					<div class="col-md-8">
					  <input type="password" class="form-control" name="password" placeholder="Password">
					</div>
				  </div>				  
				  <div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
					  <button type="submit" class="btn btn-info">Se Connecter</button>
					</div>
				  </div>
			</form>
					
                </div>
            </div>
        </div>

	<div class="col-md-6" style="margin-left:-20px;">
            <div class="panel panel-info">
              <div class="panel-body">
			<form:form class="form-horizontal"  method="POST" action="${context}/ajouterClient" modelAttribute="clt">
				  <h4 align="center">Je Suis Un Nouveau Client </h4>
				  <br /> <h5>Créer un nouveau compte client</h5>
				  <br />				
				  <div class="form-group">
					<label class="col-md-4 control-label">Nom</label>
					<div class="col-md-8">
					  <form:input type="text" path="nom" class="form-control" placeholder="Nom" />
					</div>
				  </div>
				  <div class="form-group">
					<label class="col-md-4 control-label">Prénom</label>
					<div class="col-md-8">
					  <form:input path="prenom" type="text"  class="form-control" placeholder="Prenom" />
					</div>
				  </div>
				  <div class="form-group">
					<label class="col-md-4 control-label">Adresse</label>
					<div class="col-md-8">
					  <form:input path="adresse" type="text" class="form-control" placeholder="Adresse" />
					</div>
				  </div>
				  <div class="form-group">
					<label class="col-md-4 control-label">Email</label>
					<div class="col-md-8">
					  <form:input path="email" type="email"  class="form-control" placeholder="Email" />
					</div>
				  </div>
				  <div class="form-group">
					<label class="col-md-4 control-label">Mot de passe</label>
					<div class="col-md-8">
					  <form:input path="password" type="password" class="form-control" placeholder="Password" />
					</div>
				  </div>
				  <div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
					  <button type="submit" class="btn btn-info">S'inscrire</button>
					</div>
				  </div>
			</form:form>
					
                </div>
            </div>
        </div>
		
		
    </div>


</div>

</div>


<script src="${context}/${cx}/bootstrap/js/jquery.min.js"></script>	
<script src="${context}/${cx}/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>