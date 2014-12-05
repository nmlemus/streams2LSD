
<%@ page import="com.rdb2lodc.db.DataSource" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'dataSource.label', default: 'DataSource')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-dataSource" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="ds_name" title="${message(code: 'dataSource.ds_name.label', default: 'Dsname')}" />
			
				<g:sortableColumn property="ds_type" title="${message(code: 'dataSource.ds_type.label', default: 'Dstype')}" />
			
				<g:sortableColumn property="ds_host" title="${message(code: 'dataSource.ds_host.label', default: 'Dshost')}" />
			
				<g:sortableColumn property="ds_port" title="${message(code: 'dataSource.ds_port.label', default: 'Dsport')}" />
			
				<g:sortableColumn property="ds_user" title="${message(code: 'dataSource.ds_user.label', default: 'Dsuser')}" />
			
				<g:sortableColumn property="ds_password" title="${message(code: 'dataSource.ds_password.label', default: 'Dspassword')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${dataSourceInstanceList}" status="i" var="dataSourceInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${dataSourceInstance.id}">${fieldValue(bean: dataSourceInstance, field: "ds_name")}</g:link></td>
			
				<td>${fieldValue(bean: dataSourceInstance, field: "ds_type")}</td>
			
				<td>${fieldValue(bean: dataSourceInstance, field: "ds_host")}</td>
			
				<td>${fieldValue(bean: dataSourceInstance, field: "ds_port")}</td>
			
				<td>${fieldValue(bean: dataSourceInstance, field: "ds_user")}</td>
			
				<td>${fieldValue(bean: dataSourceInstance, field: "ds_password")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${dataSourceInstanceCount}" />
	</div>
</section>

</body>

</html>
