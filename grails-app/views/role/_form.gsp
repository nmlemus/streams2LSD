<%@ page import="com.rdb2lodc.security.Role" %>



			<div class="${hasErrors(bean: roleInstance, field: 'authority', 'error')} required">
				<label for="authority" class="control-label"><g:message code="role.authority.label" default="Authority" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="authority" required="" value="${roleInstance?.authority}"/>
					<span class="help-inline">${hasErrors(bean: roleInstance, field: 'authority', 'error')}</span>
				</div>
			</div>

