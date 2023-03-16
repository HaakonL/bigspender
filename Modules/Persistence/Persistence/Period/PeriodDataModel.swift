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
	@Persisted public var periodStart: Date = Date().start()
	@Persisted public var periodEnd: Date = Date().adding(.month, value: 1).adding(.day, value: -1).end()
	@Persisted public var amountAvailable: Int = 0
	
	public convenience init(_ model: Period) {
		self.init()
		self.id = model.id
		self.periodStart = model.periodStart
		self.periodEnd = model.periodEnd
		self.amountAvailable = model.amountAvailable
	}
	
	public func toDomainObject() -> DomainObject {
		return Period(
			id: id,
			periodStart: periodStart,
			periodEnd: periodEnd,
			amountAvailable: amountAvailable
		)
	}
}
