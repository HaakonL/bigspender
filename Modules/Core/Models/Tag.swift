//
//  Tag.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 30/01/2023.
//

import Foundation

public struct Tag {
	public let id: String
	public let title: String
	
	public init(id: String, title: String) {
		self.id = id
		self.title = title
	}
}
