<%@ page import="com.rdb2lodc.lodc.Vocabulary" %>
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart"/>
    <g:set var="entityName" value="${message(code: 'vocabulary.label', default: 'Vocabulary')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<section id="show-vocabulary" class="first">

    <table class="table">
        <tbody>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="vocabulary.vocabulary_name.label"
                                                     default="Vocabularyname"/></td>

            <td valign="top" class="value">${fieldValue(bean: vocabularyInstance, field: "vocabulary_name")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="vocabulary.prefix.label" default="Prefix"/></td>

            <td valign="top" class="value">${fieldValue(bean: vocabularyInstance, field: "prefix")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="vocabulary.url.label" default="Url"/></td>

            <td valign="top" class="value">${fieldValue(bean: vocabularyInstance, field: "url")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="vocabulary.classes.label" default="Classes"/></td>

            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${vocabularyInstance.classes}" var="c">
                        <li><g:link controller="classes" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="vocabulary.endpoint.label" default="Endpoint"/></td>

            <td valign="top" class="value">${fieldValue(bean: vocabularyInstance, field: "endpoint")}</td>

        </tr>

        </tbody>
    </table>
</section>

</body>

</html>
