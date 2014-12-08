import com.rdb2lodc.jobs.DB2TriplesJob
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDB2LODCloud_DB2TriplesJobshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/DB2TriplesJob/show.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',7,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("layout"),'content':("kickstart")],-1)
printHtmlPart(2)
invokeTag('set','g',8,['var':("entityName"),'value':(message(code: 'DB2TriplesJob.label', default: 'DB2TriplesJob'))],-1)
printHtmlPart(2)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',9,['code':("default.show.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',9,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',9,[:],2)
printHtmlPart(0)
})
invokeTag('captureHead','sitemesh',10,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
invokeTag('message','g',20,['code':("DB2TriplesJob.db2triplesJob_name.label"),'default':("Job Name")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: DB2TriplesJobInstance, field: "db2triplesJob_name"))
printHtmlPart(6)
invokeTag('message','g',27,['code':("DB2TriplesJob.mode.label"),'default':("Mode")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: DB2TriplesJobInstance, field: "mode"))
printHtmlPart(6)
invokeTag('message','g',34,['code':("DB2TriplesJob.baseURI.label"),'default':("Base URI")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: DB2TriplesJobInstance, field: "baseURI"))
printHtmlPart(6)
invokeTag('message','g',41,['code':("DB2TriplesJob.RDFFormat.label"),'default':("RDFFormat")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: DB2TriplesJobInstance, field: "RDFFormat"))
printHtmlPart(6)
invokeTag('message','g',48,['code':("DB2TriplesJob.status.label"),'default':("Status")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: DB2TriplesJobInstance, field: "status"))
printHtmlPart(6)
invokeTag('message','g',55,['code':("DB2TriplesJob.datasource1.label"),'default':("Datasource")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(DB2TriplesJobInstance?.datasource1?.encodeAsHTML())
})
invokeTag('link','g',57,['controller':("dataSource"),'action':("show"),'id':(DB2TriplesJobInstance?.datasource1?.id)],2)
printHtmlPart(6)
invokeTag('message','g',62,['code':("DB2TriplesJob.r2RML.label"),'default':("R2RML")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(DB2TriplesJobInstance?.r2RML?.encodeAsHTML())
})
invokeTag('link','g',64,['controller':("r2RML"),'action':("show"),'id':(DB2TriplesJobInstance?.r2RML?.id)],2)
printHtmlPart(7)
createTagBody(2, {->
printHtmlPart(8)
invokeTag('submitButton','g',72,['name':("executeJob"),'class':("btn btn-primary"),'value':(message(code: 'default.button.run.label', default: 'Run Job'))],-1)
printHtmlPart(9)
})
invokeTag('form','g',74,['action':("executeJob"),'class':("form-horizontal"),'role':("form")],2)
printHtmlPart(10)
})
invokeTag('captureBody','sitemesh',78,[:],1)
printHtmlPart(11)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1417912930000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
