package com.swp391.group3.utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author Dell
 */
public final class DBHelper implements Serializable {

    private DBHelper() {
    }

    public static Connection makeConnection() throws ClassNotFoundException, SQLException, NamingException {
        //1. get file system
        Context currentContext = new InitialContext();
        //2. get file system of container context 
        Context tomcatContext = (Context) currentContext.lookup("java:comp/env");
        //3. get datasource
        DataSource datasource = (DataSource) tomcatContext.lookup("DataSourceAhihi");
//        DataSource datasource = (DataSource) currentContext.lookup("java:comp/env/DataSourceAhihi");
        //4. get connection        
        Connection connection = datasource.getConnection();
        return connection;

    }


}
