package com.rdb2lodc.rdf


/**
 * EndPointController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class EndPointController {

	def index(){
		redirect(url: "http://localhost:8890/sparql")
	}
}
