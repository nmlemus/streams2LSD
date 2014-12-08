package com.rdb2lodc.jobs

import com.rdb2lodc.security.User

/**
 * LimesJob
 * A domain class describes the data object and it's mapping to the database
 */
class LimesJob {

    LimesSource source
    LimesSource target

    String metric
    String outputFormat
    float acceptanceTheshold
    float reviewTheshold
    String acceptanceRelation
    String reviewRelation
    String status

    static	belongsTo	= [userlimes: User]

    static mapping = {
    }

    static constraints = {
        status(inList: ['initialized', 'running', 'finished', 'aborted'])
    }

   public String toString() {
		return source.endpoint
	}

   public void LimesFile(userDir){
       def file1 = new File(userDir.absolutePath, "limes1_" + source.id  +".xml")
       file1 << '<LIMES>\n'
       file1 << '\t<PREFIX>\n'
       file1 << '\t</PREFIX>\n'
       file1 << '\n'

       file1 << '\t<SOURCE>\n'
       file1 << '\t\t<ID>' + this.source.sourcename +'</ID>\n'
       file1 << '\t\t<ENDPOINT>' + this.source.endpoint +'</ENDPOINT>\n'
       file1 << '\t\t<VAR>' + this.source.var +'</VAR>\n'
       file1 << '\t\t<PAGESIZE>' + this.source.pagesize +'</PAGESIZE>\n'
       file1 << '\t\t<RESTRICTION>' + this.source.restriction +'</RESTRICTION>\n'
       file1 << '\t\t<PROPERTY>' + this.source.property +'</PROPERTY>\n'
       file1 << '\t</SOURCE>\n'
       file1 << '\n'

       file1 << '\t<TARGET>\n'
       file1 << '\t\t<ID>' + this.target.sourcename +'</ID>\n'
       file1 << '\t\t<ENDPOINT>' + this.target.endpoint +'</ENDPOINT>\n'
       file1 << '\t\t<VAR>' + this.target.var +'</VAR>\n'
       file1 << '\t\t<PAGESIZE>' + this.target.pagesize +'</PAGESIZE>\n'
       file1 << '\t\t<RESTRICTION>' + this.target.restriction +'</RESTRICTION>\n'
       file1 << '\t\t<PROPERTY>' + this.target.property +'</PROPERTY>\n'
       file1 << '\t</TARGET>\n'
       file1 << '\n'

       file1 << '\t<METRIC>\n'
       file1 << '\t\t' + this.metric + '\n'
       file1 << '\t</METRIC>\n'
       file1 << '\n'

       file1 << '\t<ACCEPTANCE>\n'
       file1 << '\t\t<THRESHOLD>' + this.acceptanceTheshold +'</THRESHOLD>\n'
       file1 << '\t\t<FILE>' + "limes1_" + source.id + 'acceptance.txt' +'</FILE>\n'
       file1 << '\t\t<RELATION>' + this.acceptanceRelation +'</RELATION>\n'
       file1 << '\t</ACCEPTANCE>\n'
       file1 << '\n'

       file1 << '\t<REVIEW>\n'
       file1 << '\t\t<THRESHOLD>' + this.reviewTheshold +'</THRESHOLD>\n'
       file1 << '\t\t<FILE>' + "limes1_" + source.id + 'review.txt' +'</FILE>\n'
       file1 << '\t\t<RELATION>' + this.reviewRelation +'</RELATION>\n'
       file1 << '\t</REVIEW>\n'
       file1 << '\n'

       file1 << '</LIMES>\n'
   }

}
