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
	@Persisted(primaryKey: true) var id: UUID
	@Persisted public var amount: Int = 0
	@Persisted public var title: String = ""
	@Persisted public var when: Date = Date()
	@Persisted public var tag: TagDataModel?

	public convenience init(_ model: Purchase) {
		self.init()
		self.id = model.id
		self.amount = model.amount
		self.title = model.title
		self.when = model.when
		if let tag = model.tag {
			self.tag = TagDataModel(tag)
		}
	}
	
	public func toDomainObject() -> DomainObject {
		return Purchase(
			id: id,
			amount: amount,
			title: title,
			when: when,
			tag: getTag()
		)
	}
	
	private func getTag() -> Tag? {
		if let tag = tag {
			return Tag(id: tag.id, title: tag.title, isDefault: tag.isDefault)
		}
		return nil
	}
}
