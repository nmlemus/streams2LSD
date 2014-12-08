
<%@ page import="com.rdb2lodc.security.UserRole" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-userRole" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userRole.role.label" default="Role" /></td>
				
				<td valign="top" class="value"><g:link controller="role" action="show" id="${userRoleInstance?.role?.id}">${userRoleInstance?.role?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userRole.user.label" default="User" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${userRoleInstance?.user?.id}">${userRoleInstance?.user?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
