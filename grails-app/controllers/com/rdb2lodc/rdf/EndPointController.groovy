package com.rdb2lodc.rdf

import com.hp.hpl.jena.graph.Triple
import grails.converters.JSON;

import static com.hp.hpl.jena.query.ARQ.set;
import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.query.QueryFactory;
import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.RDFNode;
import org.apache.jena.riot.Lang;
import static org.apache.jena.riot.Lang.*;
import static org.apache.jena.riot.Lang.RDFXML;
import org.apache.jena.riot.RDFDataMgr;
import org.apache.jena.riot.lang.CollectorStreamTriples;
import virtuoso.jena.driver.VirtGraph;
import virtuoso.jena.driver.VirtuosoQueryExecution;
import virtuoso.jena.driver.VirtuosoQueryExecutionFactory;
/**
 * EndPointController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class EndPointController {

	def index(){
		redirect(url: "http://localhost:8890/sparql")
	}



	def executeQuery = {

		VirtGraph graph = new VirtGraph ("jdbc:virtuoso://localhost:1111", "dba", "dba");



		Query sparql1 = QueryFactory.create("SELECT * WHERE { GRAPH ?graph { ?s ?p ?o } }")

		def vqe = VirtuosoQueryExecutionFactory.create(sparql1, graph)

		ResultSet results = vqe.execSelect()
		println "Resulset: " + results.rowNumber

		while (results.hasNext()) {
			QuerySolution result = results.nextSolution();
			RDFNode graph1 = result.get("graph");
			RDFNode s = result.get("s");
			RDFNode p = result.get("p");
			RDFNode o = result.get("o");

			println graph1 + " " + s + " " + p + " " + o

		}

		render results
	}
}
