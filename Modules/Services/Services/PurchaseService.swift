//
//  PurchaseService.swift
//  Services
//
//  Created by Haakon Langaas Lageng on 04/03/2023.
//

import Foundation
import Core
import Resolver

public class PurchaseService: PurchaseServiceProtocol {
	@Injected private var repository: PurchaseRepositoryProtocol
	
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
	
	public func savePurchase(_ purchase: Purchase) async -> Bool? {
		let result = await repository.save(purchase)
		switch result {
			case .success(let status):
				return status
			case .failure(let error):
				print(error)
				return nil
		}
	}
}
