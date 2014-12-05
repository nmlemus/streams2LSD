package com.rdb2lodc.db

import com.rdb2lodc.security.User

/**
 * DataSource
 * A domain class describes the data object and it's mapping to the database
 */
class DataSource {

	String ds_name
	String ds_type
	String ds_host
	int ds_port
	String ds_user
	String ds_password

	static belongsTo = [user: User]
	static hasMany = [tables: Table]

	static constraints = {
		ds_name(blank: false, unique: true)
		ds_type(inList: ['PostgreSQL', 'MySQL'])
		ds_host(blank: false)
		ds_port(blank: false)
		ds_user(blank: false)
		ds_password(blank: false, password: true)
	}
}
