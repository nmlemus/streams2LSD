package com.rdb2lodc.db


import grails.test.mixin.*
import spock.lang.*

@TestFor(TableController)
@Mock(Table)
class TableControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.tableInstanceList
        model.tableInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.tableInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def table = new Table()
        table.validate()
        controller.save(table)

        then: "The create view is rendered again with the correct model"
        model.tableInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        table = new Table(params)

        controller.save(table)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/table/show/1'
        controller.flash.message != null
        Table.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def table = new Table(params)
        controller.show(table)

        then: "A model is populated containing the domain instance"
        model.tableInstance == table
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def table = new Table(params)
        controller.edit(table)

        then: "A model is populated containing the domain instance"
        model.tableInstance == table
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/table/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def table = new Table()
        table.validate()
        controller.update(table)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.tableInstance == table

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        table = new Table(params).save(flush: true)
        controller.update(table)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/table/show/$table.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/table/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def table = new Table(params).save(flush: true)

        then: "It exists"
        Table.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(table)

        then: "The instance is deleted"
        Table.count() == 0
        response.redirectedUrl == '/table/index'
        flash.message != null
    }
}
