<%@ page import="com.rdb2lodc.lodc.Vocabulary" %>



			<div class="${hasErrors(bean: vocabularyInstance, field: 'vocabulary_name', 'error')} required">
				<label for="vocabulary_name" class="control-label"><g:message code="vocabulary.vocabulary_name.label" default="Vocabularyname" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="vocabulary_name" required="" value="${vocabularyInstance?.vocabulary_name}"/>
					<span class="help-inline">${hasErrors(bean: vocabularyInstance, field: 'vocabulary_name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vocabularyInstance, field: 'prefix', 'error')} required">
				<label for="prefix" class="control-label"><g:message code="vocabulary.prefix.label" default="Prefix" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="prefix" required="" value="${vocabularyInstance?.prefix}"/>
					<span class="help-inline">${hasErrors(bean: vocabularyInstance, field: 'prefix', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vocabularyInstance, field: 'url', 'error')} ">
				<label for="url" class="control-label"><g:message code="vocabulary.url.label" default="Url" /></label>
				<div>
					<g:field class="form-control" type="url" name="url" value="${vocabularyInstance?.url}"/>
					<span class="help-inline">${hasErrors(bean: vocabularyInstance, field: 'url', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vocabularyInstance, field: 'classes', 'error')} ">
				<label for="classes" class="control-label"><g:message code="vocabulary.classes.label" default="Classes" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${vocabularyInstance?.classes?}" var="c">
    <li><g:link controller="classes" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="classes" action="create" params="['vocabulary.id': vocabularyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'classes.label', default: 'Classes')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: vocabularyInstance, field: 'classes', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: vocabularyInstance, field: 'endpoint', 'error')} ">
				<label for="endpoint" class="control-label"><g:message code="vocabulary.endpoint.label" default="Endpoint" /></label>
				<div>
					<g:textField class="form-control" name="endpoint" value="${vocabularyInstance?.endpoint}"/>
					<span class="help-inline">${hasErrors(bean: vocabularyInstance, field: 'endpoint', 'error')}</span>
				</div>
			</div>

