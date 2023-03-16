//
//  Week.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 09/01/2023.
//

import Foundation

public struct Period: DomainObject {
	public let id: UUID
	public let periodStart: Date
	public let periodEnd: Date
	public let amountAvailable: Int
	
	public init(id: UUID?, periodStart: Date, periodEnd: Date, amountAvailable: Int) {
		self.id = id ?? UUID()
		self.periodStart = periodStart
		self.periodEnd = periodEnd
		self.amountAvailable = amountAvailable
	}
}
