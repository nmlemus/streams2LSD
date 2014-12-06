
<%@ page import="com.rdb2lodc.lodc.ExternalSource" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'externalSource.label', default: 'ExternalSource')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-externalSource" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="extSource_name" title="${message(code: 'externalSource.extSource_name.label', default: 'Ext Sourcename')}" />
			
				<g:sortableColumn property="endpoint" title="${message(code: 'externalSource.endpoint.label', default: 'Endpoint')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${externalSourceInstanceList}" status="i" var="externalSourceInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${externalSourceInstance.id}">${fieldValue(bean: externalSourceInstance, field: "extSource_name")}</g:link></td>
			
				<td>${fieldValue(bean: externalSourceInstance, field: "endpoint")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${externalSourceInstanceCount}" />
	</div>
</section>

</body>

</html>
