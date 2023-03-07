//
//  PurchaseRepository.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 30/01/2023.
//

import Foundation
import Core
import FirestoreInstance
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

public class PurchaseRepository {
	private let db: CollectionReference
	
	public init() {
		db = FirestoreInstance.database(for: "purchases")
	}
}

extension PurchaseRepository {
	public func get(by period: Period) async -> Result<[Purchase]?, Error> {
		let query = db
			.whereField("when", isGreaterThanOrEqualTo: period.periodStart)
			.whereField("when", isLessThanOrEqualTo: period.periodEnd)
		
		do {
			let snapshot = try await query.getDocuments()
			let documents = try snapshot.documents.map { try $0.data(as: PurchaseDataModel.self).toDomainModel() }
			return .success(documents)
		} catch (let error) {
			return .failure(error)
		}
	}
	
	public func get(by date: Date) async -> Result<[Purchase]?, Error> {
		let query = db
			.whereField("when", isGreaterThanOrEqualTo: date)
			.whereField("when", isLessThanOrEqualTo: date)
		
		do {
			let snapshot = try await query.getDocuments()
			let documents = try snapshot.documents.map { try $0.data(as: PurchaseDataModel.self).toDomainModel() }
			return .success(documents)
		} catch (let error) {
			return .failure(error)
		}
	}
	
	public func save(_ purchase: Purchase) async -> Result<Purchase?, Error> {
		let dataModel = PurchaseDataModel(purchase)
		
		do {
			let result = try db.addDocument(from: dataModel)
			let document = try await result.getDocument(as: PurchaseDataModel.self)
			return .success(document.toDomainModel())
		} catch(let error) {
			return .failure(error)
		}
	}
}
