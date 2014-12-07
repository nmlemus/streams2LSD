<%@ page import="com.rdb2lodc.jobs.DB2TriplesJob" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart" />
    <g:set var="entityName" value="${message(code: 'DB2TriplesJob.label', default: 'DB2TriplesJob')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create-DB2TriplesJob" class="first">

    <g:hasErrors bean="${DB2TriplesJobInstance}">
        <div class="alert alert-danger">
            <g:renderErrors bean="${DB2TriplesJobInstance}" as="list" />
        </div>
    </g:hasErrors>

    <g:form action="executeJob" class="form-horizontal" role="form" >
        <g:render template="form"/>

        <div class="form-actions margin-top-medium">
            <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.run.label', default: 'Run Job')}" />
            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
        </div>
    </g:form>

</section>

</body>

</html>
