<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
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
		         
		            <li><a href="${context }/dec">D�connexion</a></li>		            
		          </ul>
                </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>


<div class="container">

    <div class="row" style="margin-top: 80px;">
       
		<div class="col-md-3">
            <div class="list-group">
                <a href="${context}/home" class="list-group-item active"> Tous les Produits </a>
                <c:forEach items="${listec}" var="c">
                	<a href="${context}/produits/cat/${c.id}" class="list-group-item">${c.description}</a>
                </c:forEach>    
            </div>
        </div>


        <div class="col-md-9">
            <div class="panel panel-info">
                <div class="panel-heading">Mon panier </div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
							<tr> <th>#</th>
								<th>D&eacute;signation de vos articles</th>
								<th>Prix UT</th>
								<th>Quantit&eacute;</th>
								<th>Total</th>
								<th></th>
							</tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sessionScope.pan.lignes}" var="pp">
							<tr>
								<th scope="row">1</th>
								<td>
									<img src="${context}/${cx}/images/${pp.prod.id}.jpg" width="10%"> ${pp.prod.description }
								</td>
								<td> ${pp.prod.prix } Dt</td>
								<td>${pp.quantite}</td>
								<td>${pp.prod.prix * pp.quantite} </td>
								<td><a class="btn btn-danger " href="${context}/deletepanier/${pp.prod.id}">Suppimer </a></td>
							</tr>
						</c:forEach>	
							
                        </tbody>						
                    </table>

                </div>
				<div class="panel-footer">
					<a href="${context }/commander" class="btn btn-warning">Poursuivre vos Achats</a>
					<a href="${context }/commander" class="btn btn-primary">Finaliser votre commande</a>
				</div>
            </div>
        </div>
    </div>


</div>




<script src="${context}/${cx}/bootstrap/js/jquery.min.js"></script>	
<script src="${context}/${cx}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>