//
//  TagServiceProtocol.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 04/03/2023.
//

import Foundation

public protocol TagServiceProtocol {
	func getAllTags() async -> [Tag]?
	func saveTag(_ tag: Tag) async -> Bool?
}
