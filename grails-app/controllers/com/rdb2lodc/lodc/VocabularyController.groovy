package com.rdb2lodc.lodc


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * VocabularyController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class VocabularyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Vocabulary.list(params), model:[vocabularyInstanceCount: Vocabulary.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Vocabulary.list(params), model:[vocabularyInstanceCount: Vocabulary.count()]
    }

    def show(Vocabulary vocabularyInstance) {
        respond vocabularyInstance
    }

    def create() {
        respond new Vocabulary(params)
    }

    @Transactional
    def save(Vocabulary vocabularyInstance) {
        if (vocabularyInstance == null) {
            notFound()
            return
        }

        if (vocabularyInstance.hasErrors()) {
            respond vocabularyInstance.errors, view:'create'
            return
        }

        vocabularyInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vocabularyInstance.label', default: 'Vocabulary'), vocabularyInstance.id])
                redirect vocabularyInstance
            }
            '*' { respond vocabularyInstance, [status: CREATED] }
        }
    }

    def edit(Vocabulary vocabularyInstance) {
        respond vocabularyInstance
    }

    @Transactional
    def update(Vocabulary vocabularyInstance) {
        if (vocabularyInstance == null) {
            notFound()
            return
        }

        if (vocabularyInstance.hasErrors()) {
            respond vocabularyInstance.errors, view:'edit'
            return
        }

        vocabularyInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Vocabulary.label', default: 'Vocabulary'), vocabularyInstance.id])
                redirect vocabularyInstance
            }
            '*'{ respond vocabularyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Vocabulary vocabularyInstance) {

        if (vocabularyInstance == null) {
            notFound()
            return
        }

        vocabularyInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Vocabulary.label', default: 'Vocabulary'), vocabularyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vocabularyInstance.label', default: 'Vocabulary'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
