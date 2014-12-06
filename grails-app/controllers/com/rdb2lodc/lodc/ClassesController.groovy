package com.rdb2lodc.lodc


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ClassesController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class ClassesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Classes.list(params), model: [classesInstanceCount: Classes.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Classes.list(params), model: [classesInstanceCount: Classes.count()]
    }

    def show(Classes classesInstance) {
        respond classesInstance
    }

    def create() {
        respond new Classes(params)
    }

    @Transactional
    def save(Classes classesInstance) {
        if (classesInstance == null) {
            notFound()
            return
        }

        if (classesInstance.hasErrors()) {
            respond classesInstance.errors, view: 'create'
            return
        }

        classesInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'classesInstance.label', default: 'Classes'), classesInstance.id])
                redirect classesInstance
            }
            '*' { respond classesInstance, [status: CREATED] }
        }
    }

    def edit(Classes classesInstance) {
        respond classesInstance
    }

    @Transactional
    def update(Classes classesInstance) {
        if (classesInstance == null) {
            notFound()
            return
        }

        if (classesInstance.hasErrors()) {
            respond classesInstance.errors, view: 'edit'
            return
        }

        classesInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Classes.label', default: 'Classes'), classesInstance.id])
                redirect classesInstance
            }
            '*' { respond classesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Classes classesInstance) {

        if (classesInstance == null) {
            notFound()
            return
        }

        classesInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Classes.label', default: 'Classes'), classesInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'classesInstance.label', default: 'Classes'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
