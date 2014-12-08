
<%@ page import="com.rdb2lodc.security.Role" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-role" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="authority" title="${message(code: 'role.authority.label', default: 'Authority')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${roleInstanceList}" status="i" var="roleInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${roleInstance.id}">${fieldValue(bean: roleInstance, field: "authority")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${roleInstanceCount}" />
	</div>
</section>

</body>

</html>
