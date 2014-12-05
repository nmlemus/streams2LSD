package com.rdb2lodc.db


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * TableController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class TableController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Table.list(params), model: [tableInstanceCount: Table.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Table.list(params), model: [tableInstanceCount: Table.count()]
    }

    def show(Table tableInstance) {
        respond tableInstance
    }

    def create() {
        respond new Table(params)
    }

    @Transactional
    def save(Table tableInstance) {
        if (tableInstance == null) {
            notFound()
            return
        }

        if (tableInstance.hasErrors()) {
            respond tableInstance.errors, view: 'create'
            return
        }

        tableInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tableInstance.label', default: 'Table'), tableInstance.id])
                redirect tableInstance
            }
            '*' { respond tableInstance, [status: CREATED] }
        }
    }

    def edit(Table tableInstance) {
        respond tableInstance
    }

    @Transactional
    def update(Table tableInstance) {
        if (tableInstance == null) {
            notFound()
            return
        }

        if (tableInstance.hasErrors()) {
            respond tableInstance.errors, view: 'edit'
            return
        }

        tableInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Table.label', default: 'Table'), tableInstance.id])
                redirect tableInstance
            }
            '*' { respond tableInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Table tableInstance) {

        if (tableInstance == null) {
            notFound()
            return
        }

        tableInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Table.label', default: 'Table'), tableInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tableInstance.label', default: 'Table'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
