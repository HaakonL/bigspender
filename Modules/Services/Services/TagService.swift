//
//  TagService.swift
//  Services
//
//  Created by Haakon Langaas Lageng on 04/03/2023.
//

import Foundation
import Core
import Persistence
import Resolver

public class TagService: TagServiceProtocol {
	@Injected private var repository: TagRepository
	
	public init() {}
	
	public func getAllTags() async -> [Tag]? {
		let result = await repository.get()
		switch result {
			case .success(let tags):
				return tags
			case .failure(let error):
				print(error)
				return nil
		}
	}
	
	public func saveTag(_ tag: Tag) async -> Tag? {
		let result = await repository.save(tag)
		switch result {
			case .success(let tag):
				return tag
			case .failure(let error):
				print(error)
				return nil
		}
	}
}
