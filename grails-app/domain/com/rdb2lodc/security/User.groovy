package com.rdb2lodc.security

import com.rdb2lodc.db.DataSource
import com.rdb2lodc.jobs.DB2TriplesJob
import com.rdb2lodc.jobs.LimesJob
import com.rdb2lodc.jobs.R2RML

class User {

	transient springSecurityService

	String name
	String affiliation
	String username
	String password
	String email
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static hasMany = [datasource: DataSource, limesjobs: LimesJob]
	static mappedBy = [datasource: "user", limesjobs: "userlimes"]

	static constraints = {
		username blank: false, unique: true
		password blank: false, password: true
		email(blank: false, email: true)
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
