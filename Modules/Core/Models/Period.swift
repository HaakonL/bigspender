//
//  Period.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 09/01/2023.
//

import Foundation

public struct Period: DomainObject {
	public let id: UUID
	public let start: Date
	public let end: Date
	public let budget: Int
	
	public init(id: UUID?, start: Date, end: Date, budget: Int) {
		self.id = id ?? UUID()
		self.start = start
		self.end = end
		self.budget = budget
	}
}
