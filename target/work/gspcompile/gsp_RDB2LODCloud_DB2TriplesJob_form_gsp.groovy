import com.rdb2lodc.jobs.DB2TriplesJob
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDB2LODCloud_DB2TriplesJob_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/DB2TriplesJob/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: DB2TriplesJobInstance, field: 'db2triplesJob_name', 'error'))
printHtmlPart(1)
invokeTag('message','g',6,['code':("DB2TriplesJob.db2triplesJob_name.label"),'default':("Db2triples Jobname")],-1)
printHtmlPart(2)
invokeTag('textField','g',8,['class':("form-control"),'name':("db2triplesJob_name"),'required':(""),'value':(DB2TriplesJobInstance?.db2triplesJob_name)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: DB2TriplesJobInstance, field: 'db2triplesJob_name', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: DB2TriplesJobInstance, field: 'mode', 'error'))
printHtmlPart(5)
invokeTag('message','g',14,['code':("DB2TriplesJob.mode.label"),'default':("Mode")],-1)
printHtmlPart(6)
invokeTag('select','g',16,['class':("form-control"),'name':("mode"),'from':(DB2TriplesJobInstance.constraints.mode.inList),'value':(DB2TriplesJobInstance?.mode),'valueMessagePrefix':("DB2TriplesJob.mode"),'noSelection':(['': ''])],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: DB2TriplesJobInstance, field: 'mode', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: DB2TriplesJobInstance, field: 'baseURI', 'error'))
printHtmlPart(7)
invokeTag('message','g',22,['code':("DB2TriplesJob.baseURI.label"),'default':("Base URI")],-1)
printHtmlPart(6)
invokeTag('field','g',24,['class':("form-control"),'type':("url"),'name':("baseURI"),'value':(DB2TriplesJobInstance?.baseURI)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: DB2TriplesJobInstance, field: 'baseURI', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: DB2TriplesJobInstance, field: 'RDFFormat', 'error'))
printHtmlPart(8)
invokeTag('message','g',30,['code':("DB2TriplesJob.RDFFormat.label"),'default':("RDFF ormat")],-1)
printHtmlPart(6)
invokeTag('select','g',32,['class':("form-control"),'name':("RDFFormat"),'from':(DB2TriplesJobInstance.constraints.RDFFormat.inList),'value':(DB2TriplesJobInstance?.RDFFormat),'valueMessagePrefix':("DB2TriplesJob.RDFFormat"),'noSelection':(['': ''])],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: DB2TriplesJobInstance, field: 'RDFFormat', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: DB2TriplesJobInstance, field: 'status', 'error'))
printHtmlPart(9)
invokeTag('message','g',38,['code':("DB2TriplesJob.status.label"),'default':("Status")],-1)
printHtmlPart(6)
invokeTag('select','g',40,['class':("form-control"),'name':("status"),'from':(DB2TriplesJobInstance.constraints.status.inList),'value':(DB2TriplesJobInstance?.status),'valueMessagePrefix':("DB2TriplesJob.status"),'noSelection':(['': ''])],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: DB2TriplesJobInstance, field: 'status', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: DB2TriplesJobInstance, field: 'datasource1', 'error'))
printHtmlPart(10)
invokeTag('message','g',46,['code':("DB2TriplesJob.datasource1.label"),'default':("Datasource1")],-1)
printHtmlPart(2)
invokeTag('select','g',48,['class':("many-to-one"),'id':("datasource1"),'name':("datasource1.id"),'from':(com.rdb2lodc.db.DataSource.list()),'optionKey':("id"),'required':(""),'value':(DB2TriplesJobInstance?.datasource1?.id)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: DB2TriplesJobInstance, field: 'datasource1', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: DB2TriplesJobInstance, field: 'r2RML', 'error'))
printHtmlPart(11)
invokeTag('message','g',54,['code':("DB2TriplesJob.r2RML.label"),'default':("R2 RML")],-1)
printHtmlPart(2)
invokeTag('select','g',56,['class':("many-to-one"),'id':("r2RML"),'name':("r2RML.id"),'from':(com.rdb2lodc.jobs.R2RML.list()),'optionKey':("id"),'required':(""),'value':(DB2TriplesJobInstance?.r2RML?.id)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: DB2TriplesJobInstance, field: 'r2RML', 'error'))
printHtmlPart(12)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1417905417000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
