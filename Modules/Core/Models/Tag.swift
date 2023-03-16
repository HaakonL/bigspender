//
//  Tag.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 30/01/2023.
//

import Foundation

public struct Tag: DomainObject, Identifiable, Hashable {
	public let id: UUID
	public let title: String
	public let isDefault: Bool
	
	public init(id: UUID?, title: String, isDefault: Bool) {
		self.id = id ?? UUID()
		self.title = title
		self.isDefault = isDefault
	}	
}
