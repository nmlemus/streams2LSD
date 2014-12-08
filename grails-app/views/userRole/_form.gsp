<%@ page import="com.rdb2lodc.security.UserRole" %>



			<div class="${hasErrors(bean: userRoleInstance, field: 'role', 'error')} required">
				<label for="role" class="control-label"><g:message code="userRole.role.label" default="Role" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="role" name="role.id" from="${com.rdb2lodc.security.Role.list()}" optionKey="id" required="" value="${userRoleInstance?.role?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userRoleInstance, field: 'role', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userRoleInstance, field: 'user', 'error')} required">
				<label for="user" class="control-label"><g:message code="userRole.user.label" default="User" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="user" name="user.id" from="${com.rdb2lodc.security.User.list()}" optionKey="id" required="" value="${userRoleInstance?.user?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userRoleInstance, field: 'user', 'error')}</span>
				</div>
			</div>

