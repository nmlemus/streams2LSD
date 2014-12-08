import com.rdb2lodc.lodc.ESProperties
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_RDB2LODCloud_ESProperties_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/ESProperties/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: ESPropertiesInstance, field: 'property', 'error'))
printHtmlPart(1)
invokeTag('message','g',6,['code':("ESProperties.property.label"),'default':("Property")],-1)
printHtmlPart(2)
invokeTag('textField','g',8,['class':("form-control"),'name':("property"),'required':(""),'value':(ESPropertiesInstance?.property)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: ESPropertiesInstance, field: 'property', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: ESPropertiesInstance, field: 'prefix', 'error'))
printHtmlPart(5)
invokeTag('message','g',14,['code':("ESProperties.prefix.label"),'default':("Prefix")],-1)
printHtmlPart(2)
invokeTag('textField','g',16,['class':("form-control"),'name':("prefix"),'required':(""),'value':(ESPropertiesInstance?.prefix)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: ESPropertiesInstance, field: 'prefix', 'error'))
printHtmlPart(4)
expressionOut.print(hasErrors(bean: ESPropertiesInstance, field: 'externalSorce', 'error'))
printHtmlPart(6)
invokeTag('message','g',22,['code':("ESProperties.externalSorce.label"),'default':("External Sorce")],-1)
printHtmlPart(2)
invokeTag('select','g',24,['class':("many-to-one"),'id':("externalSorce"),'name':("externalSorce.id"),'from':(com.rdb2lodc.lodc.ExternalSource.list()),'optionKey':("id"),'required':(""),'value':(ESPropertiesInstance?.externalSorce?.id)],-1)
printHtmlPart(3)
expressionOut.print(hasErrors(bean: ESPropertiesInstance, field: 'externalSorce', 'error'))
printHtmlPart(7)
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
