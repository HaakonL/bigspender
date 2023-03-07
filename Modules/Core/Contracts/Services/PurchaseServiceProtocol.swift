//
//  PurchaseServiceProtocol.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 04/03/2023.
//

import Foundation

public protocol PurchaseServiceProtocol {
	func getPurchases(by period: Period) async -> [Purchase]?
	func getPurchases(by date: Date) async -> [Purchase]?
	func savePurchase(_ purchase: Purchase) async -> Purchase?
}
