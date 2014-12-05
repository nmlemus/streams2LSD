package com.rdb2lodc.db

/**
 * Attributes
 * A domain class describes the data object and it's mapping to the database
 */
class Attributes {

    String cl_name
    int cl_type

    static belongsTo = [tables: Table]

    static constraints = {
    }

    String toString(){
        return cl_name
    }

}
