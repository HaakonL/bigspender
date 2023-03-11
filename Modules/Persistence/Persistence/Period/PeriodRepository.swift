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
}

extension PeriodRepository {
	
	@MainActor
	public func get(by date: Date) async -> Result<Period?, Error> {
		do {
			let db = try await Realm()
			let documents = db.objects(PeriodDataModel.self).filter {
				$0.periodStart >= date.adding(.month, value: -1).adding(.day, value: 1).start() &&
				$0.periodEnd <= date.adding(.month, value: 1).adding(.day, value: -1).end()
			}
			
			return .success(documents.first?.toDomainObject() as? Period)
		} catch (let error) {
			return .failure(error)
		}
	}
	
	@MainActor
	public func save(_ period: Period) async -> Result<Period?, Error> {
		do {
			let db = try await Realm()
			let dataModel = PeriodDataModel(period)
			try db.write {
				db.add(dataModel)
			}
			return .success(dataModel.toDomainObject() as? Period)
		} catch(let error) {
			return .failure(error)
		}
	}
}
