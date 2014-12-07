package com.rdb2lodc.jobs

import com.rdb2lodc.db.DataSource
import com.rdb2lodc.security.User

/**
 * R2RML
 * A domain class describes the data object and it's mapping to the database
 */
class R2RML {

    String r2rml_name
    String r2rml
    String directory

    static	belongsTo	= [datasources: DataSource]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//    static	hasOne		= [db2triplesjob: DB2TriplesJob]
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 

    static mapping = {

    }

    static constraints = {
        r2rml_name(blank: false)
        r2rml(blank: false)
        directory(unique: false)
    }

    public String toString() {
    	return r2rml_name
    }
}
