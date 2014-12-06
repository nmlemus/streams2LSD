package com.rdb2lodc.jobs


import grails.test.mixin.*
import spock.lang.*

@TestFor(R2RMLController)
@Mock(R2RML)
class R2RMLControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.r2RMLInstanceList
        model.r2RMLInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.r2RMLInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def r2RML = new R2RML()
        r2RML.validate()
        controller.save(r2RML)

        then: "The create view is rendered again with the correct model"
        model.r2RMLInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        r2RML = new R2RML(params)

        controller.save(r2RML)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/r2RML/show/1'
        controller.flash.message != null
        R2RML.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def r2RML = new R2RML(params)
        controller.show(r2RML)

        then: "A model is populated containing the domain instance"
        model.r2RMLInstance == r2RML
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def r2RML = new R2RML(params)
        controller.edit(r2RML)

        then: "A model is populated containing the domain instance"
        model.r2RMLInstance == r2RML
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/r2RML/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def r2RML = new R2RML()
        r2RML.validate()
        controller.update(r2RML)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.r2RMLInstance == r2RML

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        r2RML = new R2RML(params).save(flush: true)
        controller.update(r2RML)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/r2RML/show/$r2RML.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/r2RML/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def r2RML = new R2RML(params).save(flush: true)

        then: "It exists"
        R2RML.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(r2RML)

        then: "The instance is deleted"
        R2RML.count() == 0
        response.redirectedUrl == '/r2RML/index'
        flash.message != null
    }
}
