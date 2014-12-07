package com.rdb2lodc.jobs;

import com.rdb2lodc.db.DataSource;
import net.antidot.semantic.rdf.model.impl.sesame.SesameDataSet;
import net.antidot.semantic.rdf.rdb2rdf.dm.core.DirectMapper;
import net.antidot.semantic.rdf.rdb2rdf.dm.core.DirectMappingEngine;
import net.antidot.semantic.rdf.rdb2rdf.r2rml.core.R2RMLProcessor;
import net.antidot.semantic.rdf.rdb2rdf.r2rml.exception.InvalidR2RMLStructureException;
import net.antidot.semantic.rdf.rdb2rdf.r2rml.exception.InvalidR2RMLSyntaxException;
import net.antidot.semantic.rdf.rdb2rdf.r2rml.exception.R2RMLDataError;
import net.antidot.sql.model.core.DriverType;
import net.antidot.sql.model.core.SQLConnector;
import org.openrdf.repository.RepositoryException;
import org.openrdf.rio.RDFFormat;
import org.openrdf.rio.RDFParseException;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by kathrinr.llanes@gmail.com on 06/12/14.
 */
public class DB2TriplesService {

    public DB2TriplesService(){
        System.out.println("Creado el Objeto DB2TriplesService");
    }

    public void runDB2Triples(DB2TriplesJob db2TriplesJob){

        System.out.println("Iniciando el trabajo");
        System.out.println(db2TriplesJob.getBaseURI());
        System.out.println(db2TriplesJob.getDatasource1().getDs_host());

        DriverType driver = DriverType.PostgreSQL;
        String url = "jdbc:postgresql://" + db2TriplesJob.getDatasource1().getDs_host() + ":" + db2TriplesJob.getDatasource1().getDs_port() + "/";
        System.out.println(url);

        String userName = db2TriplesJob.getDatasource1().getDs_user();
        String password = db2TriplesJob.getDatasource1().getDs_password();
        String dbName = db2TriplesJob.getDatasource1().getDs_name();
        Connection conn;
        Thread thread;
        RDFFormat rdfFormat = null;

        // Init parameters
        String mode = db2TriplesJob.getMode();
        String baseURI = db2TriplesJob.getBaseURI();
        String output = db2TriplesJob.getR2RML().getDirectory() + "/" + db2TriplesJob.getR2RML().getR2rml() + "_" + "output.rdf";
        String r2rmlFile = db2TriplesJob.getR2RML().getDirectory() + "/" + db2TriplesJob.getR2RML().getR2rml();

        if (db2TriplesJob.getMode() == "TURTLE"){
            rdfFormat = RDFFormat.TURTLE;
        }else if (db2TriplesJob.getMode() == "RDFXML"){
            rdfFormat = RDFFormat.RDFXML;
        }else if (db2TriplesJob.getMode() == "NTRIPLES"){
            rdfFormat = RDFFormat.NTRIPLES;
        }else{
            rdfFormat = RDFFormat.N3;
        }

        boolean useNativeStore = false;
        boolean forceExistingRep = false;
        String nativeOutput = null;
        String sparql = null;
        String sparqlOutput = null;
        String format = null;

        int int_version = 1;
        SesameDataSet g = null;


        DirectMappingEngine.Version version = DirectMappingEngine.Version.WD_20120529;

        System.out.println("Comenzando el trabajo");
        System.out.println("Fichero r2rml: " + r2rmlFile);
        System.out.println("Fichero de salida: " + output);

        db2TriplesJob.setStatus("running");
        db2TriplesJob.save();

        try {
            conn = SQLConnector.connect(userName, password, url + dbName, driver);
            System.out.println(conn.getCatalog());
            // Extract database model according to convert mode
            if (mode.equals("r2rml")) {
                g = R2RMLProcessor.convertDatabase(conn, r2rmlFile, baseURI, nativeOutput, driver);
            } else {
                g = DirectMapper.generateDirectMapping(conn, version,
                        driver, baseURI, null, nativeOutput);
            }
            g.dumpRDF(output, rdfFormat);

            db2TriplesJob.setStatus("finished");
            db2TriplesJob.save();

            System.out.println("Trabajo Terminado");


        } catch (IOException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (RepositoryException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InvalidR2RMLStructureException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvalidR2RMLSyntaxException e) {
            e.printStackTrace();
        } catch (RDFParseException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (R2RMLDataError r2RMLDataError) {
            db2TriplesJob.setStatus("aborted");
            db2TriplesJob.save();
            r2RMLDataError.printStackTrace();
        }
/*

        DriverType driver = DriverType.PostgreSQL;
        String url = "jdbc:postgresql://localhost/";
        String userName = "postgres";
        String password = "root";
        String dbName = "Web_Semantica";
        Connection conn;
        Thread thread;

        // Init parameters
        String mode = "r2rml";
        String baseURI = "http://foo.example/DB/";
        String output = "/home/noel/output_test6.rdf";
        String r2rmlFile = "/home/noel/Conference_r2rmlMapping.n3";
        RDFFormat rdfFormat = RDFFormat.TURTLE; // Turtle by default

        boolean useNativeStore = false;
        boolean forceExistingRep = false;
        String nativeOutput = null;
        String sparql = null;
        String sparqlOutput = null;
        String format = null;

        int int_version = 1;
        SesameDataSet g = null;

        // RDF Format output

        // Norm version
        DirectMappingEngine.Version version = DirectMappingEngine.Version.WD_20120529;

        try {
            conn = SQLConnector.connect(userName, password, url + dbName, driver);
            System.out.println(conn.getCatalog());
            // Extract database model according to convert mode
            if (mode.equals("r2rml")) {
                g = R2RMLProcessor.convertDatabase(conn, r2rmlFile, baseURI, nativeOutput, driver);
            } else {
                g = DirectMapper.generateDirectMapping(conn, version,
                        driver, baseURI, null, nativeOutput);
            }
            g.dumpRDF(output, rdfFormat);

            System.out.println("Trabajo Terminado");


        } catch (IOException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (RepositoryException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InvalidR2RMLStructureException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvalidR2RMLSyntaxException e) {
            e.printStackTrace();
        } catch (RDFParseException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (R2RMLDataError r2RMLDataError) {
            r2RMLDataError.printStackTrace();
        }
*/
    }

}
