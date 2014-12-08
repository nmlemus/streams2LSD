<%@ page import="com.rdb2lodc.jobs.LimesJob" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'limesJob.label', default: 'LimesJob')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<section id="show-limesJob" class="first">

    <table class="table">
        <tbody>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="limesJob.acceptanceRelation.label"
                                                     default="Acceptance Relation"/></td>

            <td valign="top" class="value">${fieldValue(bean: limesJobInstance, field: "acceptanceRelation")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="limesJob.acceptanceTheshold.label"
                                                     default="Acceptance Theshold"/></td>

            <td valign="top" class="value">${fieldValue(bean: limesJobInstance, field: "acceptanceTheshold")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="limesJob.metric.label" default="Metric"/></td>

            <td valign="top" class="value">${fieldValue(bean: limesJobInstance, field: "metric")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="limesJob.outputFormat.label" default="Output Format"/></td>

            <td valign="top" class="value">${fieldValue(bean: limesJobInstance, field: "outputFormat")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="limesJob.reviewRelation.label"
                                                     default="Review Relation"/></td>

            <td valign="top" class="value">${fieldValue(bean: limesJobInstance, field: "reviewRelation")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="limesJob.reviewTheshold.label"
                                                     default="Review Theshold"/></td>

            <td valign="top" class="value">${fieldValue(bean: limesJobInstance, field: "reviewTheshold")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="limesJob.source.label" default="Source"/></td>

            <td valign="top" class="value"><g:link controller="limesSource" action="show"
                                                   id="${limesJobInstance?.source?.id}">${limesJobInstance?.source?.encodeAsHTML()}</g:link></td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="limesJob.target.label" default="Target"/></td>

            <td valign="top" class="value"><g:link controller="limesSource" action="show"
                                                   id="${limesJobInstance?.target?.id}">${limesJobInstance?.target?.encodeAsHTML()}</g:link></td>

        </tr>

        </tbody>
    </table>
</section>

</body>

</html>
