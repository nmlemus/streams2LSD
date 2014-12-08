import com.rdb2lodc.jobs.DB2TriplesJob
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDB2LODCloud_DB2TriplesJobindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/DB2TriplesJob/index.gsp" }
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
invokeTag('message','g',9,['code':("default.index.label"),'args':([entityName])],-1)
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
invokeTag('sortableColumn','g',20,['property':("db2triplesJob_name"),'title':(message(code: 'DB2TriplesJob.db2triplesJob_name.label', default: 'Db2triples Jobname'))],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',22,['property':("mode"),'title':(message(code: 'DB2TriplesJob.mode.label', default: 'Mode'))],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',24,['property':("baseURI"),'title':(message(code: 'DB2TriplesJob.baseURI.label', default: 'Base URI'))],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',26,['property':("RDFFormat"),'title':(message(code: 'DB2TriplesJob.RDFFormat.label', default: 'RDFF ormat'))],-1)
printHtmlPart(5)
invokeTag('sortableColumn','g',28,['property':("status"),'title':(message(code: 'DB2TriplesJob.status.label', default: 'Status'))],-1)
printHtmlPart(6)
invokeTag('message','g',30,['code':("DB2TriplesJob.datasource1.label"),'default':("Datasource1")],-1)
printHtmlPart(7)
loop:{
int i = 0
for( DB2TriplesJobInstance in (DB2TriplesJobInstanceList) ) {
printHtmlPart(8)
expressionOut.print((i % 2) == 0 ? 'odd' : 'even')
printHtmlPart(9)
createTagBody(3, {->
expressionOut.print(fieldValue(bean: DB2TriplesJobInstance, field: "db2triplesJob_name"))
})
invokeTag('link','g',38,['action':("show"),'id':(DB2TriplesJobInstance.id)],3)
printHtmlPart(10)
expressionOut.print(fieldValue(bean: DB2TriplesJobInstance, field: "mode"))
printHtmlPart(10)
expressionOut.print(fieldValue(bean: DB2TriplesJobInstance, field: "baseURI"))
printHtmlPart(10)
expressionOut.print(fieldValue(bean: DB2TriplesJobInstance, field: "RDFFormat"))
printHtmlPart(10)
expressionOut.print(fieldValue(bean: DB2TriplesJobInstance, field: "status"))
printHtmlPart(10)
expressionOut.print(fieldValue(bean: DB2TriplesJobInstance, field: "datasource1"))
printHtmlPart(11)
i++
}
}
printHtmlPart(12)
invokeTag('paginate','bs',55,['total':(DB2TriplesJobInstanceCount)],-1)
printHtmlPart(13)
})
invokeTag('captureBody','sitemesh',59,[:],1)
printHtmlPart(14)
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
