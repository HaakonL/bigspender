//
//  TagRepository.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 04/03/2023.
//

import Foundation
import Core
import FirestoreInstance
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

public class TagRepository {
	private let db: CollectionReference
	
	public init() {
		db = FirestoreInstance.database(for: "tags")
	}
}

extension TagRepository {
	public func get() async -> Result<[Tag]?, Error> {
		do {
			let snapshot = try await db.getDocuments()
			let documents = try snapshot.documents.map { try $0.data(as: TagDataModel.self).toDomainModel() }
			return .success(documents)
		} catch (let error) {
			return .failure(error)
		}
	}
	
	public func save(_ tag: Tag) async -> Result<Tag?, Error> {
		let dataModel = TagDataModel(tag)
		
		do {
			let result = try db.addDocument(from: dataModel)
			let document = try await result.getDocument(as: TagDataModel.self)
			return .success(document.toDomainModel())
		} catch(let error) {
			return .failure(error)
		}
	}
}
