
<%@ page import="com.rdb2lodc.lodc.ExternalSource" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'externalSource.label', default: 'ExternalSource')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-externalSource" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="externalSource.extSource_name.label" default="Ext Sourcename" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: externalSourceInstance, field: "extSource_name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="externalSource.endpoint.label" default="Endpoint" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: externalSourceInstance, field: "endpoint")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="externalSource.esproperties.label" default="Esproperties" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${externalSourceInstance.esproperties}" var="e">
						<li><g:link controller="ESProperties" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
