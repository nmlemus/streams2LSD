package com.rdb2lodc.jobs

import com.rdb2lodc.db.DataSource
import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugins.springsecurity.SpringSecurityService

/**
 * R2RMLController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN'])
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
    def save() {
        def r2RMLInstance = new R2RML()
        def uploadedFile = request.getFile('r2rml')
        if(!uploadedFile.empty){
            println "Class: ${uploadedFile.class}"
            println "Name: ${uploadedFile.name}"
            println "OriginalFileName: ${uploadedFile.originalFilename}"
            println "Size: ${uploadedFile.size}"
            println "ContentType: ${uploadedFile.contentType}"

            def webRootDir = servletContext.getRealPath("/")
            def userDir = new File(webRootDir, "/r2rml/${session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.username}/")
            userDir.mkdirs()
            uploadedFile.transferTo( new File( userDir, uploadedFile.originalFilename))
            r2RMLInstance.setR2rml_name(params.r2rml_name)
            r2RMLInstance.setR2rml("${uploadedFile.originalFilename}")
            r2RMLInstance.setDirectory(userDir.toString())
            r2RMLInstance.setDatasources(DataSource.findById(params.datasources.id))


            println("-----------------------------------")
            println(r2RMLInstance.r2rml_name)
            println(r2RMLInstance.directory)
            println(r2RMLInstance.r2rml)
            println(r2RMLInstance.datasources)
            println(r2RMLInstance.id)
            println("-----------------------------------")
            r2RMLInstance.save()
        }
        respond r2RMLInstance, view:'show'

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
