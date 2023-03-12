//
//  TagService.swift
//  Services
//
//  Created by Haakon Langaas Lageng on 04/03/2023.
//

import Foundation
import Core
import Resolver

public class TagService: TagServiceProtocol {
	@Injected private var repository: TagRepositoryProtocol
	
	public init() {}
	
	public func getAllTags() async -> [Tag]? {
		let result = await repository.getAll()
		switch result {
			case .success(let tags):
				return tags
			case .failure(let error):
				print(error)
				return nil
		}
	}
	
	public func saveTag(_ tag: Tag) async -> Bool? {
		let result = await repository.save(tag)
		switch result {
			case .success(let status):
				return status
			case .failure(let error):
				print(error)
				return nil
		}
	}
}
