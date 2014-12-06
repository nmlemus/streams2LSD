
<%@ page import="com.rdb2lodc.lodc.Classes" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'classes.label', default: 'Classes')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-classes" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="classes.classes_name.label" default="Classesname" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: classesInstance, field: "classes_name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="classes.vocabulary.label" default="Vocabulary" /></td>
				
				<td valign="top" class="value"><g:link controller="vocabulary" action="show" id="${classesInstance?.vocabulary?.id}">${classesInstance?.vocabulary?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
