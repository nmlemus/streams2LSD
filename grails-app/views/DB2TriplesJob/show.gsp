
<%@ page import="com.rdb2lodc.jobs.DB2TriplesJob" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'DB2TriplesJob.label', default: 'DB2TriplesJob')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-DB2TriplesJob" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="DB2TriplesJob.db2triplesJob_name.label" default="Job Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: DB2TriplesJobInstance, field: "db2triplesJob_name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="DB2TriplesJob.mode.label" default="Mode" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: DB2TriplesJobInstance, field: "mode")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="DB2TriplesJob.baseURI.label" default="Base URI" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: DB2TriplesJobInstance, field: "baseURI")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="DB2TriplesJob.RDFFormat.label" default="RDFFormat" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: DB2TriplesJobInstance, field: "RDFFormat")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="DB2TriplesJob.status.label" default="Status" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: DB2TriplesJobInstance, field: "status")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="DB2TriplesJob.datasource1.label" default="Datasource" /></td>
				
				<td valign="top" class="value"><g:link controller="dataSource" action="show" id="${DB2TriplesJobInstance?.datasource1?.id}">${DB2TriplesJobInstance?.datasource1?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="DB2TriplesJob.r2RML.label" default="R2RML" /></td>
				
				<td valign="top" class="value"><g:link controller="r2RML" action="show" id="${DB2TriplesJobInstance?.r2RML?.id}">${DB2TriplesJobInstance?.r2RML?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
	<g:form action="executeJob" class="form-horizontal" role="form" >
		<div class="form-actions margin-top-medium">
			<g:submitButton name="executeJob" class="btn btn-primary" value="${message(code: 'default.button.run.label', default: 'Run Job')}" />
		</div>
	</g:form>

</section>

</body>

</html>
