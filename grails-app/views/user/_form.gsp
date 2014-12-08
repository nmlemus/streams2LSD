<%@ page import="com.rdb2lodc.security.User" %>



			<div class="${hasErrors(bean: userInstance, field: 'username', 'error')} required">
				<label for="username" class="control-label"><g:message code="user.username.label" default="Username" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="username" required="" value="${userInstance?.username}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'username', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'password', 'error')} required">
				<label for="password" class="control-label"><g:message code="user.password.label" default="Password" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" type="password" name="password" required="" value="${userInstance?.password}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'password', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'email', 'error')} required">
				<label for="email" class="control-label"><g:message code="user.email.label" default="Email" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" type="email" name="email" required="" value="${userInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
				<label for="accountExpired" class="control-label"><g:message code="user.accountExpired.label" default="Account Expired" /></label>
				<div>
					<bs:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'accountExpired', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
				<label for="accountLocked" class="control-label"><g:message code="user.accountLocked.label" default="Account Locked" /></label>
				<div>
					<bs:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'accountLocked', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'affiliation', 'error')} ">
				<label for="affiliation" class="control-label"><g:message code="user.affiliation.label" default="Affiliation" /></label>
				<div>
					<g:textField class="form-control" name="affiliation" value="${userInstance?.affiliation}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'affiliation', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'datasource', 'error')} ">
				<label for="datasource" class="control-label"><g:message code="user.datasource.label" default="Datasource" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${userInstance?.datasource?}" var="d">
    <li><g:link controller="dataSource" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="dataSource" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'dataSource.label', default: 'DataSource')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: userInstance, field: 'datasource', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
				<label for="enabled" class="control-label"><g:message code="user.enabled.label" default="Enabled" /></label>
				<div>
					<bs:checkBox name="enabled" value="${userInstance?.enabled}" />
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'enabled', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'limesjobs', 'error')} ">
				<label for="limesjobs" class="control-label"><g:message code="user.limesjobs.label" default="Limesjobs" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${userInstance?.limesjobs?}" var="l">
    <li><g:link controller="limesJob" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="limesJob" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'limesJob.label', default: 'LimesJob')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: userInstance, field: 'limesjobs', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="user.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${userInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
				<label for="passwordExpired" class="control-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></label>
				<div>
					<bs:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
					<span class="help-inline">${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')}</span>
				</div>
			</div>

