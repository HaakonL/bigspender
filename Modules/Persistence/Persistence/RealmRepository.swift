//
//  GenericRepository.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 11/03/2023.
//

import Foundation
import Core
import RealmSwift

public class RealmRepository<T> where T:RepositoryObject & Object {
	public init() {}
}

extension RealmRepository {
	
	@MainActor
	public func get() async -> Result<[T], Error> {
		do {
			let db = try await Realm()
			let objects = db.objects(T.self)
			return .success(objects.compactMap{ $0 })
		} catch (let error) {
			return .failure(error)
		}
	}
	
	@MainActor
	public func get(where predicate: NSPredicate) async -> Result<[T], Error> {
		do {
			let db = try await Realm()
			var objects = db.objects(T.self)
			objects = objects.filter(predicate)
			return .success(objects.compactMap{ $0 })
		} catch (let error) {
			return .failure(error)
		}
	}
	
	@MainActor
	public func get(id: UUID) async -> Result<T?, Error> {
		do {
			let db = try await Realm()
			let object = db.object(ofType: T.self, forPrimaryKey: id)
			return .success(object)
		} catch (let error) {
			return .failure(error)
		}
	}
	
	@MainActor
	public func save(_ entity: T) async -> Result<Bool, Error> {
		do {
			let db = try await Realm()
			try db.write {
				db.add(entity, update: Realm.UpdatePolicy.modified)
			}
			return .success(true)
		} catch(let error) {
			return .failure(error)
		}
	}
	
	@MainActor
	public func save(_ entity: [T]) async -> Result<Bool, Error> {
		do {
			let db = try await Realm()
			try db.write {
				db.add(entity, update: Realm.UpdatePolicy.modified)
			}
			return .success(true)
		} catch(let error) {
			return .failure(error)
		}
	}
	
	@MainActor
	public func remove(_ id: String) async -> Result<Bool, Error> {
		do {
			let db = try await Realm()
			let object = try db.object(ofType: T.self, forPrimaryKey: ObjectId(string: id))
			if let object = object {
				try db.write {
					db.delete(object)
				}
				return .success(true)
			}
			return .success(false)
		} catch(let error) {
			return .failure(error)
		}
	}
	
}
