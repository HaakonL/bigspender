//
//  Purchase.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 29/01/2023.
//

import Foundation

public struct Purchase: DomainObject {
	public let id: String?
	public let amount: Int
	public let title: String
	public let when: Date
	public let tags: [Tag]
	
	public init(id: String?, amount: Int, title: String, when: Date, tags: [Tag]) {
		self.id = id
		self.amount = amount
		self.title = title
		self.when = when
		self.tags = tags
	}
}
