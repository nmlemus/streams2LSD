<!DOCTYPE html>
<html>
<head>
    <title id="Description">Responsive Grid layout built with Bootstrap and jQWidgets</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir:'css', file: 'styles/bootstrap.min.css')}">
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir:'css', file: 'styles/bootstrap-theme.min.css')}">
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir:'css', file: 'styles/jqx.base.css')}">
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir:'css', file: 'styles/jqx.bootstrap.css')}">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <g:javascript src="jquery-1.11.1.min.js" />
    <g:javascript src="demos.js"/>
    <g:javascript src="jqxcore.js"/>
    <g:javascript src="jqxbuttons.js"/>
    <g:javascript src="jqxscrollbar.js"/>
    <g:javascript src="jqxlistbox.js"/>
    <g:javascript src="jqxcheckbox.js"/>
    <g:javascript src="jqxtabs.js"/>
    <g:javascript src="jqxmenu.js"/>
    <g:javascript src="jqxgrid.js"/>
    <g:javascript src="jqxgrid.selection.js"/>
    <g:javascript src="jqxdropdownlist.js"/>
    <g:javascript src="jqxdata.js"/>
    <g:javascript src="bootstrap.min.js"/>
    <g:javascript src="jqxexpander.js"/>
    <g:javascript src="jqxvalidator.js"/>
    <g:javascript src="/globalization/globalize.js"/>
    <g:javascript src="jqxcalendar.js"/>
    <g:javascript src="jqxdatetimeinput.js"/>
    <g:javascript src="jqxmaskedinput.js"/>
    <g:javascript src="jqxcombobox.js"/>
    <g:javascript src="jqxinput.js"/>
    <g:javascript src="jqxdata.js"/>
    <g:javascript src="jqxchart.js"/>
    <g:javascript src="jqxdatatable.js"/>
    <g:javascript src="jqxpanel.js"/>

    <style type="text/css">
    body, html {
        height: 100%;
        padding: 0px;
        margin: 0px;
        width: 100%;
        border: none;
        overflow: hidden;
    }
    .required {
        vertical-align: baseline;
        color: red;
        font-size: 10px;
    }
    .control-label {
        white-space: nowrap;
    }
    </style>
</head>
<body class='default'>
<g:render template="/_menu/navbar"/>
<content tag="header">
    <!-- Empty Header -->
</content>

