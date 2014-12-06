
<%@ page import="com.rdb2lodc.jobs.R2RML" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'r2RML.label', default: 'R2RML')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-r2RML" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="r2rml_name" title="${message(code: 'r2RML.r2rml_name.label', default: 'R2rmlname')}" />
			
				<g:sortableColumn property="r2rml" title="${message(code: 'r2RML.r2rml.label', default: 'R2rml')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${r2RMLInstanceList}" status="i" var="r2RMLInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${r2RMLInstance.id}">${fieldValue(bean: r2RMLInstance, field: "r2rml_name")}</g:link></td>
			
				<td>${fieldValue(bean: r2RMLInstance, field: "r2rml")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${r2RMLInstanceCount}" />
	</div>
</section>

</body>

</html>
