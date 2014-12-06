
<%@ page import="com.rdb2lodc.lodc.ESProperties" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ESProperties.label', default: 'ESProperties')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-ESProperties" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ESProperties.property.label" default="Property" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ESPropertiesInstance, field: "property")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ESProperties.prefix.label" default="Prefix" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ESPropertiesInstance, field: "prefix")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ESProperties.externalSorce.label" default="External Sorce" /></td>
				
				<td valign="top" class="value"><g:link controller="externalSource" action="show" id="${ESPropertiesInstance?.externalSorce?.id}">${ESPropertiesInstance?.externalSorce?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
