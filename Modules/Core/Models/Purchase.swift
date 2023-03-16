//
//  Purchase.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 29/01/2023.
//

import Foundation

public struct Purchase: DomainObject {
	public let id: UUID
	public let amount: Int
	public let title: String
	public let when: Date
	public let tag: Tag?
	
	public init(id: UUID?, amount: Int, title: String, when: Date, tag: Tag?) {
		self.id = id ?? UUID()
		self.amount = amount
		self.title = title
		self.when = when
		self.tag = tag
	}
}
