package com.rdb2lodc.lodc


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * PropertiesController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class PropertiesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Properties.list(params), model: [propertiesInstanceCount: Properties.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Properties.list(params), model: [propertiesInstanceCount: Properties.count()]
    }

    def show(Properties propertiesInstance) {
        respond propertiesInstance
    }

    def create() {
        respond new Properties(params)
    }

    @Transactional
    def save(Properties propertiesInstance) {
        if (propertiesInstance == null) {
            notFound()
            return
        }

        if (propertiesInstance.hasErrors()) {
            respond propertiesInstance.errors, view: 'create'
            return
        }

        propertiesInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'propertiesInstance.label', default: 'Properties'), propertiesInstance.id])
                redirect propertiesInstance
            }
            '*' { respond propertiesInstance, [status: CREATED] }
        }
    }

    def edit(Properties propertiesInstance) {
        respond propertiesInstance
    }

    @Transactional
    def update(Properties propertiesInstance) {
        if (propertiesInstance == null) {
            notFound()
            return
        }

        if (propertiesInstance.hasErrors()) {
            respond propertiesInstance.errors, view: 'edit'
            return
        }

        propertiesInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Properties.label', default: 'Properties'), propertiesInstance.id])
                redirect propertiesInstance
            }
            '*' { respond propertiesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Properties propertiesInstance) {

        if (propertiesInstance == null) {
            notFound()
            return
        }

        propertiesInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Properties.label', default: 'Properties'), propertiesInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'propertiesInstance.label', default: 'Properties'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
