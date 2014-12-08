import com.rdb2lodc.jobs.DB2TriplesJob
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDB2LODCloud_DB2TriplesJobedit_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/DB2TriplesJob/edit.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',6,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("layout"),'content':("kickstart")],-1)
printHtmlPart(1)
invokeTag('set','g',7,['var':("entityName"),'value':(message(code: 'DB2TriplesJob.label', default: 'DB2TriplesJob'))],-1)
printHtmlPart(1)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('message','g',8,['code':("default.edit.label"),'args':([entityName])],-1)
})
invokeTag('captureTitle','sitemesh',8,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',8,[:],2)
printHtmlPart(2)
})
invokeTag('captureHead','sitemesh',9,[:],1)
printHtmlPart(3)
createTagBody(1, {->
printHtmlPart(4)
createTagBody(2, {->
printHtmlPart(5)
invokeTag('renderErrors','g',17,['bean':(DB2TriplesJobInstance),'as':("list")],-1)
printHtmlPart(6)
})
invokeTag('hasErrors','g',19,['bean':(DB2TriplesJobInstance)],2)
printHtmlPart(7)
createTagBody(2, {->
printHtmlPart(8)
invokeTag('hiddenField','g',22,['name':("id"),'value':(DB2TriplesJobInstance?.id)],-1)
printHtmlPart(8)
invokeTag('hiddenField','g',23,['name':("version"),'value':(DB2TriplesJobInstance?.version)],-1)
printHtmlPart(8)
invokeTag('hiddenField','g',24,['name':("_method"),'value':("PUT")],-1)
printHtmlPart(9)
invokeTag('render','g',26,['template':("form")],-1)
printHtmlPart(10)
invokeTag('actionSubmit','g',29,['class':("btn btn-primary"),'action':("update"),'value':(message(code: 'default.button.update.label', default: 'Update'))],-1)
printHtmlPart(11)
invokeTag('message','g',30,['code':("default.button.reset.label"),'default':("Reset")],-1)
printHtmlPart(12)
})
invokeTag('form','g',32,['method':("post"),'class':("form-horizontal"),'role':("form")],2)
printHtmlPart(13)
})
invokeTag('captureBody','sitemesh',36,[:],1)
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
