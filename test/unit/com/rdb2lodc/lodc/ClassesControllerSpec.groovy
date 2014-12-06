package com.rdb2lodc.lodc


import grails.test.mixin.*
import spock.lang.*

@TestFor(ClassesController)
@Mock(Classes)
class ClassesControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.classesInstanceList
        model.classesInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.classesInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def classes = new Classes()
        classes.validate()
        controller.save(classes)

        then: "The create view is rendered again with the correct model"
        model.classesInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        classes = new Classes(params)

        controller.save(classes)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/classes/show/1'
        controller.flash.message != null
        Classes.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def classes = new Classes(params)
        controller.show(classes)

        then: "A model is populated containing the domain instance"
        model.classesInstance == classes
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def classes = new Classes(params)
        controller.edit(classes)

        then: "A model is populated containing the domain instance"
        model.classesInstance == classes
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/classes/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def classes = new Classes()
        classes.validate()
        controller.update(classes)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.classesInstance == classes

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        classes = new Classes(params).save(flush: true)
        controller.update(classes)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/classes/show/$classes.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/classes/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def classes = new Classes(params).save(flush: true)

        then: "It exists"
        Classes.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(classes)

        then: "The instance is deleted"
        Classes.count() == 0
        response.redirectedUrl == '/classes/index'
        flash.message != null
    }
}
