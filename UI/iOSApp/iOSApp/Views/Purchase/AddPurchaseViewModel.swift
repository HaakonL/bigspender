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
	@Published public var selectedTag: Tag?
	
	public func savePurchase(amount: String, title: String, when: Date, tag: Tag?) async -> Bool {
		let intAmount = amount.isEmpty ? 0 : Int(amount)
		let purchase = Purchase(id: nil, amount: intAmount ?? 0, title: title, when: when.noon(), tag: tag)
		let isSuccess = await purchaseService.savePurchase(purchase) ?? false
		
		if isSuccess {
			NotificationCenter.default.post(name: .addPurchase, object: purchase, userInfo: nil)
		}
		
		return isSuccess
	}
}
