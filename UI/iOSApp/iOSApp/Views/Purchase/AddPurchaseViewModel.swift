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
	@Published public private(set) var tags: [String]?
	
	public func savePurchase(amount: String, title: String, when: Date, tags: [String]) async {
		let intAmount = amount.isEmpty ? 0 : Int(amount)
		var purchase = Purchase(id: "", amount: intAmount ?? 0, title: title, when: when.noon(), tags: tags)
		_ = await purchaseService.savePurchase(purchase)
	}
	
	public func loadTags() async {
		if let tags = await tagsService.getAllTags() {
			DispatchQueue.main.async {
				self.tags = tags.map { $0.tag }
			}
		}
	}
}
