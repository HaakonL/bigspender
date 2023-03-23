//
//  PurchaseRepository.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 30/01/2023.
//

import Foundation
import Core
import RealmSwift

public class PurchaseRepository: PurchaseRepositoryProtocol {
	public init() {}
	
	private var repository = RealmRepository<PurchaseDataModel>()
}

extension PurchaseRepository {
	
	@MainActor
	public func get(by period: Period) async -> Result<[Purchase]?, Error> {
		let result = await repository.get()
		switch result {
			case .success(let objects):
				let entries = objects.filter {
					$0.when >= period.start &&
					$0.when <= period.end
				}
				return .success(entries.compactMap {$0.toDomainObject() as? Purchase})
			case .failure(let error):
				return .failure(error)
		}
	}
	
	@MainActor
	public func get(by date: Date) async -> Result<[Purchase]?, Error> {
		let result = await repository.get()
		switch result {
			case .success(let objects):
				let entries = objects.filter {
					$0.when >= date &&
					$0.when <= date
				}
				return .success(entries.compactMap {$0.toDomainObject() as? Purchase})
			case .failure(let error):
				return .failure(error)
		}
	}
	
	@MainActor
	public func save(_ purchase: Purchase) async -> Result<Bool, Error> {
		let result = await repository.save(PurchaseDataModel(purchase))
		switch result {
			case .success(let status):
				return .success(status)
			case .failure(let error):
				return .failure(error)
		}
	}
}
