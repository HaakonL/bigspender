//
//  TagDataModel.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 04/03/2023.
//

import Foundation
import Core
import RealmSwift

public class TagDataModel: Object {
	@Persisted(primaryKey: true) var _id: ObjectId
	@Persisted public var tag: String = ""
	
	public convenience init(_ model: Tag) {
		self.init()
		self.tag = model.tag
	}
	
	public func toDomainModel() -> Tag {
		return Tag(
			id: _id.stringValue,
			tag: tag
		)
	}
}
