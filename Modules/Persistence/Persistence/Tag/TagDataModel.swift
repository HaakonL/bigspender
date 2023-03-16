//
//  TagDataModel.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 04/03/2023.
//

import Foundation
import Core
import RealmSwift

public class TagDataModel: Object, RepositoryObject {
	@Persisted(primaryKey: true) var _id: ObjectId
	@Persisted public var tag: String = ""
	
	public convenience init(_ model: Tag) {
		self.init()
		if let id = model.id, let objectId = try? ObjectId(string: id) {
			self._id = objectId
		}
		self.tag = model.tag
	}
	
	public func toDomainObject() -> DomainObject {
		return Tag(
			id: _id.stringValue,
			tag: tag
		)
	}
}
