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
}

extension PurchaseRepository {
	
	@MainActor
	public func get(by period: Period) async -> Result<[Purchase]?, Error> {
		do {
			let db = try await Realm()
			var documents = [Purchase]()
			
			let entries = db.objects(PurchaseDataModel.self).filter {
				$0.when >= period.periodStart &&
				$0.when <= period.periodEnd
			}
			
			for entry in entries {
				documents.append(entry.toDomainModel())
			}
			
			return .success(documents)
		} catch(let error) {
			return .failure(error)
		}
	}
	
	@MainActor
	public func get(by date: Date) async -> Result<[Purchase]?, Error> {
		do {
			let db = try await Realm()
			var documents = [Purchase]()
			
			let entries = db.objects(PurchaseDataModel.self).filter {
				$0.when >= date &&
				$0.when <= date
			}
			
			for entry in entries {
				documents.append(entry.toDomainModel())
			}
			
			return .success(documents)
		} catch(let error) {
			return .failure(error)
		}
	}
	
	@MainActor
	public func save(_ purchase: Purchase) async -> Result<Purchase?, Error> {
		do {
			let db = try await Realm()
			let dataModel = PurchaseDataModel(purchase)
			try db.write {
				db.add(dataModel)
			}
			return .success(dataModel.toDomainModel())
		} catch(let error) {
			return .failure(error)
		}
	}
}
