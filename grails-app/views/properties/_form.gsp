<%@ page import="com.rdb2lodc.lodc.Properties" %>



			<div class="${hasErrors(bean: propertiesInstance, field: 'property_name', 'error')} ">
				<label for="property_name" class="control-label"><g:message code="properties.property_name.label" default="Propertyname" /></label>
				<div>
					<g:textField class="form-control" name="property_name" value="${propertiesInstance?.property_name}"/>
					<span class="help-inline">${hasErrors(bean: propertiesInstance, field: 'property_name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: propertiesInstance, field: 'vocabulary', 'error')} required">
				<label for="vocabulary" class="control-label"><g:message code="properties.vocabulary.label" default="Vocabulary" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="vocabulary" name="vocabulary.id" from="${com.rdb2lodc.lodc.Vocabulary.list()}" optionKey="id" required="" value="${propertiesInstance?.vocabulary?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: propertiesInstance, field: 'vocabulary', 'error')}</span>
				</div>
			</div>

