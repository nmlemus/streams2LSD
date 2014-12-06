
<%@ page import="com.rdb2lodc.jobs.R2RML" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'r2RML.label', default: 'R2RML')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-r2RML" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="r2RML.r2rml_name.label" default="R2rmlname" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: r2RMLInstance, field: "r2rml_name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="r2RML.r2rml.label" default="R2rml" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: r2RMLInstance, field: "r2rml")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="r2RML.directory.label" default="Directory" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: r2RMLInstance, field: "directory")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="r2RML.datasources.label" default="Datasources" /></td>
				
				<td valign="top" class="value"><g:link controller="dataSource" action="show" id="${r2RMLInstance?.datasources?.id}">${r2RMLInstance?.datasources?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
