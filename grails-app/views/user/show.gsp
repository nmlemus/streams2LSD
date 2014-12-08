
<%@ page import="com.rdb2lodc.security.User" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-user" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.username.label" default="Username" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "username")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.password.label" default="Password" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "password")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.accountExpired.label" default="Account Expired" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.accountLocked.label" default="Account Locked" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.affiliation.label" default="Affiliation" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "affiliation")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.datasource.label" default="Datasource" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${userInstance.datasource}" var="d">
						<li><g:link controller="dataSource" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.enabled.label" default="Enabled" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.enabled}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.limesjobs.label" default="Limesjobs" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${userInstance.limesjobs}" var="l">
						<li><g:link controller="limesJob" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.passwordExpired.label" default="Password Expired" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
