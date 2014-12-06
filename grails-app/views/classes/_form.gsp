<%@ page import="com.rdb2lodc.lodc.Classes" %>



			<div class="${hasErrors(bean: classesInstance, field: 'classes_name', 'error')} ">
				<label for="classes_name" class="control-label"><g:message code="classes.classes_name.label" default="Classesname" /></label>
				<div>
					<g:textField class="form-control" name="classes_name" value="${classesInstance?.classes_name}"/>
					<span class="help-inline">${hasErrors(bean: classesInstance, field: 'classes_name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: classesInstance, field: 'vocabulary', 'error')} required">
				<label for="vocabulary" class="control-label"><g:message code="classes.vocabulary.label" default="Vocabulary" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="vocabulary" name="vocabulary.id" from="${com.rdb2lodc.lodc.Vocabulary.list()}" optionKey="id" required="" value="${classesInstance?.vocabulary?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: classesInstance, field: 'vocabulary', 'error')}</span>
				</div>
			</div>

