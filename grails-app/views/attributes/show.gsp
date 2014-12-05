
<%@ page import="com.rdb2lodc.db.Attributes" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'attributes.label', default: 'Attributes')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-attributes" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="attributes.cl_name.label" default="Clname" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: attributesInstance, field: "cl_name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="attributes.cl_type.label" default="Cltype" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: attributesInstance, field: "cl_type")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="attributes.tables.label" default="Tables" /></td>
				
				<td valign="top" class="value"><g:link controller="table" action="show" id="${attributesInstance?.tables?.id}">${attributesInstance?.tables?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
