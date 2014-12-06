package com.rdb2lodc.lodc


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ExternalSourceController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ExternalSourceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ExternalSource.list(params), model: [externalSourceInstanceCount: ExternalSource.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ExternalSource.list(params), model: [externalSourceInstanceCount: ExternalSource.count()]
    }

    def show(ExternalSource externalSourceInstance) {
        respond externalSourceInstance
    }

    def create() {
        respond new ExternalSource(params)
    }

    @Transactional
    def save(ExternalSource externalSourceInstance) {
        if (externalSourceInstance == null) {
            notFound()
            return
        }

        if (externalSourceInstance.hasErrors()) {
            respond externalSourceInstance.errors, view: 'create'
            return
        }

        externalSourceInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'externalSourceInstance.label', default: 'ExternalSource'), externalSourceInstance.id])
                redirect externalSourceInstance
            }
            '*' { respond externalSourceInstance, [status: CREATED] }
        }
    }

    def edit(ExternalSource externalSourceInstance) {
        respond externalSourceInstance
    }

    @Transactional
    def update(ExternalSource externalSourceInstance) {
        if (externalSourceInstance == null) {
            notFound()
            return
        }

        if (externalSourceInstance.hasErrors()) {
            respond externalSourceInstance.errors, view: 'edit'
            return
        }

        externalSourceInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ExternalSource.label', default: 'ExternalSource'), externalSourceInstance.id])
                redirect externalSourceInstance
            }
            '*' { respond externalSourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ExternalSource externalSourceInstance) {

        if (externalSourceInstance == null) {
            notFound()
            return
        }

        externalSourceInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ExternalSource.label', default: 'ExternalSource'), externalSourceInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'externalSourceInstance.label', default: 'ExternalSource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
