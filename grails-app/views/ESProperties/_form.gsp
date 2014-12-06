<%@ page import="com.rdb2lodc.lodc.ESProperties" %>



			<div class="${hasErrors(bean: ESPropertiesInstance, field: 'property', 'error')} required">
				<label for="property" class="control-label"><g:message code="ESProperties.property.label" default="Property" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="property" required="" value="${ESPropertiesInstance?.property}"/>
					<span class="help-inline">${hasErrors(bean: ESPropertiesInstance, field: 'property', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: ESPropertiesInstance, field: 'prefix', 'error')} required">
				<label for="prefix" class="control-label"><g:message code="ESProperties.prefix.label" default="Prefix" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="prefix" required="" value="${ESPropertiesInstance?.prefix}"/>
					<span class="help-inline">${hasErrors(bean: ESPropertiesInstance, field: 'prefix', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: ESPropertiesInstance, field: 'externalSorce', 'error')} required">
				<label for="externalSorce" class="control-label"><g:message code="ESProperties.externalSorce.label" default="External Sorce" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="externalSorce" name="externalSorce.id" from="${com.rdb2lodc.lodc.ExternalSource.list()}" optionKey="id" required="" value="${ESPropertiesInstance?.externalSorce?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: ESPropertiesInstance, field: 'externalSorce', 'error')}</span>
				</div>
			</div>

