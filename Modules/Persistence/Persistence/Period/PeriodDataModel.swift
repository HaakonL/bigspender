//
//  PeriodDataModel.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 11/01/2023.
//

import Foundation
import Core
import FirebaseFirestoreSwift

public class PeriodDataModel: Codable {
	@DocumentID public var id: String?
	public var periodStart: Date
	public var periodEnd: Date
	public var amountAvailable: Int
	
	public init() {
		self.periodStart = Date().start()
		self.periodEnd = Date().adding(.month, value: 1).adding(.day, value: -1).end()
		self.amountAvailable = 0
	}
	
	public init(_ periodModel: Period) {
		self.periodStart = periodModel.periodStart
		self.periodEnd = periodModel.periodEnd
		self.amountAvailable = periodModel.amountAvailable
	}
	
	public func toDomainModel() -> Period {
		return Period(
			id: id ?? UUID().uuidString,
			periodStart: periodStart,
			periodEnd: periodEnd,
			amountAvailable: amountAvailable
		)
	}
}
