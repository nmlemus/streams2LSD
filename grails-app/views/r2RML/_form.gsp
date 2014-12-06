<%@ page import="com.rdb2lodc.jobs.R2RML" %>



			<div class="${hasErrors(bean: r2RMLInstance, field: 'r2rml_name', 'error')} required">
				<label for="r2rml_name" class="control-label"><g:message code="r2RML.r2rml_name.label" default="R2rmlname" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="r2rml_name" required="" value="${r2RMLInstance?.r2rml_name}"/>
					<span class="help-inline">${hasErrors(bean: r2RMLInstance, field: 'r2rml_name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: r2RMLInstance, field: 'r2rml', 'error')} required">
				<label for="r2rml" class="control-label"><g:message code="r2RML.r2rml.label" default="R2rml" /><span class="required-indicator">*</span></label>
				<div>
					<input type="file" id="r2rml" name="r2rml" />
					<span class="help-inline">${hasErrors(bean: r2RMLInstance, field: 'r2rml', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: r2RMLInstance, field: 'directory', 'error')} ">
				<label for="directory" class="control-label"><g:message code="r2RML.directory.label" default="Directory" /></label>
				<div>
					<g:textField class="form-control" name="directory" value="${r2RMLInstance?.directory}"/>
					<span class="help-inline">${hasErrors(bean: r2RMLInstance, field: 'directory', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: r2RMLInstance, field: 'datasources', 'error')} required">
				<label for="datasources" class="control-label"><g:message code="r2RML.datasources.label" default="Datasources" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="datasources" name="datasources.id" from="${com.rdb2lodc.db.DataSource.list()}" optionKey="id" required="" value="${r2RMLInstance?.datasources?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: r2RMLInstance, field: 'datasources', 'error')}</span>
				</div>
			</div>

