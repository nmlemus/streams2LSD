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


<script type="text/javascript">
    $(document).ready(function () {
        // set jQWidgets Theme to "Bootstrap"
        $.jqx.theme = "bootstrap";

        // Create Vertical ScrollBar
        /* $("#jqxverticalscrollbar").jqxScrollBar({ width: 18, height:400, vertical: true, align:  )};

         // Trigger the 'valuechanged' event.
         $("#jqxverticalscrollbar").bind('valuechanged', function (event) {
         $('#VerticalDiv').html('Vertical (' + parseInt(event.currentValue) + ')');
         });*/
        //Create a main panel
        $("#jqxmainpanel").jqxPanel({ width:'100%', height: '100%'});

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
        $("#lstBox1").jqxListBox({ source: sourcelistbox1, multiple: true, width: 380, height: 200});
        $("#lstBox2").jqxListBox({  multiple: true, width: 380, height: 200});



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





        $('#btnAccept').on('click', function () {
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

        // Create a button
        $('#btnLeft').jqxButton({ height: 25 });
        $('#btnRight').jqxButton({ height: 25 });
        $('#btnAccept').jqxButton({ height: 25 });
        $('#startButton').jqxButton({ height: 25 });


        // create jqxInput widget.
        $('input').jqxInput({ height: 22, width: '100%' });
        $('input').css('margin-top', '5px');
        // create countries array for the Countries ComboBox.
        var countries = [
            { value: "AF", label: "Afghanistan" },
            { value: "AL", label: "Albania" },
            { value: "DZ", label: "Algeria" },
            { value: "AS", label: "American Samoa" },
            { value: "AD", label: "Andorra" },
            { value: "AO", label: "Angola" },
            { value: "AI", label: "Anguilla" },
            { value: "AQ", label: "Antarctica" },
            { value: "AG", label: "Antigua and Barbuda" },
            { value: "AR", label: "Argentina" },
            { value: "AM", label: "Armenia" },
            { value: "AW", label: "Aruba" },
            { value: "AU", label: "Australia" },
            { value: "AT", label: "Austria" },
            { value: "AZ", label: "Azerbaijan" },
            { value: "BS", label: "Bahamas" },
            { value: "BH", label: "Bahrain" },
            { value: "BD", label: "Bangladesh" },
            { value: "BB", label: "Barbados" },
            { value: "BY", label: "Belarus" },
            { value: "BE", label: "Belgium" },
            { value: "BZ", label: "Belize" },
            { value: "BJ", label: "Benin" },
            { value: "BM", label: "Bermuda" },
            { value: "BT", label: "Bhutan" },
            { value: "BO", label: "Bolivia" },
            { value: "BA", label: "Bosnia and Herzegovina" },
            { value: "BW", label: "Botswana" },
            { value: "BV", label: "Bouvet Island" },
            { value: "BR", label: "Brazil" },
            { value: "BN", label: "Brunei" },
            { value: "BG", label: "Bulgaria" },
            { value: "BF", label: "Burkina Faso" },
            { value: "BI", label: "Burundi" },
            { value: "KH", label: "Cambodia" },
            { value: "CM", label: "Cameroon" },
            { value: "CA", label: "Canada" },
            { value: "CV", label: "Cape Verde" },
            { value: "KY", label: "Cayman Islands" },
            { value: "CF", label: "Central African Republic" },
            { value: "TD", label: "Chad" },
            { value: "CL", label: "Chile" },
            { value: "CN", label: "China" },
            { value: "CX", label: "Christmas Island" },
            { value: "CC", label: "Cocos (Keeling) Islands" },
            { value: "CO", label: "Columbia" },
            { value: "KM", label: "Comoros" },
            { value: "CG", label: "Congo" },
            { value: "CK", label: "Cook Islands" },
            { value: "CR", label: "Costa Rica" },
            { value: "CI", label: "Cote D'Ivorie" },
            { value: "HR", label: "Croatia (Hrvatska)" },
            { value: "CU", label: "Cuba" },
            { value: "CY", label: "Cyprus" },
            { value: "CZ", label: "Czech Republic" },
            { value: "DK", label: "Denmark" },
            { value: "DJ", label: "Djibouti" },
            { value: "DM", label: "Dominica" },
            { value: "DO", label: "Dominican Republic" },
            { value: "TP", label: "East Timor" },
            { value: "EC", label: "Ecuador" },
            { value: "EG", label: "Egypt" },
            { value: "SV", label: "El Salvador" },
            { value: "GQ", label: "Equatorial Guinea" },
            { value: "ER", label: "Eritrea" },
            { value: "EE", label: "Estonia" },
            { value: "ET", label: "Ethiopia" },
            { value: "FO", label: "Faroe Islands" },
            { value: "FJ", label: "Fiji" },
            { value: "FI", label: "Finland" },
            { value: "FR", label: "France" },
            { value: "GF", label: "French Guinea" },
            { value: "PF", label: "French Polynesia" },
            { value: "GA", label: "Gabon" },
            { value: "GM", label: "Gambia" },
            { value: "GE", label: "Georgia" },
            { value: "DE", label: "Germany" },
            { value: "GH", label: "Ghana" },
            { value: "GI", label: "Gibraltar" },
            { value: "GR", label: "Greece" },
            { value: "GL", label: "Greenland" },
            { value: "GD", label: "Grenada" },
            { value: "GP", label: "Guadeloupe" },
            { value: "GU", label: "Guam" },
            { value: "GT", label: "Guatemala" },
            { value: "GN", label: "Guinea" },
            { value: "GW", label: "Guinea-Bissau" },
            { value: "GY", label: "Guyana" },
            { value: "HT", label: "Haiti" },
            { value: "HN", label: "Honduras" },
            { value: "HK", label: "Hong Kong" },
            { value: "HU", label: "Hungary" },
            { value: "IS", label: "Iceland" },
            { value: "IN", label: "India" },
            { value: "ID", label: "Indonesia" },
            { value: "IR", label: "Iran" },
            { value: "IQ", label: "Iraq" },
            { value: "IE", label: "Ireland" },
            { value: "IL", label: "Israel" },
            { value: "IT", label: "Italy" },
            { value: "JM", label: "Jamaica" },
            { value: "JP", label: "Japan" },
            { value: "JO", label: "Jordan" },
            { value: "KZ", label: "Kazakhstan" },
            { value: "KE", label: "Kenya" },
            { value: "KI", label: "Kiribati" },
            { value: "KW", label: "Kuwait" },
            { value: "KG", label: "Kyrgyzstan" },
            { value: "LA", label: "Laos" },
            { value: "LV", label: "Latvia" },
            { value: "LB", label: "Lebanon" },
            { value: "LS", label: "Lesotho" },
            { value: "LR", label: "Liberia" },
            { value: "LY", label: "Libya" },
            { value: "LI", label: "Liechtenstein" },
            { value: "LT", label: "Lithuania" },
            { value: "LU", label: "Luxembourg" },
            { value: "MO", label: "Macau" },
            { value: "MK", label: "Macedonia" },
            { value: "MG", label: "Madagascar" },
            { value: "MW", label: "Malawi" },
            { value: "MY", label: "Malaysia" },
            { value: "MV", label: "Maldives" },
            { value: "ML", label: "Mali" },
            { value: "MT", label: "Malta" },
            { value: "MH", label: "Marshall Islands" },
            { value: "MQ", label: "Martinique" },
            { value: "MR", label: "Mauritania" },
            { value: "MU", label: "Mauritius" },
            { value: "YT", label: "Mayotte" },
            { value: "MX", label: "Mexico" },
            { value: "FM", label: "Micronesia" },
            { value: "MD", label: "Moldova" },
            { value: "MC", label: "Monaco" },
            { value: "MN", label: "Mongolia" },
            { value: "MS", label: "Montserrat" },
            { value: "MA", label: "Morocco" },
            { value: "MZ", label: "Mozambique" },
            { value: "MM", label: "Myanmar (Burma)" },
            { value: "NA", label: "Namibia" },
            { value: "NR", label: "Nauru" },
            { value: "NP", label: "Nepal" },
            { value: "NL", label: "Netherlands" },
            { value: "AN", label: "Netherlands Antilles" },
            { value: "NC", label: "New Caledonia" },
            { value: "NZ", label: "New Zealand" },
            { value: "NI", label: "Nicaragua" },
            { value: "NE", label: "Niger" },
            { value: "NG", label: "Nigeria" },
            { value: "NU", label: "Niue" },
            { value: "NF", label: "Norfolk Island" },
            { value: "KP", label: "North Korea" },
            { value: "NO", label: "Norway" },
            { value: "OM", label: "Oman" },
            { value: "PK", label: "Pakistan" },
            { value: "PW", label: "Palau" },
            { value: "PA", label: "Panama" },
            { value: "PG", label: "Papua New Guinea" },
            { value: "PY", label: "Paraguay" },
            { value: "PE", label: "Peru" },
            { value: "PH", label: "Philippines" },
            { value: "PN", label: "Pitcairn" },
            { value: "PL", label: "Poland" },
            { value: "PT", label: "Portugal" },
            { value: "PR", label: "Puerto Rico" },
            { value: "QA", label: "Qatar" },
            { value: "RE", label: "Reunion" },
            { value: "RO", label: "Romania" },
            { value: "RU", label: "Russia" },
            { value: "RW", label: "Rwanda" },
            { value: "SH", label: "Saint Helena" },
            { value: "KN", label: "Saint Kitts and Nevis" },
            { value: "LC", label: "Saint Lucia" },
            { value: "SM", label: "San Marino" },
            { value: "SA", label: "Saudi Arabia" },
            { value: "SN", label: "Senegal" },
            { value: "SC", label: "Seychelles" },
            { value: "SL", label: "Sierra Leone" },
            { value: "SG", label: "Singapore" },
            { value: "SK", label: "Slovak Republic" },
            { value: "SI", label: "Slovenia" },
            { value: "SB", label: "Solomon Islands" },
            { value: "SO", label: "Somalia" },
            { value: "ZA", label: "South Africa" },
            { value: "GS", label: "South Georgia" },
            { value: "KR", label: "South Korea" },
            { value: "ES", label: "Spain" },
            { value: "LK", label: "Sri Lanka" },
            { value: "SD", label: "Sudan" },
            { value: "SR", label: "Suriname" },
            { value: "SZ", label: "Swaziland" },
            { value: "SE", label: "Sweden" },
            { value: "CH", label: "Switzerland" },
            { value: "SY", label: "Syria" },
            { value: "TW", label: "Taiwan" },
            { value: "TJ", label: "Tajikistan" },
            { value: "TZ", label: "Tanzania" },
            { value: "TH", label: "Thailand" },
            { value: "TG", label: "Togo" },
            { value: "TK", label: "Tokelau" },
            { value: "TO", label: "Tonga" },
            { value: "TT", label: "Trinidad and Tobago" },
            { value: "TN", label: "Tunisia" },
            { value: "TR", label: "Turkey" },
            { value: "TM", label: "Turkmenistan" },
            { value: "TC", label: "Turks and Caicos Islands" },
            { value: "TV", label: "Tuvalu" },
            { value: "UG", label: "Uganda" },
            { value: "UA", label: "Ukraine" },
            { value: "AE", label: "United Arab Emirates" },
            { value: "UK", label: "United Kingdom" },
            { value: "US", label: "United States" },
            { value: "UY", label: "Uruguay" },
            { value: "UZ", label: "Uzbekistan" },
            { value: "VU", label: "Vanuatu" },
            { value: "VA", label: "Vatican City (Holy See)" },
            { value: "VE", label: "Venezuela" },
            { value: "VN", label: "Vietnam" },
            { value: "VG", label: "Virgin Islands (British)" },
            { value: "VI", label: "Virgin Islands (US)" },
            { value: "WF", label: "Wallis and Futuna Islands" },
            { value: "EH", label: "Western Sahara" },
            { value: "WS", label: "Western Samoa" },
            { value: "YE", label: "Yemen" },
            { value: "YU", label: "Yugoslavia" },
            { value: "ZM", label: "Zambia" },
            { value: "ZW", label: "Zimbabwe" }
        ];

        var rdfproperties = [
            { value: "rdf:label", label: "rdf:label" },
            { value: "foaf:person", label: "foaf:person" },
            { value: "dc:title", label: "dc:title" },
            { value: "rdf:type", label: "rdf:type" }
        ];
        var rdfproperties1 = [
            { value: "rdf:label", label: "rdf:label" },
            { value: "foaf:person", label: "foaf:person" },
            { value: "dc:title", label: "dc:title" },
            { value: "rdf:type", label: "rdf:type" }
        ];
        var limesproperties = [
            { value: "levenshtein", label: "Levenshtein" },
            { value: "euclidean", label: "Euclidean" }
        ];

        var outputtypes = [
            { value: "TURTLE", label: "TURTLE" },
            { value: "RDF/XML", label: "RDF/XML" },
            { value: "N3", label: "NTRIPLES" }
        ];


        // create Properties ComboBox.
        //$("#property").jqxComboBox({ enableBrowserBoundsDetection: true, selectionMode: "dropdownlist", promptText: "Select a Property:", source: rdfproperties, height: 22, width: '100%' });
        // create Target Properties ComboBox.
        //$("#targetproperty").jqxComboBox({ enableBrowserBoundsDetection: true, selectionMode: "dropdown", promptText: "Select a Property:", source: rdfproperties1, height: 22, width: '100%' });
        // create Metric ComboBox.
        //$("#metric").jqxComboBox({ enableBrowserBoundsDetection: true, selectionMode: "dropdownlist", promptText: "Select a Metric of Distance:", source: limesproperties, height: 22, width: '100%' });
        // create Output type ComboBox.
        //$("#output").jqxComboBox({ enableBrowserBoundsDetection: true, selectionMode: "dropdownlist", promptText: "Select a type of output file:", source: outputtypes, height: 22, width: '100%' });


        // create Accept Terms Checkbox.
        $("#finished").jqxCheckBox({ width: '100%' });
        // create the Birth Date Calendar.
        //$("#birthDate").jqxDateTimeInput({ enableBrowserBoundsDetection: true, width: '100%', height: 24 });
        // create the Cart Type ComboBox.
        //var cardTypes = [{ value: "visa", label: "Visa" }, { value: "masterCard", label: "MasterCard" }, { value: "americanExpress", label: "American Express" }, { value: "discover", label: "Discover" }];
        // $("#cardType").jqxComboBox({ enableBrowserBoundsDetection: true, selectedIndex: 0, autoDropDownHeight: true, promptText: "Card Type:", source: cardTypes, width: '100%', height: 22 });
        var months = [
            { value: "01", label: "01 - January" },
            { value: "02", label: "02 - February" },
            { value: "03", label: "03 - March" },
            { value: "04", label: "04 - April" },
            { value: "05", label: "05 - May" },
            { value: "06", label: "06 - June" },
            { value: "07", label: "07 - July" },
            { value: "08", label: "08 - August" },
            { value: "09", label: "09 - September" },
            { value: "10", label: "10 - October" },
            { value: "11", label: "11 - November" },
            { value: "12", label: "12 - December" }
        ];
        var years = [
            { value: "2014", label: "2014" },
            { value: "2015", label: "2015" },
            { value: "2016", label: "2016" },
            { value: "2017", label: "2017" },
            { value: "2018", label: "2018" },
            { value: "2019", label: "2019" },
            { value: "2020", label: "2020" }
        ];
        // Create Expiration Date & Year ComboBoxes.
        // $("#expirationDate").jqxComboBox({ enableBrowserBoundsDetection: true, source: months, selectedIndex: 0, height: 22, width: '100%' });
        // $("#expirationYear").jqxComboBox({ enableBrowserBoundsDetection: true, source: years, autoDropDownHeight: true, selectedIndex: 0, height: 22, width: '100%' });
        // Create the Form Validator.
        $('#form').jqxValidator({
            hintType: 'label',
            rules: [
                { input: '#endpoint', message: 'Endpoint URL is required!', action: 'keyup, blur', rule: 'required' },
                { input: '#targetendpoint', message: 'Endpoint is required!', action: 'keyup, blur', rule: 'required' },
                { input: '#restriction', message: 'Restriction is required!', action: 'keyup, blur', rule: 'required' },
                { input: '#targetrestriction', message: 'Restriction is required!', action: 'keyup, blur', rule: 'required' },
                { input: '#acceptancethreshold', message: 'The threshold is required!', action: 'keyup, blur', rule: 'required' },
                { input: '#acceptancerelation', message: 'Relation is required!', action: 'keyup, blur', rule: 'required' },
                { input: '#reviewthreshold', message: 'The threshold is required!', action: 'keyup, blur', rule: 'required' },
                { input: '#reviewrelation', message: 'Relation is required!', action: 'keyup, blur', rule: 'required' },
                { input: '#finished', message: 'You need to accept the terms!', action: 'keyup, blur', rule: 'required' },
                { input: '#property', message: 'You need to accept the terms!', action: 'keyup, blur', rule: 'required' },
                { input: '#targetproperty', message: 'You need to accept the terms!', action: 'keyup, blur', rule: 'required' },
                { input: '#metric', message: 'You need to accept the terms!', action: 'keyup, blur', rule: 'required' },
                { input: '#output', message: 'You need to accept the terms!', action: 'keyup, blur', rule: 'required' }
            ]
        });
        // Validate form.
        $("#startButton").click(function () {
            var validationResult = function (isValid) {
                if (isValid) {
                    $("#form").submit();
                }
            }
            $('#form').jqxValidator('validate', validationResult);
        });
        // prepare chart data as an array
        var sampleData = [
            { Day: 'Monday', Running: 30, Swimming: 0, Cycling: 25, Goal: 40 },
            { Day: 'Wednesday', Running: 30, Swimming: 0, Cycling: 25, Goal: 60 },
            { Day: 'Friday', Running: 0, Swimming: 20, Cycling: 25, Goal: 50 },
            { Day: 'Sunday', Running: 20, Swimming: 40, Cycling: 0, Goal: 90 }
        ];
        // prepare jqxChart settings
        var settings = {
            borderLineWidth: 0,
            title: "Fitness & exercise weekly scorecard",
            description: "Time spent in vigorous exercise by activity",
            enableAnimations: true,
            showLegend: true,
            padding: { left: 5, top: 5, right: 5, bottom: 5 },
            titlePadding: { left: 30, top: 0, right: 0, bottom: 10 },
            source: sampleData,
            categoryAxis:
            {
                text: 'Category Axis',
                textRotationAngle: 0,
                dataField: 'Day',
                showTickMarks: true,
                tickMarksInterval: 1,
                tickMarksColor: '#888888',
                unitInterval: 1,
                showGridLines: false,
                gridLinesInterval: 1,
                gridLinesColor: '#888888',
                axisSize: 'auto'
            },
            colorScheme: 'scheme05',
            seriesGroups:
                    [
                        {
                            type: 'splinearea',
                            valueAxis:
                            {
                                unitInterval: 20,
                                minValue: 0,
                                maxValue: 100,
                                displayValueAxis: false,
                                description: 'Goal in minutes',
                                axisSize: 'auto',
                                tickMarksColor: '#888888'
                            },
                            series: [
                                { dataField: 'Goal', displayText: 'Personal Goal', opacity: 0.7 }
                            ]
                        },
                        {
                            type: 'stackedcolumn',
                            columnsGapPercent: 100,
                            seriesGapPercent: 5,
                            valueAxis:
                            {
                                unitInterval: 20,
                                minValue: 0,
                                maxValue: 100,
                                displayValueAxis: true,
                                description: 'Time in minutes',
                                axisSize: 'auto',
                                tickMarksColor: '#888888',
                                gridLinesColor: '#777777'
                            },
                            series: [
                                { dataField: 'Running', displayText: 'Running' },
                                { dataField: 'Swimming', displayText: 'Swimming' },
                                { dataField: 'Cycling', displayText: 'Cycling' }
                            ]
                        }
                    ]
        };
        // setup the chart
        $('#chart').jqxChart(settings);
        // prepare DataTable data.
        var data = new Array();
        var firstNames = ["Nancy", "Andrew", "Janet", "Margaret", "Steven", "Michael", "Robert", "Laura", "Anne"];
        var lastNames = ["Davolio", "Fuller", "Leverling", "Peacock", "Buchanan", "Suyama", "King", "Callahan", "Dodsworth"];
        var titles = ["Sales Representative", "Vice President, Sales", "Sales Representative", "Sales Representative", "Sales Manager", "Sales Representative", "Sales Representative", "Inside Sales Coordinator", "Sales Representative"];
        var k = 0;
        for (var i = 0; i < firstNames.length; i++) {
            var row = {};
            row["firstname"] = firstNames[k];
            row["lastname"] = lastNames[k];
            row["title"] = titles[k];
            data[i] = row;
            k++;
        }
        var source =
        {
            localData: data,
            dataType: "array"
        };
        var dataAdapter = new $.jqx.dataAdapter(source);
        // create DataTable.
        $("#dataTable").jqxDataTable(
                {
                    width: '100%',
                    height: '100%',
                    source: dataAdapter,
                    sortable: true,
                    columns: [
                        { text: 'First Name', dataField: 'firstname', width: '30%' },
                        { text: 'Last Name', dataField: 'lastname', width: '30%' },
                        { text: 'Title', dataField: 'title' }
                    ]
                });
        $("#dataTable1").jqxDataTable(
                {
                    width: '100%',
                    height: '100%',
                    source: dataAdapter,
                    sortable: true,
                    columns: [
                        { text: 'First Name', dataField: 'firstname', width: '30%' },
                        { text: 'Last Name', dataField: 'lastname', width: '30%' },
                        { text: 'Title', dataField: 'title' }
                    ]
                });
        $("#myTab").tab();
        $('.pane:nth-child(2)').hide();
        $('.pane:nth-child(3)').hide();
        $('#myTab a').click(function (e) {
            e.preventDefault();
            $('.pane').hide();
            $('#myTab li').removeClass('active');
            var id = $(this).attr('data-tab');
            $("#" + id).show();
            // notifies the widgets that a resize is required and forces a redraw. $.jqx.resize is called for better UX when navigating through tabs.
            $.jqx.resize();
            $(this).parent().addClass('active');
        })
    });
</script>
<div id = 'jqxmainpanel' >
    <div style="height: 30px;margin-top: 70px; margin-left: 65px; margin-right: 70px; ">

        <div class="form-horizontal col-sm-4" style="height: 100%"></div>
        <div class="form-horizontal col-sm-4" style="height: 100%">
            <h3> Linking Process Configuration </h3>
        </div>
        <div class="form-horizontal col-sm-4" style="height: 100%"></div>
    </div>
    <div class="form-horizontal" style="height: 240px; margin-top: 50px;  margin-right: 110px">
        <div class="form-horizontal col-sm-2" style="height: 100%"></div>
        <div class="form-horizontal col-sm-4" style="height: 100%">
            <b>Recomended External Sources:</b><br/>
            <div id='lstBox1' style="margin-top: 10px">
            </div>
        </div>
        <div class="form-horizontal col-sm-1" style="height: 100%">
            <button style="margin-top: 80px; margin-left: 10px; width: 50px "  id="btnRight" type="button">   >  </button>
            <button style="margin-top: 10px; margin-left: 10px; width: 50px "  id="btnLeft" type="button">   <  </button>
        </div>
        <div class="form-horizontal col-sm-4" style=" height: 100%">
            <b>Selected External Datasources:</b><br/>
            <div id='lstBox2' style="margin-top: 10px">
            </div>
        </div>
        <div class="form-horizontal col-sm-1" style="height: 100%"></div>
    </div>
    <div class="form-horizontal" style="height: 30px; margin-top: 30px; margin-right: 110px">
        <div class="form-horizontal col-sm-2" style="height: 100%"></div>
        <div class="form-horizontal col-sm-4" style="height: 100%">

        </div>
        <div class="form-horizontal col-sm-1" style="height: 100%">

        </div>
        <div class="form-horizontal col-sm-4" style="height: 100%">
            <div class="form-horizontal col-sm-4" style="height: 100%"></div>
            <div class="form-horizontal col-sm-5" style=" height: 100%"></div>
            <div class="form-horizontal col-sm-3" style="height: 100%">
                <button   id="btnAccept" type="button">Accept</button>

            </div>
        </div>
        <div class="form-horizontal col-sm-1" style="height: 100%">
        </div>
    </div>

    <div style="margin-top: 30px;margin-left: 45px; margin-right: 45px; height:600px; border: 1px solid #d3d3d3 ">

        <div style="min-height: 40px; margin-top: 0px;margin-left: 0px; margin-right: 0px; box-shadow: none; -webkit-box-shadow: none;" class="navbar navbar-default " role="navigation">
            <ul id="myTab" style="min-width: 480px; box-shadow: none; -webkit-box-shadow: none; border: none;" class="nav nav-tabs">
                <li style="margin-left: 20px;" class="active"><a data-tab="billing" href="#billing">DBPedia</a></li>

                <li><a data-tab="fitness" href="#fitness">DBLP</a></li>
                <li><a data-tab="employee" href="#employee">Freebase</a></li>
                <li><a data-tab="mytable" href="#employee">My table</a></li>
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
                                    <input placeholder="http://localhost:8890/sparql" id="endpoint" name="endpoint" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="rgraph">Graph</label>
                                <div class="col-sm-8">
                                    <input placeholder="-1" name="rgraph" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="var">Var</label>
                                <div class="col-sm-8">
                                    <input placeholder="?a" id="var" name="var" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="pagesize">Pagesize</label>
                                <div class="col-sm-8">
                                    <input placeholder="1000" name="pagesize" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="restriction">Restriction</label>
                                <div class="col-sm-8">
                                    <input placeholder="?a rdf:type foaf:name" id="restriction" name="restriction" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="property">Property</label>
                                <div class="col-sm-8">
                                    <input placeholder="df:type" id="property" name="property" value="" />
                                </div>
                            </div>

                        </div>
                        <%-- Div for inputs right (Target)--%>
                        <div class="form-horizontal col-sm-6">
                            <div>
                                <label class="col-sm-4 control-label" for="targetendpoint">Endpoint</label>
                                <div class="col-sm-8">
                                    <input name="targetendpoint" id="targetendpoint" placeholder="http://dbpedia.org/sparql" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="targetrgraph">Graph</label>
                                <div class="col-sm-8">
                                    <input placeholder="-1" name="targetrgraph" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="targetvar">Var</label>
                                <div class="col-sm-8">
                                    <input name="targetvar" id="targetvar" placeholder="?b" maxlength="5" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="targetpagesize">Pagesize</label>
                                <div class="col-sm-8">
                                    <input placeholder="1000" name="targetpagesize" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="targetrestriction">Restriction</label>
                                <div class="col-sm-8">
                                    <input placeholder="?b rdf:type dbpedia-o:Person" id="targetrestriction" name="targetrestriction" value="" />
                                </div>
                            </div>
                            <div>
                                <label class="col-sm-4 control-label" for="targetproperty">Property</label>
                                <div class="col-sm-8">
                                    <input placeholder="df:type dbpedia-o:Person" id="targetproperty" name="targetproperty" value="" />

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
                                        <input placeholder="Levenstein" id="metric" name="metric" value="" />
                                    </div>
                                </div>
                                <div>
                                    <label class="col-sm-4 control-label" for="output">Output:</label>
                                    <div class="col-sm-8">
                                        <input placeholder="df:type dbpedia-o:Person" id="output" name="output" value="" />
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
                                            <input placeholder="0.9" id="acceptancethreshold" name="acceptancethreshold" value="" />
                                        </div>
                                    </div>
                                    <div>
                                        <label class="col-sm-4 control-label" for="acceptancerelation">Relation</label>
                                        <div class="col-sm-8">
                                            <input placeholder="owl:sameAs" id="acceptancerelation" name="acceptancerelation" value="" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-horizontal col-sm-6" style="height: 100%;">
                                    <label style="font-size: larger" >Review:</label>
                                    <div>
                                        <label class="col-sm-4 control-label" for="reviewthreshold">Threshold</label>
                                        <div class="col-sm-8">
                                            <input placeholder="0.9" id="reviewthreshold" name="reviewthreshold" value="" />
                                        </div>
                                    </div>
                                    <div>
                                        <label class="col-sm-4 control-label" for="reviewrelation">Relation</label>
                                        <div class="col-sm-8">
                                            <input placeholder="owl:sameAs" id="reviewrelation" name="reviewrelation" value="" />
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
                            <div class="col-sm-4">
                                <div style="margin-top: 15px;" id="finished" name="finished">Configuration Finished</div>
                                <g:submitButton name="create" class="btn btn-primary" id="startButton" value="${message(code: 'default.button.noel.label', default: 'Run Job')}" />
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