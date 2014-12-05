<%@ page import="com.rdb2lodc.db.Attributes" %>



			<div class="${hasErrors(bean: attributesInstance, field: 'cl_name', 'error')} ">
				<label for="cl_name" class="control-label"><g:message code="attributes.cl_name.label" default="Clname" /></label>
				<div>
					<g:textField class="form-control" name="cl_name" value="${attributesInstance?.cl_name}"/>
					<span class="help-inline">${hasErrors(bean: attributesInstance, field: 'cl_name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: attributesInstance, field: 'cl_type', 'error')} required">
				<label for="cl_type" class="control-label"><g:message code="attributes.cl_type.label" default="Cltype" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="cl_type" type="number" value="${attributesInstance.cl_type}" required=""/>
					<span class="help-inline">${hasErrors(bean: attributesInstance, field: 'cl_type', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: attributesInstance, field: 'tables', 'error')} required">
				<label for="tables" class="control-label"><g:message code="attributes.tables.label" default="Tables" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="tables" name="tables.id" from="${com.rdb2lodc.db.Table.list()}" optionKey="id" required="" value="${attributesInstance?.tables?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: attributesInstance, field: 'tables', 'error')}</span>
				</div>
			</div>

