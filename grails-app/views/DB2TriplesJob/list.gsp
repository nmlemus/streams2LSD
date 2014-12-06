
<%@ page import="com.rdb2lodc.jobs.DB2TriplesJob" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'DB2TriplesJob.label', default: 'DB2TriplesJob')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-DB2TriplesJob" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="db2triplesJob_name" title="${message(code: 'DB2TriplesJob.db2triplesJob_name.label', default: 'Db2triples Jobname')}" />
			
				<g:sortableColumn property="mode" title="${message(code: 'DB2TriplesJob.mode.label', default: 'Mode')}" />
			
				<g:sortableColumn property="baseURI" title="${message(code: 'DB2TriplesJob.baseURI.label', default: 'Base URI')}" />
			
				<g:sortableColumn property="RDFFormat" title="${message(code: 'DB2TriplesJob.RDFFormat.label', default: 'RDFF ormat')}" />
			
				<g:sortableColumn property="status" title="${message(code: 'DB2TriplesJob.status.label', default: 'Status')}" />
			
				<th><g:message code="DB2TriplesJob.datasource1.label" default="Datasource1" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${DB2TriplesJobInstanceList}" status="i" var="DB2TriplesJobInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${DB2TriplesJobInstance.id}">${fieldValue(bean: DB2TriplesJobInstance, field: "db2triplesJob_name")}</g:link></td>
			
				<td>${fieldValue(bean: DB2TriplesJobInstance, field: "mode")}</td>
			
				<td>${fieldValue(bean: DB2TriplesJobInstance, field: "baseURI")}</td>
			
				<td>${fieldValue(bean: DB2TriplesJobInstance, field: "RDFFormat")}</td>
			
				<td>${fieldValue(bean: DB2TriplesJobInstance, field: "status")}</td>
			
				<td>${fieldValue(bean: DB2TriplesJobInstance, field: "datasource1")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${DB2TriplesJobInstanceCount}" />
	</div>
</section>

</body>

</html>
