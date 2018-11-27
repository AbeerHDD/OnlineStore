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
<!-- Latest compiled and minified JavaScript -->

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
		            <li><a href="${context }/mescommandes">Mes Commandes</a></li>
		         
		            <li><a href="${context }/dec">Déconnexion</a></li>		            
		          </ul>
                </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>


<div class="container">
 
    <div class="row" style="margin-top: 80px;">
	
       <div class="col-md-12">
 <div class="panel panel-primary">
 <div class="panel-heading">
 Liste de mes Commandes
 </div>
 <div class="panel-body">
 <table class="table table-hove">
 <thead>
 <tr><th>ID</th><th>Date</th><th>Client</th><th>Options</th>
 </tr>
 </thead>
 <tbody>
 <c:forEach items="${listecde}" var="c">
 <tr>
 <td> ${c.id}  </td>
 <td> ${c.datCde}  </td>
 <td> ${c.clt.id}  </td>
 <td> <a href="${context}/detailCde/${c.id }">Détail Commande</a></td>
 
 
 
 </c:forEach>
 
 </tbody>
 
 </table>
 </div>
 
 
        </div>

    </div>

</div>



<script src="${context}/${cx}/bootstrap/js/jquery.min.js"></script>	
<script src="${context}/${cx}/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>