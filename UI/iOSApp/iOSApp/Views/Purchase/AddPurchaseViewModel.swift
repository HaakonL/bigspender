//
//  AddPurchaseViewModel.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 10/03/2023.
//

import Foundation
import Core
import Resolver

public class AddPurchaseViewModel: ObservableObject {
	@Injected private var purchaseService: PurchaseServiceProtocol
	@Injected private var tagsService: TagServiceProtocol
	@Published public private(set) var tags: [Tag]?
	
	public func savePurchase(amount: String, title: String, when: Date, tags: [Tag]) async -> Bool {
		let intAmount = amount.isEmpty ? 0 : Int(amount)
		let purchase = Purchase(id: nil, amount: intAmount ?? 0, title: title, when: when.noon(), tags: tags)
		let result = await purchaseService.savePurchase(purchase)
		return result != nil
	}
	
	public func loadTags() async {
		if let tags = await tagsService.getAllTags() {
			DispatchQueue.main.async {
				self.tags = tags
			}
		}
	}
}
