package com.rdb2lodc.jobs


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * R2RMLController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class R2RMLController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond R2RML.list(params), model:[r2RMLInstanceCount: R2RML.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond R2RML.list(params), model:[r2RMLInstanceCount: R2RML.count()]
    }

    def show(R2RML r2RMLInstance) {
        respond r2RMLInstance
    }

    def create() {
        respond new R2RML(params)
    }

    @Transactional
    def save(R2RML r2RMLInstance) {
        if (r2RMLInstance == null) {
            notFound()
            return
        }

        if (r2RMLInstance.hasErrors()) {
            respond r2RMLInstance.errors, view:'create'
            return
        }

        r2RMLInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'r2RMLInstance.label', default: 'R2RML'), r2RMLInstance.id])
                redirect r2RMLInstance
            }
            '*' { respond r2RMLInstance, [status: CREATED] }
        }
    }

    def edit(R2RML r2RMLInstance) {
        respond r2RMLInstance
    }

    @Transactional
    def update(R2RML r2RMLInstance) {
        if (r2RMLInstance == null) {
            notFound()
            return
        }

        if (r2RMLInstance.hasErrors()) {
            respond r2RMLInstance.errors, view:'edit'
            return
        }

        r2RMLInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'R2RML.label', default: 'R2RML'), r2RMLInstance.id])
                redirect r2RMLInstance
            }
            '*'{ respond r2RMLInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(R2RML r2RMLInstance) {

        if (r2RMLInstance == null) {
            notFound()
            return
        }

        r2RMLInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'R2RML.label', default: 'R2RML'), r2RMLInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'r2RMLInstance.label', default: 'R2RML'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
