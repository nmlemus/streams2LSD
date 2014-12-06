package com.rdb2lodc.lodc


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ESPropertiesController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ESPropertiesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ESProperties.list(params), model: [ESPropertiesInstanceCount: ESProperties.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ESProperties.list(params), model: [ESPropertiesInstanceCount: ESProperties.count()]
    }

    def show(ESProperties ESPropertiesInstance) {
        respond ESPropertiesInstance
    }

    def create() {
        respond new ESProperties(params)
    }

    @Transactional
    def save(ESProperties ESPropertiesInstance) {
        if (ESPropertiesInstance == null) {
            notFound()
            return
        }

        if (ESPropertiesInstance.hasErrors()) {
            respond ESPropertiesInstance.errors, view: 'create'
            return
        }

        ESPropertiesInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ESPropertiesInstance.label', default: 'ESProperties'), ESPropertiesInstance.id])
                redirect ESPropertiesInstance
            }
            '*' { respond ESPropertiesInstance, [status: CREATED] }
        }
    }

    def edit(ESProperties ESPropertiesInstance) {
        respond ESPropertiesInstance
    }

    @Transactional
    def update(ESProperties ESPropertiesInstance) {
        if (ESPropertiesInstance == null) {
            notFound()
            return
        }

        if (ESPropertiesInstance.hasErrors()) {
            respond ESPropertiesInstance.errors, view: 'edit'
            return
        }

        ESPropertiesInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ESProperties.label', default: 'ESProperties'), ESPropertiesInstance.id])
                redirect ESPropertiesInstance
            }
            '*' { respond ESPropertiesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ESProperties ESPropertiesInstance) {

        if (ESPropertiesInstance == null) {
            notFound()
            return
        }

        ESPropertiesInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ESProperties.label', default: 'ESProperties'), ESPropertiesInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ESPropertiesInstance.label', default: 'ESProperties'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
