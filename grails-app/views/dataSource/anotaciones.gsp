<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Lista de Autores</title>

    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir:'css', file: 'ui.jqgrid.css')}">
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir: 'css', file:'ui-lightness/jquery-ui.theme.css')}">
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir: 'css', file: 'ui.multiselect.css')}"/>


    <g:javascript src="jquery-1.11.0.min.js" />
    <g:javascript src="i18n/grid.locale-en.js" />
    <g:javascript src="jquery.jqGrid.min.js" />
    <g:javascript src="jquery-ui.min.js" />
    <g:javascript src="ui.multiselect.js"/>

    <style>
    html, body {
        margin: 0;
        padding: 0;
        font-size: 75%;
    }
    #page-body {
        margin: 2em 10em 1.25em 30em;
    }
    </style>

    <script>

        // TODO Insertar datos desde JSON
        var datasources = [
            {id:"1",DataBase:"KDDCup2013",Host:"localhost",Port:"5432",Description:"Autores paper conferences"},
            {id:"2",DataBase:"DVDRental",Host:"10.32.12.22",Port:"5432",Description:"Venta de DVD"},
            {id:"3",DataBase:"LabOlimpico",Host:"10.32.12.22",Port:"5432",Description:"Laboratorio Olimpico"},
            {id:"4",DataBase:"Pets",Host:"10.32.12.142",Port:"5432",Description:"Mascotas"},
            {id:"5",DataBase:"Lojas Americanas",Host:"10.32.12.142",Port:"5432",Description:"Cadena de tiendas Brasil"},
            {id:"6",DataBase:"Diabetes Diseases",Host:"localhost",Port:"5432",Description:"enfermos con diabetes"}

        ];

        var tables = [
            {id:"1",DataBase:"KDDCup2013", Table:"Autor", Atributo:"nombre",tipo:"string", vocabulario:"", Property:""},
            {id:"2",DataBase:"KDDCup2013", Table:"Autor", Atributo:"ano",tipo:"int", vocabulario:"", Property:""},
            {id:"3",DataBase:"KDDCup2013", Table:"Book", Atributo:"titulo",tipo:"string", vocabulario:"", Property:""},
            {id:"4",DataBase:"KDDCup2013", Table:"Book", Atributo:"editor",tipo:"string", vocabulario:"", Property:""}
        ];

        var lastsel3;
        $(document).ready(function(){

            jQuery("#list10").jqGrid({
                height: 'auto',
                width: 800,
                data: datasources,
                datatype: "local",
                colNames:['No','Data Base Name','Description', 'Host','Port'],
                colModel:[
                    {name:'id',index:'id', width:55, sorttype: 'int', hidden: true },
                    {name:'DataBase',index:'DataBase', width:90},
                    {name:'Description',index:'Description', width:80,align:"right"},
                    {name:'Host',index:'Host', width:100},
                    {name:'Port',index:'Port', width:80, align:"right"}

                   ],
                rowNum:10,
                rowList:[10,20,30],
                pager: '#pager10',
                sortname: 'id',
                viewrecords: true,
                sortorder: "asc",
                multiselect:false,
                caption: "Data Sources",
                //Función para pasar los datos de un row para abajo
                onSelectRow: function(ids) {
                    if(ids == null) {
                        ids=0;
                        if(jQuery("#list10_d").jqGrid('getGridParam','records') >0 )
                        {
                            //jQuery("#list10_d").jqGrid('setGridParam',{url:"subgrid.php?q=1&id="+ids,page:1});
                            var id = jQuery("#list10").jqGrid('getGridParam','selrow');
                            if (id)	{
                                var ret = jQuery("#list10").jqGrid('getRowData',id);
                                jQuery("#list10_d").jqGrid('setCaption',"Tables of: "+ret.DataBase).trigger('reloadGrid');
                                }
                            else { alert("Please select row");}
                        }
                    }
                    else {
                            //jQuery("#list10_d").jqGrid('setGridParam',{url:"subgrid.php?q=1&id="+ids,page:1});
                            var id = jQuery("#list10").jqGrid('getGridParam','selrow');
                            if (id)	{
                                var ret = jQuery("#list10").jqGrid('getRowData',id);
                                jQuery("#list10_d").jqGrid('setCaption',"Tables of: "+ret.DataBase).trigger('reloadGrid');
                            }
                            else {alert("Please select row");}


                        //-------------------
                       // jQuery("#list10_d").jqGrid('setCaption',"Tables: "+ids.DataBase).trigger('reloadGrid');
                    }
                }
            });

            jQuery("#list10").jqGrid('navGrid','#pager10',{add:false,edit:false,del:false});

            //the second grid with the information of each datasources
            jQuery("#list10_d").jqGrid({
                height: 'auto',
                width: 800,
                data: tables,
                datatype: "local",
                colNames:[ 'Table','Atributo','Tipo', 'Annotate','Vocabulary', 'Property'],
                colModel:[
                    //{name:'DataBase',index:'DataBase', width:55},
                  //  {name:'id',index:'id', width:180},
                    {name:'Table',index:'Table', width:50, align:"center"},
                    {name:'Atributo',index:'Atributo', width:50, align:"center"},
                    {name:'tipo',index:'tipo', width:50,align:"center", sortable:false, search:true},

                    {name: 'annotate', index: 'annotate',width: 40, align:"center", editable: true, edittype: 'checkbox', editoptions: { value: "True:False" },
                        formatter: "checkbox", formatoptions: { disabled: false}},
                    {name: 'vocabulario', index:'Vocabulary', width: 80, align: "center", editable: true,formatter:"selectmenu",edittype:"select", editoptions:{value:"DC:Dublin Core;FOAF:Foaf;SKOS:Skos"}},
                    {name: 'Property', index:'Property', width: 80, align: "center",editable: true, edittype:"select", editoptions:{value:"P1:Property1;P2:Property2;P3:Property3"}},

                ],
                rowNum:10,
                rowList:[10, 20,30],
                pager: '#pager10_d',
                sortname: 'id',
                viewrecords: true,
                sortorder: "asc",
                gridview: true,
                multiselect:false,
                grouping:true,
                groupingView : {
                    groupField : ['Table'],
                    groupColumnShow : [false]
                },
                //funcion para editar los campos cada vez que me paro en las columnas
                onSelectRow: function(id){
                    if(id && id!==lastsel3){
                        jQuery('#list10_d').jqGrid('restoreRow',lastsel3);
                        jQuery('#list10_d').jqGrid('editRow',id,true/*,pickdates*/);
                        lastsel3=id;
                    }
                },
                //editurl: "server.php",
                caption:"Tables"

        }).navGrid('#pager10_d',{add:true,edit:true,del:true});


         //leyendo los datos de un xml
            jQuery("#list1").jqGrid({
                url:'server.php?q=1',
                datatype: "xml",
                colNames:['Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'],
                colModel:[
                    {name:'id',index:'id', width:75},
                    {name:'invdate',index:'invdate', width:90},
                    {name:'name',index:'name', width:100},
                    {name:'amount',index:'amount', width:80, align:"right"},
                    {name:'tax',index:'tax', width:80, align:"right"},
                    {name:'total',index:'total', width:80,align:"right"},
                    {name:'note',index:'note', width:150, sortable:false}
                ],
                rowNum:10,
                autowidth: true,
                rowList:[10,20,30],
                pager: jQuery('#pager1'),
                sortname: 'id',
                viewrecords: true,
                sortorder: "desc",
                caption:"XML Example"
            }).navGrid('#pager1',{edit:false,add:false,del:false});



        });




    </script>


</head>
<body>

<div id="page-body" role="main">

    <table id="list10"></table>
    <div id="plist10" style="align-content: center"></div>
    <br />
    <table id="list10_d"></table>
    <div id="pager10_d" style="align-content: center"></div>

</div>



</body>
</html>