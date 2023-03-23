//
//  PeriodDataModel.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 11/01/2023.
//

import Foundation
import Core
import RealmSwift

public class PeriodDataModel: Object, RepositoryObject {	
	@Persisted(primaryKey: true) var id: UUID
	@Persisted public var start: Date = Date().start()
	@Persisted public var end: Date = Date().adding(.month, value: 1).adding(.day, value: -1).end()
	@Persisted public var budget: Int = 0
	
	public convenience init(_ model: Period) {
		self.init()
		self.id = model.id
		self.start = model.start
		self.end = model.end
		self.budget = model.budget
	}
	
	public func toDomainObject() -> DomainObject {
		return Period(
			id: id,
			start: start,
			end: end,
			budget: budget
		)
	}
}
