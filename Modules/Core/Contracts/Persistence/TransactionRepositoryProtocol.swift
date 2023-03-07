//
//  SpenditureRepositoryProtocol.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 29/01/2023.
//

import Foundation

public protocol TransactionRepositoryProtocol {
	func get(by period: Period) async -> Result<[Core.Transaction]?, Error>
	func get(by date: Date) async -> Result<[Core.Transaction]?, Error>
	func save(_ transaction: Core.Transaction) async -> Result<Core.Transaction?, Error>
}
