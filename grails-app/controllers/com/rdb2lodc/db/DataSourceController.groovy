package com.rdb2lodc.db

import com.rdb2lodc.security.User
import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import grails.plugins.springsecurity.SpringSecurityService

import javax.xml.crypto.Data

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Secured(['ROLE_ADMIN'])

/**
 * DataSourceController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class DataSourceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


	def index(Integer max) {
        //TODO: Modificar esto y la funcion list para que quede mejor programado todo
        def user = session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.username
        ArrayList<User> user1 = User.findAllByUsername(user.toString())
        println(user1[0].datasource)
        params.max = Math.min(max ?: 10, 100)
        List<DataSource> dataSource = DataSource.findAllByUser(user1[0])
        respond dataSource, model:[dataSourceInstanceCount: dataSource.size()]
    }

	def list(Integer max) {
        def user = session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.username
        ArrayList<User> user1 = User.findAllByUsername(user.toString())
        println(user1[0].datasource)
        params.max = Math.min(max ?: 10, 100)
        List<DataSource> dataSource = DataSource.findAllByUser(user1[0])
        respond dataSource, model:[dataSourceInstanceCount: dataSource.size()]

    }

    def show(DataSource dataSourceInstance) {
        respond dataSourceInstance
    }

    def create() {
        respond new DataSource(params)
    }

    @Transactional
    def save(DataSource dataSourceInstance) {

        if (dataSourceInstance == null) {
            notFound()
            return
        }

        if (dataSourceInstance.hasErrors()) {
            respond dataSourceInstance.errors, view:'create'
            return
        }

        DataSourceService dataSourceService = new DataSourceService(dataSourceInstance)
        dataSourceService.Connect()
        if (dataSourceService.conn == null){
            notFound()
            return
        }

        dataSourceInstance.save flush:true

        println "Conectado"
        String[] list = dataSourceService.getTablas()
        for (item in list){
            Table tabla = new Table()
            tabla.tabla_name = item
            tabla.datasource = dataSourceInstance
            tabla.save()
            for (item1 in dataSourceService.getAttributes(item)){
                println item1.cl_name
                item1.tables = tabla
                item1.save()
            }

        }

        dataSourceService.Disconnect();

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dataSourceInstance.label', default: 'DataSource'), dataSourceInstance.id])
                redirect dataSourceInstance
            }
            '*' { respond dataSourceInstance, [status: CREATED] }
        }
    }

    def edit(DataSource dataSourceInstance) {
        respond dataSourceInstance
    }

    @Transactional
    def update(DataSource dataSourceInstance) {
        if (dataSourceInstance == null) {
            notFound()
            return
        }

        if (dataSourceInstance.hasErrors()) {
            respond dataSourceInstance.errors, view:'edit'
            return
        }

        dataSourceInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DataSource.label', default: 'DataSource'), dataSourceInstance.id])
                redirect dataSourceInstance
            }
            '*'{ respond dataSourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DataSource dataSourceInstance) {

        if (dataSourceInstance == null) {
            notFound()
            return
        }

        dataSourceInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DataSource.label', default: 'DataSource'), dataSourceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dataSourceInstance.label', default: 'DataSource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def limes(){

    }

    def anotaciones(){

    }

    def test(Integer max){
        def user = session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.username
        ArrayList<User> user1 = User.findAllByUsername(user.toString())
        println(user1[0].datasource)
        params.max = Math.min(max ?: 10, 100)
        List<DataSource> dataSource = DataSource.findAllByUser(user1[0])
        respond dataSource, model:[dataSourceInstanceCount: dataSource.size()]
    }

    def sources(){

    }

    def dataSources = {
        def sources = DataSource.list()
        def jsonCells = sources.collect {
            [cell: [it.id, it.ds_name, it.ds_type, it.ds_host, it.ds_port], ]
        }
        def jsonData= [rows: jsonCells]
        render jsonData as JSON
    }
}
