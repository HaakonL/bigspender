//
//  PurchaseRepositoryProtocol.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 11/03/2023.
//

import Foundation

public protocol PurchaseRepositoryProtocol {
	func get(by period: Period) async -> Result<[Purchase]?, Error>
	func get(by date: Date) async -> Result<[Purchase]?, Error>
	func save(_ purchase: Purchase) async -> Result<Purchase?, Error>
}
