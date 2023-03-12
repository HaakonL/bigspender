//
//  TagRepository.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 04/03/2023.
//

import Foundation
import Core
import Resolver

public class TagRepository: TagRepositoryProtocol {
	public init() {}
	
	private var repository = RealmRepository<TagDataModel>()
}

extension TagRepository {
	
	@MainActor
	public func getAll() async -> Result<[Tag], Error> {
		let result = await repository.get()
		switch result {
			case .success(let objects):
				return .success(objects.compactMap {$0.toDomainObject() as? Tag})
			case .failure(let error):
				return .failure(error)
		}
	}
	
	@MainActor
	public func save(_ tag: Tag) async -> Result<Bool, Error> {
		let result = await repository.save(TagDataModel(tag))
		switch result {
			case .success(let status):
				return .success(status)
			case .failure(let error):
				return .failure(error)
		}
	}
}
