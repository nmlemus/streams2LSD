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

    static mapping = {
        table "table_attributes"
    }

    String toString(){
        return cl_name
    }

}
