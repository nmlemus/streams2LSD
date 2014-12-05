package com.rdb2lodc.security

class Role {

	String authority

	static mapping = {
		cache true
		table "table_role"
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
