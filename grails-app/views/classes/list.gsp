
<%@ page import="com.rdb2lodc.lodc.Classes" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'classes.label', default: 'Classes')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-classes" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="classes_name" title="${message(code: 'classes.classes_name.label', default: 'Classesname')}" />
			
				<th><g:message code="classes.vocabulary.label" default="Vocabulary" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${classesInstanceList}" status="i" var="classesInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${classesInstance.id}">${fieldValue(bean: classesInstance, field: "classes_name")}</g:link></td>
			
				<td>${fieldValue(bean: classesInstance, field: "vocabulary")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${classesInstanceCount}" />
	</div>
</section>

</body>

</html>
