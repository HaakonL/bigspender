//
//  GenericRepository.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 11/03/2023.
//

import Foundation
import Core
import RealmSwift

/// Work in progress, do not use
public class Repository<T:DataEntity&Object> {
	
	@MainActor
	public func get() async -> Result<[DomainObject]?, Error> {
		do {
			let db = try await Realm()
			var documents = [DomainObject]()
			for document in db.objects(T.self).enumerated() {
				documents.append(document.element.toDomainObject())
			}
			return .success(documents)
		} catch (let error) {
			return .failure(error)
		}
	}
	
	@MainActor
	public func get(id: String) async -> Result<DomainObject?, Error> {
		do {
			let db = try await Realm()
			let obj = try db.object(ofType: T.self, forPrimaryKey: ObjectId(string: id))
			return .success(obj?.toDomainObject())
		} catch (let error) {
			return .failure(error)
		}
	}
	
	@MainActor
	public func save(_ entity: T) async -> Result<DomainObject?, Error> {
		do {
			let db = try await Realm()
			try db.write {
				db.add(entity)
			}
			return .success(entity.toDomainObject())
		} catch(let error) {
			return .failure(error)
		}
	}
	
	@MainActor
	public func remove(_ id: String) async -> Bool {
		do {
			let db = try await Realm()
			let entity = try db.object(ofType: T.self, forPrimaryKey: ObjectId(string: id))
			if let entity = entity {
				try db.write {
					db.delete(entity)
				}
				return true
			}
			return false
		} catch {
			return false
		}
	}
}
