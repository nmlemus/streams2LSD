package com.rdb2lodc.jobs

import com.rdb2lodc.db.DataSource
import com.rdb2lodc.security.User

/**
 * DB2TriplesJob
 * A domain class describes the data object and it's mapping to the database
 */
class DB2TriplesJob {

	String db2triplesJob_name
	R2RML r2RML
	String mode
	String baseURI
	String RDFFormat
	String status

	static	belongsTo	= [datasource1: DataSource]
//	static	belongsTo	= [users: User]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.

//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 

    static	mapping = {
    }

	static	constraints = {
		db2triplesJob_name(blank: false)
		mode(inList: ['r2rml', 'dm'])
		baseURI(url: true)
		RDFFormat(inList: ['TURTLE', 'RDFXML', 'NTRIPLES', 'N3'])
		status(inList: ['initialized', 'running', 'finished', 'aborted'])
		r2RML(nullable: true)
    }

	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
