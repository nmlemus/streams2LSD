import com.rdb2lodc.lodc.ESProperties
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDB2LODCloud_ESPropertiesshow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/ESProperties/show.gsp" }
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
invokeTag('set','g',8,['var':("entityName"),'value':(message(code: 'ESProperties.label', default: 'ESProperties'))],-1)
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
invokeTag('message','g',20,['code':("ESProperties.property.label"),'default':("Property")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: ESPropertiesInstance, field: "property"))
printHtmlPart(6)
invokeTag('message','g',27,['code':("ESProperties.prefix.label"),'default':("Prefix")],-1)
printHtmlPart(5)
expressionOut.print(fieldValue(bean: ESPropertiesInstance, field: "prefix"))
printHtmlPart(6)
invokeTag('message','g',34,['code':("ESProperties.externalSorce.label"),'default':("External Sorce")],-1)
printHtmlPart(5)
createTagBody(2, {->
expressionOut.print(ESPropertiesInstance?.externalSorce?.encodeAsHTML())
})
invokeTag('link','g',36,['controller':("externalSource"),'action':("show"),'id':(ESPropertiesInstance?.externalSorce?.id)],2)
printHtmlPart(7)
})
invokeTag('captureBody','sitemesh',44,[:],1)
printHtmlPart(8)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1417845818000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
