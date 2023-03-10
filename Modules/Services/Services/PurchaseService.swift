//
//  PurchaseService.swift
//  Services
//
//  Created by Haakon Langaas Lageng on 04/03/2023.
//

import Foundation
import Core
import Persistence
import Resolver

public class PurchaseService: PurchaseServiceProtocol {
	@Injected private var repository: PurchaseRepository
	
	public init() {}
	
	public func getPurchases(by period: Period) async -> [Purchase]? {
		let result = await repository.get(by: period)
		switch result {
			case .success(let purchases):
				return purchases
			case .failure(let error):
				print(error)
				return nil
		}
	}
	
	public func getPurchases(by date: Date) async -> [Purchase]? {
		let result = await repository.get(by: date)
		switch result {
			case .success(let purchases):
				return purchases
			case .failure(let error):
				print(error)
				return nil
		}
	}
	
	public func savePurchase(_ purchase: Purchase) async -> Purchase? {
		let result = await repository.save(purchase)
		switch result {
			case .success(let purchase):
				return purchase
			case .failure(let error):
				print(error)
				return nil
		}
	}
}
