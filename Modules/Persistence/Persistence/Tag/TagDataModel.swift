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
	@Persisted(primaryKey: true) var id: UUID
	@Persisted public var title: String = ""
	@Persisted public var isDefault: Bool = false
	
	public convenience init(_ model: Tag) {
		self.init()
		self.id = model.id
		self.title = model.title
		self.isDefault = model.isDefault
	}
	
	public func toDomainObject() -> DomainObject {
		return Tag(
			id: id,
			title: title,
			isDefault: isDefault
		)
	}
}
