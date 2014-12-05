
<%@ page import="com.rdb2lodc.db.Table" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'table.label', default: 'Table')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-table" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th><g:message code="table.datasource.label" default="Datasource" /></th>
			
				<g:sortableColumn property="tabla_name" title="${message(code: 'table.tabla_name.label', default: 'Tablaname')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${tableInstanceList}" status="i" var="tableInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${tableInstance.id}">${fieldValue(bean: tableInstance, field: "datasource")}</g:link></td>
			
				<td>${fieldValue(bean: tableInstance, field: "tabla_name")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${tableInstanceCount}" />
	</div>
</section>

</body>

</html>
