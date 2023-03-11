//
//  TagRepository.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 04/03/2023.
//

import Foundation
import Core
import RealmSwift

public class TagRepository: TagRepositoryProtocol {
	public init() {}
}

extension TagRepository {
	
	@MainActor
	public func get() async -> Result<[Tag], Error> {
		do {
			let db = try await Realm()
			var documents = [Tag]()
			for document in db.objects(TagDataModel.self).enumerated() {
				documents.append(document.element.toDomainModel())
			}
			return .success(documents)
		} catch (let error) {
			return .failure(error)
		}
	}
	
	@MainActor
	public func get(id: String) async -> Result<Tag?, Error> {
		do {
			let db = try await Realm()
			let tag = try db.object(ofType: TagDataModel.self, forPrimaryKey: ObjectId(string: id))
			return .success(tag?.toDomainModel())
		} catch (let error) {
			return .failure(error)
		}
	}
	
	@MainActor
	public func save(_ tag: Tag) async -> Result<Tag?, Error> {
		do {
			let db = try await Realm()
			let dataModel = TagDataModel(tag)
			try db.write {
				db.add(dataModel)
			}
			return .success(dataModel.toDomainModel())
		} catch(let error) {
			return .failure(error)
		}
	}
	
	@MainActor
	public func remove(_ id: String) async -> Bool {
		do {
			let db = try await Realm()
			let tag = try db.object(ofType: TagDataModel.self, forPrimaryKey: ObjectId(string: id))
			if let tag = tag {
				try db.write {
					db.delete(tag)
				}
			}
			return true
		} catch {
			return false
		}
	}
}
