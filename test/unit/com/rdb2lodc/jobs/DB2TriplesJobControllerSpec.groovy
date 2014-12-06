package com.rdb2lodc.jobs


import grails.test.mixin.*
import spock.lang.*

@TestFor(DB2TriplesJobController)
@Mock(DB2TriplesJob)
class DB2TriplesJobControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.DB2TriplesJobInstanceList
        model.DB2TriplesJobInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.DB2TriplesJobInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def DB2TriplesJob = new DB2TriplesJob()
        DB2TriplesJob.validate()
        controller.save(DB2TriplesJob)

        then: "The create view is rendered again with the correct model"
        model.DB2TriplesJobInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        DB2TriplesJob = new DB2TriplesJob(params)

        controller.save(DB2TriplesJob)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/DB2TriplesJob/show/1'
        controller.flash.message != null
        DB2TriplesJob.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def DB2TriplesJob = new DB2TriplesJob(params)
        controller.show(DB2TriplesJob)

        then: "A model is populated containing the domain instance"
        model.DB2TriplesJobInstance == DB2TriplesJob
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def DB2TriplesJob = new DB2TriplesJob(params)
        controller.edit(DB2TriplesJob)

        then: "A model is populated containing the domain instance"
        model.DB2TriplesJobInstance == DB2TriplesJob
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/DB2TriplesJob/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def DB2TriplesJob = new DB2TriplesJob()
        DB2TriplesJob.validate()
        controller.update(DB2TriplesJob)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.DB2TriplesJobInstance == DB2TriplesJob

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        DB2TriplesJob = new DB2TriplesJob(params).save(flush: true)
        controller.update(DB2TriplesJob)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/DB2TriplesJob/show/$DB2TriplesJob.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/DB2TriplesJob/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def DB2TriplesJob = new DB2TriplesJob(params).save(flush: true)

        then: "It exists"
        DB2TriplesJob.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(DB2TriplesJob)

        then: "The instance is deleted"
        DB2TriplesJob.count() == 0
        response.redirectedUrl == '/DB2TriplesJob/index'
        flash.message != null
    }
}
