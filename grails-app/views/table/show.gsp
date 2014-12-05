
<%@ page import="com.rdb2lodc.db.Table" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'table.label', default: 'Table')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-table" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="table.attributes.label" default="Attributes" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${tableInstance.attributes}" var="a">
						<li><g:link controller="attributes" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="table.datasource.label" default="Datasource" /></td>
				
				<td valign="top" class="value"><g:link controller="dataSource" action="show" id="${tableInstance?.datasource?.id}">${tableInstance?.datasource?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="table.tabla_name.label" default="Tablaname" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: tableInstance, field: "tabla_name")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
