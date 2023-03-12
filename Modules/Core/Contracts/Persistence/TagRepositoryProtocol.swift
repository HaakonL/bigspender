//
//  TagRepositoryProtocol.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 11/03/2023.
//

import Foundation

public protocol TagRepositoryProtocol {
	func getAll() async -> Result<[Tag], Error>
	func save(_ tag: Tag) async -> Result<Bool, Error>
}
