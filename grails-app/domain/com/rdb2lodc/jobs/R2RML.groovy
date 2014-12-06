package com.rdb2lodc.jobs

import com.rdb2lodc.db.DataSource
import com.rdb2lodc.security.User

/**
 * R2RML
 * A domain class describes the data object and it's mapping to the database
 */
class R2RML {

    String r2rml_name
    DataSource dataSource
    byte[] r2rml

    static	belongsTo	= [user1: User]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static	hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        r2rml_name(blank: false)
    }

    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
