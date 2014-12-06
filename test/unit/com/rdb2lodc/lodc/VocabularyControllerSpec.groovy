package com.rdb2lodc.lodc


import grails.test.mixin.*
import spock.lang.*

@TestFor(VocabularyController)
@Mock(Vocabulary)
class VocabularyControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.vocabularyInstanceList
        model.vocabularyInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.vocabularyInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def vocabulary = new Vocabulary()
        vocabulary.validate()
        controller.save(vocabulary)

        then: "The create view is rendered again with the correct model"
        model.vocabularyInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        vocabulary = new Vocabulary(params)

        controller.save(vocabulary)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/vocabulary/show/1'
        controller.flash.message != null
        Vocabulary.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def vocabulary = new Vocabulary(params)
        controller.show(vocabulary)

        then: "A model is populated containing the domain instance"
        model.vocabularyInstance == vocabulary
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def vocabulary = new Vocabulary(params)
        controller.edit(vocabulary)

        then: "A model is populated containing the domain instance"
        model.vocabularyInstance == vocabulary
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/vocabulary/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def vocabulary = new Vocabulary()
        vocabulary.validate()
        controller.update(vocabulary)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.vocabularyInstance == vocabulary

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        vocabulary = new Vocabulary(params).save(flush: true)
        controller.update(vocabulary)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/vocabulary/show/$vocabulary.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/vocabulary/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def vocabulary = new Vocabulary(params).save(flush: true)

        then: "It exists"
        Vocabulary.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(vocabulary)

        then: "The instance is deleted"
        Vocabulary.count() == 0
        response.redirectedUrl == '/vocabulary/index'
        flash.message != null
    }
}
