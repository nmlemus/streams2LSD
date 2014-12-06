<%--
  Created by IntelliJ IDEA.
  User: indira
  Date: 03/12/2014
  Time: 17:07
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="kickstart" />
    <g:set var="layout_nomainmenu"		value="${true}" scope="request"/>
    <g:set var="layout_nosecondarymenu"	value="${true}" scope="request"/>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>ListBox</title>

    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir:'css', file: 'styles/bootstrap.min.css')}">
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir:'css', file: 'styles/bootstrap-theme.min.css')}">
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir:'css', file: 'styles/jqx.base.css')}">
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir:'css', file: 'styles/jqx.bootstrap.css')}">

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
</head>

<body>

    <script type="text/javascript">
        $(document).ready(function() {

            var sourcelistbox1 = [
                "DBPedia",
                "DBLP",
                "DOI System",
                "Geonames",
                "LOV",
                "Freebase",
                "Nobel Prizes"
            ];

            // Create jqxListBox
            $("#lstBox1").jqxListBox({ source: sourcelistbox1, multiple: true, width: 400, height: 200});
            $("#lstBox2").jqxListBox({  multiple: true, width: 400, height: 200});


           $('#btnRight').click(function(e) {
               var selectedOpts = $("#lstBox1").jqxListBox('getSelectedItems');
                  if (selectedOpts.length == 0) {
                    alert("Nothing to move.");
                    e.preventDefault();
                  }

                   $.each(selectedOpts, function () {
                       $("#lstBox2").jqxListBox('addItem', { label: this.label });
                       $("#lstBox1").jqxListBox('removeItem', this);
                       //$("#lstBox1").jqxListBox('selectable', false);

                   });
               $("#lstBox1").jqxListBox('clearSelection', true);

              /*for(var i = 0; i< selectedOpts.length; i++){
                   $("#lstBox2").jqxListBox('addItem', selectedOpts[i].label )   ;

               }*/

            });

            $('#btnLeft').click(function(e) {
                var selectedOpts = $("#lstBox2").jqxListBox('getSelectedItems');
                if (selectedOpts.length == 0) {
                    alert("Nothing to move.");
                    e.preventDefault();
                }

                $.each(selectedOpts, function () {
                    $("#lstBox1").jqxListBox('addItem', { label: this.label });
                    $("#lstBox2").jqxListBox('removeItem', this);
                    //$("#lstBox1").jqxListBox('selectable', false);

                });
                $("#lstBox2").jqxListBox('clearSelection', true);


            });



           $('#btnaccept').on('click', function () {
                //array to get all values of listbox
                var allItems = $("#lstBox2").jqxListBox('getItems');
                //delete the initial tab
               //dame el indice del tab que tiene este titulo
               var titulo = "Configuration Links betweem Internal and External Data Sources";
               var value = $("#jqxTabs").jqxTabs('val', titulo);
                $('#jqxTabs').jqxTabs('removeAt',value);

                var numberoftabs = $('#jqxTabs').jqxTabs('length');

                //new title(numberoftabs); // title = {};

                var title = new Array(numberoftabs);
                for (var j = 0;  j< numberoftabs; j++) {
                     title[j] = $('#jqxTabs').jqxTabs('getTitleAt', j);
                }

                //funcion para adicionar los tabs que ya no estén
                for(var i = 0; i< allItems.length; i++){
                   //var title = $("#lstBox2").jqxTabs('addItem', allItems[i].label )   ;
                    //verify if the tab is already exist

                   var k=0;
                   while (allItems[i].label != title[k] && k<= numberoftabs) {
                        k++;
                    }
                    if (k>numberoftabs) {
                     //adicionar el nuevo DataSources
                        $('#jqxTabs').jqxTabs('addLast', allItems[i].label, '  ');
                        //aqui hay que meterle el contenido al tab
                       // $('#jqxTabs').jqxTabs({ width: 600, height: 560,  initTabContent: initWidgets });
                        $('#jqxTabs').jqxTabs('ensureVisible', -1);
                    }
                 }

            });
            //$('#btnaccept').disable();

             $('#jqxTabs').jqxTabs({ width: 950} );

            $('#jqxTabs').jqxTabs({ scrollPosition: 'both' });

      });

    </script>




<div align="center" style="vertical-align:top; margin-top: 70px" >
    <table style='width:900px;height: 300px; ;'>
        <tbody>
        <tr>
            <td style='width:430px; height: 200px '>
                <b>Recomended External Sources:</b><br/>
                <div id='lstBox1'>
                </div>
            </td>
            <td style='width:80px;text-align:center;vertical-align:middle;'>
                <input type='button' id='btnRight' value ='  >  '/>
                <br/><input type='button' id='btnLeft' value ='  <  '/>
            </td>
            <td style='width:430px; height: 200px'>
                <b>Selected External Datasources:      </b><br/>
                <div id='lstBox2'>
                </div>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>

            <td>
                <p align="right">
                    <input type="button" id='btnaccept' value =' Accept '/>
                </p>

            </td>
        </tr>
        </tbody>
    </table>
</div>



<div>
    <table align="center" width="950px">
        <td height="1000px" width="950px" valign="top" align="center" >

            <div id='jqxWidget'>
                <div  id='jqxTabs'style="border: 1px solid darkgray;height: 600px;"  >
                    <ul style="margin-left: 30px;">


                        <li id= 'firsttab'>
                            <b>Configuration Links betweem Internal and External Data Sources</b>
                        </li>

                    </ul>



                    <div>
                       Please select the external data sources to do the linking and after configure the process here
                    </div>


                </div>
            </div>
        </td>


    </table>
</div>


</body>
</html>