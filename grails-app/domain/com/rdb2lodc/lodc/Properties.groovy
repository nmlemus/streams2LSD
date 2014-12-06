package com.rdb2lodc.lodc

/**
 * Properties
 * A domain class describes the data object and it's mapping to the database
 */
class Properties {

    String property_name

    static belongsTo = [vocabulary: Vocabulary]

    static mapping = {
    }

    static constraints = {
    }

    public String toString() {
		return property_name
	}
}
