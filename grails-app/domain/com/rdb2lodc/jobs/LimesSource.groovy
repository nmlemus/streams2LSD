package com.rdb2lodc.jobs

/**
 * LimesSource
 * A domain class describes the data object and it's mapping to the database
 */
class LimesSource {

    String sourcename
    String endpoint
    String graph
    String var
    int pagesize
    String restriction
    String property

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

//	static	belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {

    }

    public String toString() {
		return sourcename
	}
}
