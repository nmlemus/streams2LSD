<%@ page import="com.rdb2lodc.security.User" %>

<div id="navbar">
    <nobr>
        <g:if test="${session.SPRING_SECURITY_CONTEXT?.authentication?.authenticated}">
            <b>${session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.username}</b>
            <g:link controller="logout" action=''>Logout</g:link>
        </g:if>
        <g:else>
            <g:link controller="login" action=''>Login</g:link>
        </g:else>
    </nobr>
</div>