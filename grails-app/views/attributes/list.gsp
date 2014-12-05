
<%@ page import="com.rdb2lodc.db.Attributes" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'attributes.label', default: 'Attributes')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-attributes" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="cl_name" title="${message(code: 'attributes.cl_name.label', default: 'Clname')}" />
			
				<g:sortableColumn property="cl_type" title="${message(code: 'attributes.cl_type.label', default: 'Cltype')}" />
			
				<th><g:message code="attributes.tables.label" default="Tables" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${attributesInstanceList}" status="i" var="attributesInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${attributesInstance.id}">${fieldValue(bean: attributesInstance, field: "cl_name")}</g:link></td>
			
				<td>${fieldValue(bean: attributesInstance, field: "cl_type")}</td>
			
				<td>${fieldValue(bean: attributesInstance, field: "tables")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${attributesInstanceCount}" />
	</div>
</section>

</body>

</html>
