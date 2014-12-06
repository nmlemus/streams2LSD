package com.rdb2lodc.jobs


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * DB2TriplesJobController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class DB2TriplesJobController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DB2TriplesJob.list(params), model: [DB2TriplesJobInstanceCount: DB2TriplesJob.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DB2TriplesJob.list(params), model: [DB2TriplesJobInstanceCount: DB2TriplesJob.count()]
    }

    def show(DB2TriplesJob DB2TriplesJobInstance) {
        respond DB2TriplesJobInstance
    }

    def create() {
        respond new DB2TriplesJob(params)
    }

    @Transactional
    def save(DB2TriplesJob DB2TriplesJobInstance) {
        if (DB2TriplesJobInstance == null) {
            notFound()
            return
        }

        if (DB2TriplesJobInstance.hasErrors()) {
            respond DB2TriplesJobInstance.errors, view: 'create'
            return
        }

        DB2TriplesJobInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'DB2TriplesJobInstance.label', default: 'DB2TriplesJob'), DB2TriplesJobInstance.id])
                redirect DB2TriplesJobInstance
            }
            '*' { respond DB2TriplesJobInstance, [status: CREATED] }
        }
    }

    def edit(DB2TriplesJob DB2TriplesJobInstance) {
        respond DB2TriplesJobInstance
    }

    @Transactional
    def update(DB2TriplesJob DB2TriplesJobInstance) {
        if (DB2TriplesJobInstance == null) {
            notFound()
            return
        }

        if (DB2TriplesJobInstance.hasErrors()) {
            respond DB2TriplesJobInstance.errors, view: 'edit'
            return
        }

        DB2TriplesJobInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DB2TriplesJob.label', default: 'DB2TriplesJob'), DB2TriplesJobInstance.id])
                redirect DB2TriplesJobInstance
            }
            '*' { respond DB2TriplesJobInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DB2TriplesJob DB2TriplesJobInstance) {

        if (DB2TriplesJobInstance == null) {
            notFound()
            return
        }

        DB2TriplesJobInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DB2TriplesJob.label', default: 'DB2TriplesJob'), DB2TriplesJobInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'DB2TriplesJobInstance.label', default: 'DB2TriplesJob'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
