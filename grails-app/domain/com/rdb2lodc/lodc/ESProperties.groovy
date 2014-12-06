package com.rdb2lodc.lodc

/**
 * ESProperties
 * A domain class describes the data object and it's mapping to the database
 */
class ESProperties {

    String property
    String prefix

	static	belongsTo	= [externalSorce: ExternalSource]

    static mapping = {
    }

    static constraints = {
        property(blank: false)
        prefix(blank: false)
    }

    public String toString() {
		return property
	}
}
