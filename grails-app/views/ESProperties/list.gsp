
<%@ page import="com.rdb2lodc.lodc.ESProperties" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ESProperties.label', default: 'ESProperties')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-ESProperties" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="property" title="${message(code: 'ESProperties.property.label', default: 'Property')}" />
			
				<g:sortableColumn property="prefix" title="${message(code: 'ESProperties.prefix.label', default: 'Prefix')}" />
			
				<th><g:message code="ESProperties.externalSorce.label" default="External Sorce" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${ESPropertiesInstanceList}" status="i" var="ESPropertiesInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${ESPropertiesInstance.id}">${fieldValue(bean: ESPropertiesInstance, field: "property")}</g:link></td>
			
				<td>${fieldValue(bean: ESPropertiesInstance, field: "prefix")}</td>
			
				<td>${fieldValue(bean: ESPropertiesInstance, field: "externalSorce")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${ESPropertiesInstanceCount}" />
	</div>
</section>

</body>

</html>
