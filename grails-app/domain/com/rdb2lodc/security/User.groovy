package com.rdb2lodc.security

import com.rdb2lodc.db.DataSource
import com.rdb2lodc.jobs.DB2TriplesJob
import com.rdb2lodc.jobs.R2RML

class User {

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static hasMany = [datasource: DataSource]
	static mappedBy = [datasource: "user"]

	static constraints = {
		username blank: false, unique: true
		password blank: false, password: true
	}

	static mapping = {
		table "table_user"
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

	String toString(){
		return username
	}
}
