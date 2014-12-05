package com.rdb2lodc.db

import com.rdb2lodc.security.User
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(DataSource)
class DataSourceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        /*
        DataSource dataSource = new DataSource()
        dataSource.ds_name = "Web_Semantica"
        dataSource.ds_host = "localhost"
        dataSource.ds_port = 5432
        dataSource.ds_type = "PostgreSQL"
        dataSource.ds_user = "postgres"
        dataSource.ds_password = "root"
        dataSource.user = new User(username: 'noel', password: 'cassandra', enabled: true).save()

        assert DataSource.count == 1
        */
    }
}
