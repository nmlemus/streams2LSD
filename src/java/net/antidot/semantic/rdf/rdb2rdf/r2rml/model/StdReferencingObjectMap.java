/* 
 * Copyright 2011-2013 Antidot opensource@antidot.net
 * https://github.com/antidot/db2triples
 * 
 * This file is part of DB2Triples
 *
 * DB2Triples is free software; you can redistribute it and/or 
 * modify it under the terms of the GNU Lesser General Public License as 
 * published by the Free Software Foundation; either version 2 of 
 * the License, or (at your option) any later version.
 * 
 * DB2Triples is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
/***************************************************************************
 *
 * R2RML Model : Standard Referencing Object Map Class
 *
 * A referencing object map allows using the subjects
 * of another triples map as the objects generated by 
 * a predicate-object map.
 * 
 ****************************************************************************/
package net.antidot.semantic.rdf.rdb2rdf.r2rml.model;

import java.util.HashSet;
import java.util.Set;

public class StdReferencingObjectMap implements ReferencingObjectMap {

	private TriplesMap parentTriplesMap;
	private HashSet<JoinCondition> joinConditions;
	private PredicateObjectMap predicateObjectMap;

	public StdReferencingObjectMap(PredicateObjectMap predicateObjectMap,
			TriplesMap parentTriplesMap, Set<JoinCondition> joinConditions) {
		setPredicateObjectMap(predicateObjectMap);
		this.parentTriplesMap = parentTriplesMap;
		setJoinConditions(joinConditions);

	}

	private void setJoinConditions(Set<JoinCondition> joinConditions) {
		this.joinConditions = new HashSet<JoinCondition>();
		this.joinConditions.addAll(joinConditions);
	}

	public String getChildQuery() {
		return predicateObjectMap.getOwnTriplesMap().getLogicalTable()
				.getEffectiveSQLQuery();
	}

	public Set<JoinCondition> getJoinConditions() {
		return joinConditions;
	}

	public String getJointSQLQuery() {
		String jointSQLQuery = "SELECT * FROM (" + getChildQuery()
				+ ") AS child, (" + getParentQuery() + ") AS parent";
		// If the referencing object map has no join condition
		if (joinConditions.isEmpty())
			jointSQLQuery = "SELECT * FROM (" + getChildQuery() + ") AS tmp";
		// If the referencing object map has at least one join condition
		else {
			String whereClause = " WHERE ";
			int i = 0;
			for (JoinCondition j : joinConditions) {
				whereClause += "child." + j.getChild() + "=parent."
						+ j.getParent();
				i++;
				if (i < joinConditions.size())
					whereClause += " AND ";
			}
			jointSQLQuery += whereClause;
		}
		return jointSQLQuery;
	}

	public String getParentQuery() {
		return parentTriplesMap.getLogicalTable().getEffectiveSQLQuery();
	}

	public TriplesMap getParentTriplesMap() {
		return parentTriplesMap;
	}

	public PredicateObjectMap getPredicateObjectMap() {
		return predicateObjectMap;
	}

	public void setPredicateObjectMap(PredicateObjectMap predicateObjectMap) {
		// Update predicateObjectMap if not contains this object map
		if (predicateObjectMap != null) {
			if (predicateObjectMap.getReferencingObjectMaps() == null)
				predicateObjectMap
						.setReferencingObjectMap(new HashSet<ReferencingObjectMap>());
			predicateObjectMap.getReferencingObjectMaps().add(this);
		}
		this.predicateObjectMap = predicateObjectMap;
	}

}