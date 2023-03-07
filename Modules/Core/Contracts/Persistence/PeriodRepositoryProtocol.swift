//
//  PeriodRepositoryProtocol.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 01/02/2023.
//

import Foundation

public protocol PeriodRepositoryProtocol {
	func get(by date: Date) async -> Result<Period?, Error>
	func save(_ period: Period) async -> Result<Period?, Error>
}
