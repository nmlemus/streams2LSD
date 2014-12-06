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

