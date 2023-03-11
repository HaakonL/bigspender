//
//  Purchase.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 29/01/2023.
//

import Foundation

public struct Purchase: Identifiable {
	public let id: String?
	public let amount: Int
	public let title: String
	public let when: Date
	public let tags: [String]
	
	public init(id: String?, amount: Int, title: String, when: Date, tags: [String]) {
		self.id = id
		self.amount = amount
		self.title = title
		self.when = when
		self.tags = tags
	}
}
