
<%@ page import="com.rdb2lodc.lodc.Properties" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'properties.label', default: 'Properties')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-properties" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="properties.property_name.label" default="Propertyname" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: propertiesInstance, field: "property_name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="properties.vocabulary.label" default="Vocabulary" /></td>
				
				<td valign="top" class="value"><g:link controller="vocabulary" action="show" id="${propertiesInstance?.vocabulary?.id}">${propertiesInstance?.vocabulary?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
