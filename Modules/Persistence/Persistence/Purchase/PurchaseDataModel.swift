//
//  PurchaseDataModel.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 30/01/2023.
//

import Foundation
import Core
import RealmSwift

public class PurchaseDataModel: Object {
	@Persisted(primaryKey: true) var _id: ObjectId
	public var amount: Int = 0
	public var title: String = ""
	public var when: Date = Date()
	public var tags: [String] = []
		
	public convenience init(_ model: Purchase) {
		self.init()
		self.amount = model.amount
		self.title = model.title
		self.when = model.when
		self.tags = model.tags
	}
	
	public func toDomainModel() -> Purchase {
		return Purchase(
			id: _id.stringValue,
			amount: amount,
			title: title,
			when: when,
			tags: tags
		)
	}
}
