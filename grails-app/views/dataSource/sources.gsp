<%@ page import="com.rdb2lodc.db.DataSource" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>My First Grid</title>


    <link rel="stylesheet" href="${resource(dir:'css',file:'ui.jqgrid.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir:'css/ui-lightness',file:'jquery-ui.theme.css')}"type="text/css">
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir: 'css', file: 'ui.multiselect.css')}"/>


    <g:javascript src="jquery-1.11.0.min.js" />
    <g:javascript src="i18n/grid.locale-en.js" />
    <g:javascript src="jquery.jqGrid.min.js" />
    <g:javascript src="jquery-ui.min.js" />
    <g:javascript src="ui.multiselect.js"/>

    <style>
    #page-body {
        margin: 2em 10em 1.25em 6em;
    }
    </style>


    <script>


        $(document).ready(function () {
            jQuery("#list10").jqGrid({
                url:'dataSources',
                datatype: "json",
                height: 'auto',
                rowNum: 30,
                width: 700,
                rowList: [10,20,30],
                colNames:['Id', 'Data Source','Type', 'Host', 'Port'],
                colModel:[
                    {name: 'Id', index: 'Id', hidden: true},
                    {name:'DataBase', index:'DataBase', width: 80},
                    {name:'Type', width: 80},
                    {name:'Host', width: 50},
                    {name:'Port', width: 50},


                ],
                pager: "#plist10",
                viewrecords: true,
                sortname: 'DataBase',
                sortorder: "asc",
                grouping: true,
                groupingView : {
                    groupField : ['Type']
                },
                caption: "Data Sources",
                //Función para pasar los datos de un row para abajo
                onSelectRow: function(ids) {
                    if (ids == null) {
                        ids = 0;
                        if (jQuery("#list10_d").jqGrid('getGridParam', 'records') > 0) {
                            var id = jQuery("#list10").jqGrid('getGridParam', 'selrow');
                            if (id) {
                                var ret = jQuery("#list10").jqGrid('getRowData', id);
                                jQuery("#list10_d").jqGrid('setGridParam',{url:"dataSourceTables/"+ret.Id});
                                jQuery("#list10_d").jqGrid('setCaption', "Tables of: " + ret.DataBase).trigger('reloadGrid');
                            }
                            else {
                                alert("Please select row");
                            }
                        }
                    }
                    else {

                        var id = jQuery("#list10").jqGrid('getGridParam','selrow');
                        if (id)	{
                            var ret = jQuery("#list10").jqGrid('getRowData',id);
                            jQuery("#list10_d").jqGrid('setGridParam',{url:"dataSourceTables/"+ret.Id});
                            jQuery("#list10_d").jqGrid('setCaption',ret.DataBase).trigger('reloadGrid');
                        }
                        else {alert("Please select row");}

                    }


                }
            });
        });


        jQuery("#list10").jqGrid('navGrid','#plist10',{add:false,edit:false,del:false});

        //the second grid with the information of each datasources
        $(document).ready(function () {
            jQuery("#list10_d").jqGrid({
                height: 'auto',
                width: 700,
                url:'dataSourceTables/165',
                datatype: "json",

                colNames: ['Tables', 'Column Name', 'Type'],
                colModel: [
                    //{name:'DataBase',index:'DataBase', width:55},
                    //  {name:'id',index:'id', width:180},
                    {name: 'tabla_name', index: 'table_name', align: "left"},
                    {name: 'cl_name', index: 'cl_name', align: "left"},
                    {name: 'cl_type', index: 'cl_type', width: 50, align: "center", sortable: false, search: true}
                ],
                rowNum: 10,
                colNum: 4,
                rowList: [10, 20, 30],
                pager: '#pager10_d',
                sortname: 'table_name',
                viewrecords: true,
                sortorder: "asc",
                gridview: true,
                multiselect: false,
                caption: "Tables"

            }).navGrid('#pager10_d', {add: true, edit: true, del: true});
        });

    </script>

</head>
<body>
<a href="#show-dataSource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>


<div id="page-body" role="main">
    <table id="list10"></table>
    <div id="plist10" style="align-content: center"></div>
    <br/>
    <table id="list10_d"></table>
    <div id="plist10_d" style="align-content: center"></div>
</div>

</body>
</html>