package com.rdb2lodc.db

/**
 * Table
 * A domain class describes the data object and it's mapping to the database
 */
class Table {

	String tabla_name

	static belongsTo = [datasource: DataSource]
	static hasMany = [attributes: Attributes]

	static constraints = {

	}

	static mapping = {
		table "table_table"
	}

	String toString(){
		return tabla_name
	}
}