<div >
    <div style="height: 30px;margin-top: 70px; margin-left: 65px; margin-right: 70px; ">

        <div class="form-horizontal col-sm-4" style="height: 100%"></div>
        <div class="form-horizontal col-sm-4" style="height: 100%">
            <h3> Linking Process Configuration </h3>
        </div>
        <div class="form-horizontal col-sm-4" style="height: 100%"></div>
    </div>


    <div style="margin-top: 30px;margin-left: 45px; margin-right: 45px; height:600px; border: 1px solid #d3d3d3 ">

        <div style="min-height: 40px; margin-top: 0px;margin-left: 0px; margin-right: 0px; box-shadow: none; -webkit-box-shadow: none;" class="navbar navbar-default " role="navigation">
            <ul id="myTab" style="min-width: 480px; box-shadow: none; -webkit-box-shadow: none; border: none;" class="nav nav-tabs">
                <li style="margin-left: 20px;" class="active"><a data-tab="billing" href="#billing">LIMES</a></li>
        </ul>
        </div>
        <div style="padding-top: 0px; width: 100%; height: 100%;">
            <div id="billing" class="pane" style="width: 100%; height: 100%; overflow-x: hidden; border: none;">
                <g:uploadForm action="save" class="navbar-form" id="form">
                <%-- Div for the titles target and Sources--%>
                    <div class="form-horizontal" style="height: 30px;">
                        <div class="form-horizontal col-sm-6" style="height: 100%;">
                            <div class="form-horizontal col-sm-6" style="height: 100%;">
                            </div>
                            <div class="form-horizontal col-sm-3" style="height: 100%;">
                                <label style="font-size: larger" >Source:</label>
                            </div>
                            <div class="form-horizontal col-sm-3" style="height: 100%;">
                            </div>
                        </div>
                        <div class="form-horizontal col-sm-6" style="height: 100%;">
                            <div class="form-horizontal col-sm-6" style="height: 100%;">

                            </div>
                            <div class="form-horizontal col-sm-6" style="height: 100%; ">
                                <label style="font-size: larger" >Target:</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-horizontal" style="height: 200px; ">
                        <%-- Div for inputs left (Source)--%>
                        <div class="form-horizontal col-sm-6">
                            <div>
                                <label class="col-sm-4 control-label" for="endpoint">Endpoint</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" placeholder="http://localhost:8890/sparql" id="endpoint" name="endpoint" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="rgraph">Graph</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" placeholder="-1" name="rgraph" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="var">Var</label>
                                <div class="col-sm-8">
                                    <input class="form-control" placeholder="?a" id="var" name="var" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="pagesize">Pagesize</label>
                                <div class="col-sm-8">
                                    <input class="form-control" placeholder="1000" name="pagesize" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="restriction">Restriction</label>
                                <div class="col-sm-8">
                                    <input class="form-control" placeholder="?a rdf:type foaf:name" id="restriction" name="restriction" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="property">Property</label>
                                <div class="col-sm-8">
                                    <input class="form-control" type=text list=property >
                                    <datalist id=property >
                                        <option> rdf:label
                                        <option> foaf:person
                                        <option> dc:title
                                        <option> rdf:type
                                    </datalist>
                                </div>
                            </div>

                        </div>
                        <%-- Div for inputs right (Target)--%>
                        <div class="form-horizontal col-sm-6">
                            <div>
                                <label class="col-sm-4 control-label" for="targetendpoint">Endpoint</label>
                                <div class="col-sm-8">
                                    <input class="form-control" name="targetendpoint" id="targetendpoint" placeholder="http://dbpedia.org/sparql" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="targetrgraph">Graph</label>
                                <div class="col-sm-8">
                                    <input class="form-control" placeholder="-1" name="targetrgraph" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="targetvar">Var</label>
                                <div class="col-sm-8">
                                    <input class="form-control" name="targetvar" id="targetvar" placeholder="?b" maxlength="5" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="targetpagesize">Pagesize</label>
                                <div class="col-sm-8">
                                    <input class="form-control" placeholder="1000" name="targetpagesize" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="targetrestriction">Restriction</label>
                                <div class="col-sm-8">
                                    <input class="form-control" placeholder="?b rdf:type dbpedia-o:Person" id="targetrestriction" name="targetrestriction" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="targetproperty">Property</label>
                                <div class="col-sm-8">
                                    <input class="form-control" type=text list=targetproperty >
                                    <datalist id=targetproperty >
                                        <option> rdf:label
                                        <option> foaf:person
                                        <option> dc:title
                                        <option> rdf:type
                                    </datalist>

                                </div>
                            </div>
                        </div>
                    </div>
                <%-- Div for Metrics--%>
                    <div class="form-horizontal" style="height: 70px; margin-top: 20px">
                        <div class="form-horizontal col-sm-3" style="height: 100%;"></div>
                        <div class="form-horizontal col-sm-6" style="height: 100%; ">

                            <div class="form-horizontal col-sm-2" style="height: 100%; "></div>
                            <div class="form-horizontal col-sm-8" style="height: 100%; ">

                                <div>
                                    <label class="col-sm-4 control-label" for="metric">Metric:</label>
                                    <div class="col-sm-8">
                                        <input class="form-control" type=text list=metric >
                                        <datalist id=metric >
                                            <option> Levenshtein
                                            <option> Euclidean
                                        </datalist>
                                    </div>
                                </div>
                                <div>
                                    <label class="col-sm-4 control-label" for="output">Output:</label>
                                    <div class="col-sm-8">
                                        <input class="form-control" type=text list=output >
                                        <datalist id=output >
                                            <option> TURTLE
                                            <option> RDF/XML
                                            <option> NTRIPLES
                                            <option> N3
                                        </datalist>
                                    </div>
                                </div>


                            </div>
                            <div class="form-horizontal col-sm-2" style="height: 100%;"></div>

                        </div>
                        <div class="form-horizontal col-sm-3" style="height: 100%; "></div>
                    </div>
                    <div class="form-horizontal" style="height: 90px;margin-top: 5px">
                        <div class="form-horizontal col-sm-2" style="height: 100%; "></div>
                        <div class="form-horizontal col-sm-8" style="height: 100%;">
                            <div class="form-horizontal col-sm-1" style="height: 100%;"></div>
                            <div class="form-horizontal col-sm-1" style="height: 100%; "></div>
                            <div class="form-horizontal col-sm-10" style="height: 100%;">

                                <div class="form-horizontal col-sm-6" style="height: 100%;">
                                    <label style="font-size: larger" >Acceptance:</label>
                                    <div>
                                        <label class="col-sm-4 control-label" for="acceptancethreshold">Threshold</label>
                                        <div class="col-sm-8">
                                            <input class="form-control" placeholder="0.9" id="acceptancethreshold" name="acceptancethreshold" value="" />
                                        </div>
                                    </div>
                                    <div>
                                        <label class="col-sm-4 control-label" for="acceptancerelation">Relation</label>
                                        <div class="col-sm-8">
                                            <input class="form-control" placeholder="owl:sameAs" id="acceptancerelation" name="acceptancerelation" value="" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-horizontal col-sm-6" style="height: 100%;">
                                    <label style="font-size: larger" >Review:</label>
                                    <div>
                                        <label class="col-sm-4 control-label" for="reviewthreshold">Threshold</label>
                                        <div class="col-sm-8">
                                            <input class="form-control" placeholder="0.9" id="reviewthreshold" name="reviewthreshold" value="" />
                                        </div>
                                    </div>
                                    <div>
                                        <label class="col-sm-4 control-label" for="reviewrelation">Relation</label>
                                        <div class="col-sm-8">
                                            <input class="form-control" placeholder="owl:sameAs" id="reviewrelation" name="reviewrelation" value="" />
                                        </div>
                                    </div>
                                </div>


                            </div>

                        </div>
                        <div class="form-horizontal col-sm-2" style="height: 100%; "></div>
                    </div>

                    <div class="form-horizontal col-sm-6"></div>
                    <div class="form-horizontal col-sm-6">
                        <div>
                            <div class="col-sm-8">
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <g:submitButton name="create" class="btn btn-primary" id="startButton" value="${message(code: 'default.button.noel.label', default: 'Run Job')}" />
                            </div><!-- /.col-lg-6 -->

                            <div class="col-sm-8">

                            </div>
                        </div>

                    </div>

                </g:uploadForm>
            </div>
            <div id="fitness" class="pane" style="width: 100%; height: 100%; overflow: hidden; border: none;">
                <div id='chart' style="width: 100%; height: 100%">
                </div>
            </div>
            <div id="employee" style="width: 100%; height: 100%;" class="pane">
                <div style="border: none;" id='dataTable'></div>
            </div>
            <div id="mytable" style="width: 100%; height: 100%;" class="pane">
                <div style="border: none;" id='dataTable1'></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>