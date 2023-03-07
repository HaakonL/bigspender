//
//  PurchaseDataModel.swift
//  Persistence
//
//  Created by Haakon Langaas Lageng on 30/01/2023.
//

import Foundation
import Core
import FirebaseFirestoreSwift

public class PurchaseDataModel: Codable {
	@DocumentID var id: String?
	public var amount: Decimal
	public var title: String
	public var when: Date
	public var tags: [TagDataModel]
	
	public init() {
		self.amount = 0
		self.title = ""
		self.when = Date()
		self.tags = [TagDataModel]()
	}
	
	public init(_ model: Purchase) {
		self.amount = model.amount
		self.title = model.title
		self.when = model.when
		self.tags = model.tags.map { TagDataModel($0) }
	}
	
	public func toDomainModel() -> Purchase {
		return Purchase(
			id: id ?? UUID().uuidString,
			amount: amount,
			title: title,
			when: when,
			tags: tags.map { $0.toDomainModel() }
		)
	}
}
