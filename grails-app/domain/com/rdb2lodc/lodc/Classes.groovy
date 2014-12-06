package com.rdb2lodc.lodc

/**
 * Classes
 * A domain class describes the data object and it's mapping to the database
 */
class Classes {

   String classes_name

    static belongsTo = [vocabulary: Vocabulary]

    static mapping = {
    }

    static constraints = {
    }


	public String toString() {
		return classes_name
	}
}
