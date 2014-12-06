
<%@ page import="com.rdb2lodc.lodc.Vocabulary" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'vocabulary.label', default: 'Vocabulary')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-vocabulary" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="vocabulary_name" title="${message(code: 'vocabulary.vocabulary_name.label', default: 'Vocabularyname')}" />
			
				<g:sortableColumn property="prefix" title="${message(code: 'vocabulary.prefix.label', default: 'Prefix')}" />
			
				<g:sortableColumn property="url" title="${message(code: 'vocabulary.url.label', default: 'Url')}" />
			
				<g:sortableColumn property="endpoint" title="${message(code: 'vocabulary.endpoint.label', default: 'Endpoint')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${vocabularyInstanceList}" status="i" var="vocabularyInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${vocabularyInstance.id}">${fieldValue(bean: vocabularyInstance, field: "vocabulary_name")}</g:link></td>
			
				<td>${fieldValue(bean: vocabularyInstance, field: "prefix")}</td>
			
				<td>${fieldValue(bean: vocabularyInstance, field: "url")}</td>
			
				<td>${fieldValue(bean: vocabularyInstance, field: "endpoint")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${vocabularyInstanceCount}" />
	</div>
</section>

</body>

</html>
