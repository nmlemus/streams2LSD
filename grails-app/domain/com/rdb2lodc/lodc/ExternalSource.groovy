package com.rdb2lodc.lodc

/**
 * ExternalSource
 * A domain class describes the data object and it's mapping to the database
 */
class ExternalSource {

    String extSource_name
    String endpoint

    static	hasMany		= [esproperties: ESProperties]


    static mapping = {
    }

    static constraints = {
        extSource_name(unique: true, blank: false)
        endpoint(url: true, blank: false)
    }

    public String toString() {
		return extSource_name
	}
}
