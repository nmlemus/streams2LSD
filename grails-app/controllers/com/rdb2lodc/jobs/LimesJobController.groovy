package com.rdb2lodc.jobs

import com.rdb2lodc.security.User
import grails.plugins.springsecurity.SpringSecurityService
import grails.plugins.springsecurity.Secured

/**
 * LimesJobController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN'])
class LimesJobController {

    def springSecurityService

    def index = {

    }

    def save(){

        LimesJob limesJob = new LimesJob()

        LimesSource source = new LimesSource()
        LimesSource target = new LimesSource()

        source.endpoint = params.endpoint
        source.graph = params.rgraph
        source.var = params.var
        source.pagesize = params.pagesize as Integer
        source.restriction = params.restriction
        source.property = params.property
        source.sourcename = params.endpoint

        println source.endpoint
        println source.graph
        println source.var
        println source.pagesize
        println source.restriction
        println source.property

        source.save()

        target.endpoint = params.targetendpoint
        target.graph = params.targetrgraph
        target.var = params.targetvar
        target.pagesize = params.targetpagesize as Integer
        target.restriction = params.targetrestriction
        target.property = params.targetproperty
        target.sourcename = params.targetendpoint

        println target.endpoint
        println target.graph
        println target.var
        println target.pagesize
        println target.restriction
        println target.property

        target.save()

        // Configuracion del LimesJob

        limesJob.source = source
        limesJob.target = target

        limesJob.metric = params.metric
        limesJob.outputFormat = params.output

        limesJob.acceptanceTheshold = params.acceptancethreshold as float
        limesJob.acceptanceRelation = params.acceptancerelation

        limesJob.reviewTheshold = params.reviewthreshold as float
        limesJob.reviewRelation = params.reviewrelation

        limesJob.status = 'initialized'

        def user = springSecurityService.currentUser

        limesJob.userlimes = user

        def webRootDir = servletContext.getRealPath("/")
        def userDir = new File(webRootDir, "/r2rml/${session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.username}/")
        userDir.mkdirs()

        limesJob.LimesFile(userDir)

        respond limesJob, view:'show'

    }

    def index2 = {

    }

    def show(LimesJob limesJobInstance){
        respond limesJobInstance
    }

    def create(){
        render view: "index"
    }

}
