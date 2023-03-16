//
//  WeekRepository.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 11/01/2023.
//

import Foundation
import Core
import RealmSwift

public class PeriodRepository: PeriodRepositoryProtocol {
	public init() {}
	
	private var repository = RealmRepository<PeriodDataModel>()
}

extension PeriodRepository {
	
	@MainActor
	public func get(by date: Date) async -> Result<Period?, Error> {
		let result = await repository.get()
		switch result {
			case .success(let objects):
				let entries = objects.filter {
					$0.periodStart >= date.adding(.month, value: -1).adding(.day, value: 1).start() &&
					$0.periodEnd <= date.adding(.month, value: 1).adding(.day, value: -1).end()
				}
				return .success(entries.first?.toDomainObject() as? Period)
			case .failure(let error):
				return .failure(error)
		}
	}
	
	@MainActor
	public func save(_ period: Period) async -> Result<Bool, Error> {
		let result = await repository.save(PeriodDataModel(period))
		switch result {
			case .success(let status):
				return .success(status)
			case .failure(let error):
				return .failure(error)
		}
	}
}
