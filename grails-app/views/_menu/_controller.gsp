<li class="dropdown">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Browse <b class="caret"></b></a>
	<ul class="dropdown-menu">
		<%
			def controllersAlvo = grailsApplication.controllerClasses.findAll {
				it.naturalName != "Properties Controller" && it.naturalName != "Login Controller" && it.naturalName != "Logout Controller" &&
						it.naturalName != "Attributes Controller" && it.naturalName != "Table Controller" && it.naturalName != "External Source Controller" &&
						it.naturalName != "ESP roperties Controller" && it.naturalName != "Classes Controller" && it.naturalName != "Vocabulary Controller" &&
						it.naturalName != "Boot Strap Test Controller"
			}
		%>
		<g:each var="c" in="${controllersAlvo}">
			<li class="controller">
				<g:link controller="${c.logicalPropertyName}">
					${c.logicalPropertyName.capitalize().substring(c.logicalPropertyName.lastIndexOf('.')+1)}
				</g:link>
			</li>
		</g:each>
	</ul>
</li>
