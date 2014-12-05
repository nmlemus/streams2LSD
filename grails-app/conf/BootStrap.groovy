import com.rdb2lodc.security.*

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def testUser = new User(username: 'admin', password: 'admin', enabled: true)
        def testUser1 = new User(username: 'nmlemus', password: 'admin', enabled: true)
        testUser.save(flush: true)
        testUser1.save(flush: true)

        UserRole.create(testUser, adminRole, true)
        UserRole.create(testUser1, adminRole, true)
    }
    def destroy = {
    }
}
