<%@page import="br.com.caelum.produtos.modelo.Produto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function removeProduto(id){
			$("#mensagem").load('<c:url value="/produto/remove"/>' + '?produto.id=' + id);
			$("#produto" + id).remove();
		}
	</script>

	<h1>Produtos</h1>
	
	<h2><fmt:message key="mensagem.bemvindo" /></h2>
	
	<div id="mensagem"></div>
	
	<table width="100%">
        <tr>
            <td width="20%">Nome</td>
            <td>Preco</td>
            <td>Descricao</td>
            <td>Data de Inicio da Venda</td>
            <td>Usado?</td>
        </tr>

		<c:forEach var="p" items="${produtoList}">
			<tr id="produto${p.id}">
			
				<td>${p.nome}</td>
				
				<td>
					<fmt:formatNumber value="${p.preco}" type="currency"/>
				</td>
				
				<td>${p.descricao}</td>
				
				<td>
					<fmt:formatDate pattern="dd/MM/yyyy" value="${p.dataInicioVenda.time}" />
				</td>

				<c:if test="${p.usado}">
					<td>Sim</td>
				</c:if>
				<c:if test="${not p.usado}">
					<td>Não</td>
				</c:if>

			</tr>
		</c:forEach>
		
	</table>
	
    <c:url value="/produto/formulario" var="linkProduto" />
	<a href="${linkProduto}"><fmt:message key="mensagem.novoProduto" /></a>
	
	<c:import url="../_comum/rodape.jsp" />
	
</body>
</html>