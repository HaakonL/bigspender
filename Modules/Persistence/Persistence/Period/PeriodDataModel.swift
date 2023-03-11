//
//  PeriodDataModel.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 11/01/2023.
//

import Foundation
import Core
import RealmSwift

public class PeriodDataModel: Object, DataEntity {	
	@Persisted(primaryKey: true) var _id: ObjectId
	public var periodStart: Date = Date().start()
	public var periodEnd: Date = Date().adding(.month, value: 1).adding(.day, value: -1).end()
	public var amountAvailable: Int = 0
	
	public convenience init(_ periodModel: Period) {
		self.init()
		self.periodStart = periodModel.periodStart
		self.periodEnd = periodModel.periodEnd
		self.amountAvailable = periodModel.amountAvailable
	}
	
	public func toDomainObject() -> DomainObject {
		return Period(
			id: _id.stringValue,
			periodStart: periodStart,
			periodEnd: periodEnd,
			amountAvailable: amountAvailable
		)
	}
}
