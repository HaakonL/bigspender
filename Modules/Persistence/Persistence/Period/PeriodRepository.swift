//
//  WeekRepository.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 11/01/2023.
//

import Foundation
import Core
import FirestoreInstance
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

public class PeriodRepository {
	private let db: CollectionReference
	
	public init() {
		db = FirestoreInstance.database(for: "periods")
	}
}

extension PeriodRepository {
	public func get(by date: Date) async -> Result<Period?, Error> {
		let query = db
			.whereField("periodStart", isGreaterThan: date.adding(.month, value: -1).adding(.day, value: 1).start())
			.whereField("periodStart", isLessThan: date.adding(.month, value: 1).adding(.day, value: -1).end())
		
		do {
			let snapshot = try await query.getDocuments()
			let document = try snapshot.documents.first?.data(as: PeriodDataModel.self)
			return .success(document?.toDomainModel())
		} catch (let error) {
			return .failure(error)
		}
	}
	
	public func save(_ period: Period) async -> Result<Period?, Error> {
		let dataModel = PeriodDataModel(period)

		do {
			let result = try db.addDocument(from: dataModel)
			let document = try await result.getDocument(as: PeriodDataModel.self)
			return .success(document.toDomainModel())
		} catch(let error) {
			return .failure(error)
		}
	}
}
