//
//  TagRepositoryProtocol.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 11/03/2023.
//

import Foundation

public protocol TagRepositoryProtocol {
	func get() async -> Result<[Tag], Error>
	func get(id: String) async -> Result<Tag?, Error>
	func save(_ tag: Tag) async -> Result<Tag?, Error>
	func remove(_ id: String) async -> Bool
}
