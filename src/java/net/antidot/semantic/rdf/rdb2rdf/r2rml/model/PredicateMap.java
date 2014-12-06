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
 * R2RML Model : Standard PredicateMap Interface
 *
 * A predicate map is a specific term map used for 
 * representing RDF predicate. 
 *
 ****************************************************************************/
package net.antidot.semantic.rdf.rdb2rdf.r2rml.model;

public interface PredicateMap extends TermMap {
	
	/**
	 * A Predicate Map knows in own Predicate Object container.
	 */
	public PredicateObjectMap getPredicateObjectMap();
	public void setPredicateObjectMap(PredicateObjectMap predicateObjectMap);

}
