package com.rdb2lodc.lodc

/**
 * Vocabulary
 * A domain class describes the data object and it's mapping to the database
 */
class Vocabulary {

	String vocabulary_name
	String prefix
	String url
	String endpoint

	static hasMany = [classes: Classes, properties: Properties]
	static mappedBy = [classes: "vocabulary", properties: "vocabularies"]

    static	mapping = {
    }
    
	static	constraints = {
		vocabulary_name(unique: true, blank: false)
		prefix(unique: true, blank: false)
		url(unique: true, url: true)
    }
	
	public String toString() {
		return vocabulary_name
	}
}
