
<%@ page import="com.rdb2lodc.db.DataSource" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'dataSource.label', default: 'DataSource')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-dataSource" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="dataSource.ds_name.label" default="Dsname" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: dataSourceInstance, field: "ds_name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="dataSource.ds_type.label" default="Dstype" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: dataSourceInstance, field: "ds_type")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="dataSource.ds_host.label" default="Dshost" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: dataSourceInstance, field: "ds_host")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="dataSource.ds_port.label" default="Dsport" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: dataSourceInstance, field: "ds_port")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="dataSource.ds_user.label" default="Dsuser" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: dataSourceInstance, field: "ds_user")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="dataSource.ds_password.label" default="Dspassword" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: dataSourceInstance, field: "ds_password")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="dataSource.tables.label" default="Tables" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${dataSourceInstance.tables}" var="t">
						<li><g:link controller="table" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="dataSource.user.label" default="User" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${dataSourceInstance?.user?.id}">${dataSourceInstance?.user?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
