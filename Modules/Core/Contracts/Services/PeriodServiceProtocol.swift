//
//  WeekServiceProtocol.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 10/01/2023.
//

import Foundation

public protocol PeriodServiceProtocol {
	func getPeriod(by date: Date) async -> Period?
	func savePeriod(_ period: Period) async -> Bool?
}
