<%@ page import="com.rdb2lodc.lodc.ExternalSource" %>



			<div class="${hasErrors(bean: externalSourceInstance, field: 'extSource_name', 'error')} required">
				<label for="extSource_name" class="control-label"><g:message code="externalSource.extSource_name.label" default="Ext Sourcename" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="extSource_name" required="" value="${externalSourceInstance?.extSource_name}"/>
					<span class="help-inline">${hasErrors(bean: externalSourceInstance, field: 'extSource_name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: externalSourceInstance, field: 'endpoint', 'error')} required">
				<label for="endpoint" class="control-label"><g:message code="externalSource.endpoint.label" default="Endpoint" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" type="url" name="endpoint" required="" value="${externalSourceInstance?.endpoint}"/>
					<span class="help-inline">${hasErrors(bean: externalSourceInstance, field: 'endpoint', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: externalSourceInstance, field: 'esproperties', 'error')} ">
				<label for="esproperties" class="control-label"><g:message code="externalSource.esproperties.label" default="Esproperties" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${externalSourceInstance?.esproperties?}" var="e">
    <li><g:link controller="ESProperties" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ESProperties" action="create" params="['externalSource.id': externalSourceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ESProperties.label', default: 'ESProperties')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: externalSourceInstance, field: 'esproperties', 'error')}</span>
				</div>
			</div>

