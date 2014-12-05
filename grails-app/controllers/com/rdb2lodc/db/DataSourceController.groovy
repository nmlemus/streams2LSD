package com.rdb2lodc.db

import com.rdb2lodc.security.User
import grails.plugins.springsecurity.Secured
import grails.plugins.springsecurity.SpringSecurityService

import javax.xml.crypto.Data

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured(['ROLE_ADMIN'])

/**
 * DataSourceController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class DataSourceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


	def index(Integer max) {
        def user = session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.username
        ArrayList<User> user1 = User.findAllByUsername(user.toString())
        println(user1[0].datasource)
        params.max = Math.min(max ?: 10, 100)
        List<DataSource> dataSource = DataSource.findAllByUser(user1[0])
        respond dataSource, model:[dataSourceInstanceCount: dataSource.size()]
    }

	def list(Integer max) {
        def user = session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.username
        ArrayList<User> user1 = User.findAllByUsername(user.toString())
        println(user1[0].datasource)
        params.max = Math.min(max ?: 10, 100)
        List<DataSource> dataSource = DataSource.findAllByUser(user1[0])
        respond dataSource, model:[dataSourceInstanceCount: dataSource.size()]

    }

    def show(DataSource dataSourceInstance) {
        respond dataSourceInstance
    }

    def create() {
        respond new DataSource(params)
    }

    @Transactional
    def save(DataSource dataSourceInstance) {

        if (dataSourceInstance == null) {
            notFound()
            return
        }

        if (dataSourceInstance.hasErrors()) {
            respond dataSourceInstance.errors, view:'create'
            return
        }

        dataSourceInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dataSourceInstance.label', default: 'DataSource'), dataSourceInstance.id])
                redirect dataSourceInstance
            }
            '*' { respond dataSourceInstance, [status: CREATED] }
        }
    }

    def edit(DataSource dataSourceInstance) {
        respond dataSourceInstance
    }

    @Transactional
    def update(DataSource dataSourceInstance) {
        if (dataSourceInstance == null) {
            notFound()
            return
        }

        if (dataSourceInstance.hasErrors()) {
            respond dataSourceInstance.errors, view:'edit'
            return
        }

        dataSourceInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DataSource.label', default: 'DataSource'), dataSourceInstance.id])
                redirect dataSourceInstance
            }
            '*'{ respond dataSourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DataSource dataSourceInstance) {

        if (dataSourceInstance == null) {
            notFound()
            return
        }

        dataSourceInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DataSource.label', default: 'DataSource'), dataSourceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dataSourceInstance.label', default: 'DataSource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}