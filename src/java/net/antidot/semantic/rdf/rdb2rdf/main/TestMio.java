/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.antidot.semantic.rdf.rdb2rdf.main;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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

import javax.activation.DataSource;

/**
 *
 * @author noel
 */
public class TestMio {

    TestMio() {

    }

    public void PruebaExec() throws UnsupportedEncodingException {

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
        String output = "/home/noel/output_test4.rdf";
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



    }

    public static void main(String[] args) throws UnsupportedEncodingException {


    }
}
