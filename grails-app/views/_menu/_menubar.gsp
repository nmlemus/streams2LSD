<div class="">
	<ul class="nav nav-tabs" data-role="listview" data-split-icon="gear" data-filter="true">

		<%
			def controllersAlvo = grailsApplication.controllerClasses.findAll {
				it.naturalName != "Properties Controller" && it.naturalName != "Login Controller" && it.naturalName != "Logout Controller" &&
				it.naturalName != "Attributes Controller" && it.naturalName != "Table Controller" && it.naturalName != "External Source Controller" &&
						it.naturalName != "ESP roperties Controller" && it.naturalName != "Classes Controller" && it.naturalName != "Vocabulary Controller" &&
						it.naturalName != "Boot Strap Test Controller" && it.naturalName != "User Controller" && it.naturalName != "Role Controller" &&
						it.naturalName != "User Role Controller"
			}
		%>

		<%--<g:each var="c" in="${controllersAlvo}">
			<li class="controller${params.controller == c.logicalPropertyName ? " active" : ""}">
				<g:link controller="${c.logicalPropertyName}" action="index">
					<g:message code="${c.logicalPropertyName}.label" />
				</g:link>
			</li>
		</g:each>--%>

		<li class="controller">
			<g:link controller="home" action="index">
				<g:message code="home.label" />
			</g:link>
		</li>
		<li class="controller">
			<g:link controller="dataSource" action="index">
				<g:message code="dataSource.label" />
			</g:link>
		</li>
		<li class="controller">
			<g:link controller="r2RML" action="index">
				<g:message code="r2RML.label" />
			</g:link>
		</li>
		<li class="controller">
			<g:link controller="DB2TriplesJob" action="index">
				<g:message code="DB2TriplesJob.label" />
			</g:link>
		</li>
		<li class="controller">
			<g:link controller="limesJob" action="index">
				<g:message code="limesJob.label" />
			</g:link>
		</li>
		<li class="controller">
			<g:link controller="endPoint" action="index">
				<g:message code="endPoint.label" />
			</g:link>
		</li>

		<%--<g:each status="i" var="c" in="${grailsApplication.controllerClasses }">
			<li class="controller${params.controller == c.logicalPropertyName ? " active" : ""}">
				<g:link controller="${c.logicalPropertyName}" action="index">
					<g:message code="${c.logicalPropertyName}.label" default="${c.logicalPropertyName.capitalize()}"/>
				</g:link>
			</li>
		</g:each>--%>




	</ul>
</div>
