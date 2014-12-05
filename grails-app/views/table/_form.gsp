<%@ page import="com.rdb2lodc.db.Table" %>



			<div class="${hasErrors(bean: tableInstance, field: 'attributes', 'error')} ">
				<label for="attributes" class="control-label"><g:message code="table.attributes.label" default="Attributes" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${tableInstance?.attributes?}" var="a">
    <li><g:link controller="attributes" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="attributes" action="create" params="['table.id': tableInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'attributes.label', default: 'Attributes')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: tableInstance, field: 'attributes', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: tableInstance, field: 'datasource', 'error')} required">
				<label for="datasource" class="control-label"><g:message code="table.datasource.label" default="Datasource" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="datasource" name="datasource.id" from="${com.rdb2lodc.db.DataSource.list()}" optionKey="id" required="" value="${tableInstance?.datasource?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: tableInstance, field: 'datasource', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: tableInstance, field: 'tabla_name', 'error')} ">
				<label for="tabla_name" class="control-label"><g:message code="table.tabla_name.label" default="Tablaname" /></label>
				<div>
					<g:textField class="form-control" name="tabla_name" value="${tableInstance?.tabla_name}"/>
					<span class="help-inline">${hasErrors(bean: tableInstance, field: 'tabla_name', 'error')}</span>
				</div>
			</div>

