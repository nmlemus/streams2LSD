package com.rdb2lodc.db


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * AttributesController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class AttributesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Attributes.list(params), model: [attributesInstanceCount: Attributes.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Attributes.list(params), model: [attributesInstanceCount: Attributes.count()]
    }

    def show(Attributes attributesInstance) {
        respond attributesInstance
    }

    def create() {
        respond new Attributes(params)
    }

    @Transactional
    def save(Attributes attributesInstance) {
        if (attributesInstance == null) {
            notFound()
            return
        }

        if (attributesInstance.hasErrors()) {
            respond attributesInstance.errors, view: 'create'
            return
        }

        attributesInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'attributesInstance.label', default: 'Attributes'), attributesInstance.id])
                redirect attributesInstance
            }
            '*' { respond attributesInstance, [status: CREATED] }
        }
    }

    def edit(Attributes attributesInstance) {
        respond attributesInstance
    }

    @Transactional
    def update(Attributes attributesInstance) {
        if (attributesInstance == null) {
            notFound()
            return
        }

        if (attributesInstance.hasErrors()) {
            respond attributesInstance.errors, view: 'edit'
            return
        }

        attributesInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Attributes.label', default: 'Attributes'), attributesInstance.id])
                redirect attributesInstance
            }
            '*' { respond attributesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Attributes attributesInstance) {

        if (attributesInstance == null) {
            notFound()
            return
        }

        attributesInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Attributes.label', default: 'Attributes'), attributesInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'attributesInstance.label', default: 'Attributes'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
