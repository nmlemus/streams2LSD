<%@ page import="com.rdb2lodc.jobs.LimesJob" %>



<div class="${hasErrors(bean: limesJobInstance, field: 'acceptanceRelation', 'error')} ">
    <label for="acceptanceRelation" class="control-label"><g:message code="limesJob.acceptanceRelation.label"
                                                                     default="Acceptance Relation"/></label>

    <div>
        <g:textField class="form-control" name="acceptanceRelation" value="${limesJobInstance?.acceptanceRelation}"/>
        <span class="help-inline">${hasErrors(bean: limesJobInstance, field: 'acceptanceRelation', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: limesJobInstance, field: 'acceptanceTheshold', 'error')} required">
    <label for="acceptanceTheshold" class="control-label"><g:message code="limesJob.acceptanceTheshold.label"
                                                                     default="Acceptance Theshold"/><span
            class="required-indicator">*</span></label>

    <div>
        <g:field class="form-control" name="acceptanceTheshold"
                 value="${fieldValue(bean: limesJobInstance, field: 'acceptanceTheshold')}" required=""/>
        <span class="help-inline">${hasErrors(bean: limesJobInstance, field: 'acceptanceTheshold', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: limesJobInstance, field: 'metric', 'error')} ">
    <label for="metric" class="control-label"><g:message code="limesJob.metric.label" default="Metric"/></label>

    <div>
        <g:textField class="form-control" name="metric" value="${limesJobInstance?.metric}"/>
        <span class="help-inline">${hasErrors(bean: limesJobInstance, field: 'metric', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: limesJobInstance, field: 'outputFormat', 'error')} ">
    <label for="outputFormat" class="control-label"><g:message code="limesJob.outputFormat.label"
                                                               default="Output Format"/></label>

    <div>
        <g:textField class="form-control" name="outputFormat" value="${limesJobInstance?.outputFormat}"/>
        <span class="help-inline">${hasErrors(bean: limesJobInstance, field: 'outputFormat', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: limesJobInstance, field: 'reviewRelation', 'error')} ">
    <label for="reviewRelation" class="control-label"><g:message code="limesJob.reviewRelation.label"
                                                                 default="Review Relation"/></label>

    <div>
        <g:textField class="form-control" name="reviewRelation" value="${limesJobInstance?.reviewRelation}"/>
        <span class="help-inline">${hasErrors(bean: limesJobInstance, field: 'reviewRelation', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: limesJobInstance, field: 'reviewTheshold', 'error')} required">
    <label for="reviewTheshold" class="control-label"><g:message code="limesJob.reviewTheshold.label"
                                                                 default="Review Theshold"/><span
            class="required-indicator">*</span></label>

    <div>
        <g:field class="form-control" name="reviewTheshold"
                 value="${fieldValue(bean: limesJobInstance, field: 'reviewTheshold')}" required=""/>
        <span class="help-inline">${hasErrors(bean: limesJobInstance, field: 'reviewTheshold', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: limesJobInstance, field: 'source', 'error')} required">
    <label for="source" class="control-label"><g:message code="limesJob.source.label" default="Source"/><span
            class="required-indicator">*</span></label>

    <div>
        <g:select class="form-control" id="source" name="source.id" from="${com.rdb2lodc.jobs.LimesSource.list()}"
                  optionKey="id" required="" value="${limesJobInstance?.source?.id}" class="many-to-one"/>
        <span class="help-inline">${hasErrors(bean: limesJobInstance, field: 'source', 'error')}</span>
    </div>
</div>

<div class="${hasErrors(bean: limesJobInstance, field: 'target', 'error')} required">
    <label for="target" class="control-label"><g:message code="limesJob.target.label" default="Target"/><span
            class="required-indicator">*</span></label>

    <div>
        <g:select class="form-control" id="target" name="target.id" from="${com.rdb2lodc.jobs.LimesSource.list()}"
                  optionKey="id" required="" value="${limesJobInstance?.target?.id}" class="many-to-one"/>
        <span class="help-inline">${hasErrors(bean: limesJobInstance, field: 'target', 'error')}</span>
    </div>
</div>

