package com.rdb2lodc.db;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;


/**
 * Created by kathrinr.llanes@gmail.com on 05/12/14.
 */
public class DataSourceService {

    String dbname;
    String host;
    int port;
    String username = null;
    String password = null;
    String type;
    String[] tablas = null;

    Connection conn = null;

    public DataSourceService(DataSource dataSource) {
        this.dbname = dataSource.getDs_name();
        this.host = dataSource.getDs_host();
        this.port = dataSource.getDs_port();
        this.username = dataSource.getDs_user();
        this.password = dataSource.getDs_password();
        this.type = dataSource.getDs_type();
    }

    public Connection Connect() {

            try {
                Class.forName("org.postgresql.Driver");
                String a = "jdbc:postgresql://" + host +":" + port +"/" + dbname;
                System.out.println(a);
                conn = DriverManager.getConnection("jdbc:postgresql://" + host + ":" + port + "/" + dbname, username, password);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        return conn;
    }

    public void Disconnect() {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public String[] getTablas() {
        if (conn != null) {
            try {
                DatabaseMetaData meta = conn.getMetaData();
                System.out.println(meta.toString());
                ResultSet res = meta.getTables(null, null, null, new String[]{"TABLE"});
                int count = 0;
                while (res.next()) {
                    count++;
                }

                ResultSet res1 = meta.getTables(null, null, null, new String[]{"TABLE"});
                tablas = new String[count];
                int i = 0;
                while (res1.next()) {
                    tablas[i] = res1.getString("TABLE_NAME");
                    System.out.println(res1.getString("TABLE_NAME"));
                    i++;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        return tablas;
    }

    public Attributes[] getAttributes(String tabla){
        Attributes[] attributes = null;

        if (conn != null) {
            try {
                DatabaseMetaData meta = conn.getMetaData();

                ResultSet res2 = meta.getColumns(null, null, tabla, null);
                int count = 0;
                while (res2.next()) {
                    count++;
                }

                System.out.println(count);

                attributes = new Attributes[count];

                ResultSet res3 = meta.getColumns(null, null, tabla, null);
                int j = 0;
                while (res3.next()) {
                    Attributes col = new Attributes();
                    col.setCl_name(res3.getString(4));
                    col.setCl_type(res3.getInt(5));
                    attributes[j] = col;
                    System.out.println(res3.getString(4));
                    System.out.println(res3.getInt(5));
                    j++;
                }


            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return attributes;
    }

}