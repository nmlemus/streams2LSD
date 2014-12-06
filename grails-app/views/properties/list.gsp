
<%@ page import="com.rdb2lodc.lodc.Properties" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'properties.label', default: 'Properties')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-properties" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="property_name" title="${message(code: 'properties.property_name.label', default: 'Propertyname')}" />
			
				<th><g:message code="properties.vocabulary.label" default="Vocabulary" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${propertiesInstanceList}" status="i" var="propertiesInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${propertiesInstance.id}">${fieldValue(bean: propertiesInstance, field: "property_name")}</g:link></td>
			
				<td>${fieldValue(bean: propertiesInstance, field: "vocabulary")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${propertiesInstanceCount}" />
	</div>
</section>

</body>

</html>
