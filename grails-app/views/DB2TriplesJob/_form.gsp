<%@ page import="com.rdb2lodc.jobs.DB2TriplesJob" %>



			<div class="${hasErrors(bean: DB2TriplesJobInstance, field: 'db2triplesJob_name', 'error')} required">
				<label for="db2triplesJob_name" class="control-label"><g:message code="DB2TriplesJob.db2triplesJob_name.label" default="Db2triples Jobname" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="db2triplesJob_name" required="" value="${DB2TriplesJobInstance?.db2triplesJob_name}"/>
					<span class="help-inline">${hasErrors(bean: DB2TriplesJobInstance, field: 'db2triplesJob_name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: DB2TriplesJobInstance, field: 'mode', 'error')} ">
				<label for="mode" class="control-label"><g:message code="DB2TriplesJob.mode.label" default="Mode" /></label>
				<div>
					<g:select class="form-control" name="mode" from="${DB2TriplesJobInstance.constraints.mode.inList}" value="${DB2TriplesJobInstance?.mode}" valueMessagePrefix="DB2TriplesJob.mode" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: DB2TriplesJobInstance, field: 'mode', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: DB2TriplesJobInstance, field: 'baseURI', 'error')} ">
				<label for="baseURI" class="control-label"><g:message code="DB2TriplesJob.baseURI.label" default="Base URI" /></label>
				<div>
					<g:field class="form-control" type="url" name="baseURI" value="${DB2TriplesJobInstance?.baseURI}"/>
					<span class="help-inline">${hasErrors(bean: DB2TriplesJobInstance, field: 'baseURI', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: DB2TriplesJobInstance, field: 'RDFFormat', 'error')} ">
				<label for="RDFFormat" class="control-label"><g:message code="DB2TriplesJob.RDFFormat.label" default="RDFF ormat" /></label>
				<div>
					<g:select class="form-control" name="RDFFormat" from="${DB2TriplesJobInstance.constraints.RDFFormat.inList}" value="${DB2TriplesJobInstance?.RDFFormat}" valueMessagePrefix="DB2TriplesJob.RDFFormat" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: DB2TriplesJobInstance, field: 'RDFFormat', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: DB2TriplesJobInstance, field: 'status', 'error')} ">
				<label for="status" class="control-label"><g:message code="DB2TriplesJob.status.label" default="Status" /></label>
				<div>
					<g:select class="form-control" name="status" from="${DB2TriplesJobInstance.constraints.status.inList}" value="${DB2TriplesJobInstance?.status}" valueMessagePrefix="DB2TriplesJob.status" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: DB2TriplesJobInstance, field: 'status', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: DB2TriplesJobInstance, field: 'datasource1', 'error')} required">
				<label for="datasource1" class="control-label"><g:message code="DB2TriplesJob.datasource1.label" default="Datasource1" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="datasource1" name="datasource1.id" from="${com.rdb2lodc.db.DataSource.list()}" optionKey="id" required="" value="${DB2TriplesJobInstance?.datasource1?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: DB2TriplesJobInstance, field: 'datasource1', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: DB2TriplesJobInstance, field: 'r2RML', 'error')} required">
				<label for="r2RML" class="control-label"><g:message code="DB2TriplesJob.r2RML.label" default="R2 RML" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="r2RML" name="r2RML.id" from="${com.rdb2lodc.jobs.R2RML.list()}" optionKey="id" required="" value="${DB2TriplesJobInstance?.r2RML?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: DB2TriplesJobInstance, field: 'r2RML', 'error')}</span>
				</div>
			</div>

