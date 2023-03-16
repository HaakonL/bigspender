//
//  PurchaseDataModel.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 30/01/2023.
//

import Foundation
import Core
import RealmSwift

public class PurchaseDataModel: Object, RepositoryObject {
	@Persisted(primaryKey: true) var _id: ObjectId
	@Persisted public var amount: Int = 0
	@Persisted public var title: String = ""
	@Persisted public var when: Date = Date()
	@Persisted public var tags: List<String> = List<String>()
		
	public convenience init(_ model: Purchase) {
		self.init()
		self.amount = model.amount
		self.title = model.title
		self.when = model.when
		self.tags.append(objectsIn: model.tags)
	}
	
	public func toDomainObject() -> DomainObject {
		return Purchase(
			id: _id.stringValue,
			amount: amount,
			title: title,
			when: when,
			tags: Array(self.tags)
		)
	}
}
