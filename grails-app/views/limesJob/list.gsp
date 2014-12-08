<%@ page import="com.rdb2lodc.jobs.LimesJob" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'limesJob.label', default: 'LimesJob')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<section id="list-limesJob" class="first">

    <table class="table table-bordered margin-top-medium">
        <thead>
        <tr>

            <g:sortableColumn property="acceptanceRelation"
                              title="${message(code: 'limesJob.acceptanceRelation.label', default: 'Acceptance Relation')}"/>

            <g:sortableColumn property="acceptanceTheshold"
                              title="${message(code: 'limesJob.acceptanceTheshold.label', default: 'Acceptance Theshold')}"/>

            <g:sortableColumn property="metric" title="${message(code: 'limesJob.metric.label', default: 'Metric')}"/>

            <g:sortableColumn property="outputFormat"
                              title="${message(code: 'limesJob.outputFormat.label', default: 'Output Format')}"/>

            <g:sortableColumn property="reviewRelation"
                              title="${message(code: 'limesJob.reviewRelation.label', default: 'Review Relation')}"/>

            <g:sortableColumn property="reviewTheshold"
                              title="${message(code: 'limesJob.reviewTheshold.label', default: 'Review Theshold')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${limesJobInstanceList}" status="i" var="limesJobInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td><g:link action="show"
                            id="${limesJobInstance.id}">${fieldValue(bean: limesJobInstance, field: "acceptanceRelation")}</g:link></td>

                <td>${fieldValue(bean: limesJobInstance, field: "acceptanceTheshold")}</td>

                <td>${fieldValue(bean: limesJobInstance, field: "metric")}</td>

                <td>${fieldValue(bean: limesJobInstance, field: "outputFormat")}</td>

                <td>${fieldValue(bean: limesJobInstance, field: "reviewRelation")}</td>

                <td>${fieldValue(bean: limesJobInstance, field: "reviewTheshold")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div>
        <bs:paginate total="${limesJobInstanceCount}"/>
    </div>
</section>

</body>

</html>
