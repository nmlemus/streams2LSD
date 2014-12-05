<%@ page import="com.rdb2lodc.db.DataSource" %>
<%@ page import="com.rdb2lodc.security.User"%>


			<div class="${hasErrors(bean: dataSourceInstance, field: 'ds_name', 'error')} required">
				<label for="ds_name" class="control-label"><g:message code="dataSource.ds_name.label" default="Dsname" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="ds_name" required="" value="${dataSourceInstance?.ds_name}"/>
					<span class="help-inline">${hasErrors(bean: dataSourceInstance, field: 'ds_name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: dataSourceInstance, field: 'ds_type', 'error')} ">
				<label for="ds_type" class="control-label"><g:message code="dataSource.ds_type.label" default="Dstype" /></label>
				<div>
					<g:select class="form-control" name="ds_type" from="${dataSourceInstance.constraints.ds_type.inList}" value="${dataSourceInstance?.ds_type}" valueMessagePrefix="dataSource.ds_type" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: dataSourceInstance, field: 'ds_type', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: dataSourceInstance, field: 'ds_host', 'error')} required">
				<label for="ds_host" class="control-label"><g:message code="dataSource.ds_host.label" default="Dshost" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="ds_host" required="" value="${dataSourceInstance?.ds_host}"/>
					<span class="help-inline">${hasErrors(bean: dataSourceInstance, field: 'ds_host', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: dataSourceInstance, field: 'ds_port', 'error')} required">
				<label for="ds_port" class="control-label"><g:message code="dataSource.ds_port.label" default="Dsport" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="ds_port" type="number" value="${dataSourceInstance.ds_port}" required=""/>
					<span class="help-inline">${hasErrors(bean: dataSourceInstance, field: 'ds_port', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: dataSourceInstance, field: 'ds_user', 'error')} required">
				<label for="ds_user" class="control-label"><g:message code="dataSource.ds_user.label" default="Dsuser" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="ds_user" required="" value="${dataSourceInstance?.ds_user}"/>
					<span class="help-inline">${hasErrors(bean: dataSourceInstance, field: 'ds_user', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: dataSourceInstance, field: 'ds_password', 'error')} required">
				<label for="ds_password" class="control-label"><g:message code="dataSource.ds_password.label" default="Dspassword" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" type="password" name="ds_password" required="" value="${dataSourceInstance?.ds_password}"/>
					<span class="help-inline">${hasErrors(bean: dataSourceInstance, field: 'ds_password', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: dataSourceInstance, field: 'tables', 'error')} ">
				<label for="tables" class="control-label"><g:message code="dataSource.tables.label" default="Tables" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${dataSourceInstance?.tables?}" var="t">
    <li><g:link controller="table" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="table" action="create" params="['dataSource.id': dataSourceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'table.label', default: 'Table')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: dataSourceInstance, field: 'tables', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: dataSourceInstance, field: 'user', 'error')} required" hidden="">
				<label for="user" class="control-label"><g:message code="dataSource.user.label" default="User" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="user" name="user.id" hidden="" from="${session.SPRING_SECURITY_CONTEXT?.authentication?.principal}" optionKey="id" required="" value="${dataSourceInstance?.user?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: dataSourceInstance, field: 'user', 'error')}</span>
				</div>
			</div>

