//
//  WeekService.swift
//  Services
//
//  Created by Haakon Langaas Lageng on 10/01/2023.
//

import Foundation
import Core
import Resolver

public class PeriodService: PeriodServiceProtocol {
	@Injected private var repository: PeriodRepositoryProtocol
	
	public init() {}
	
	public func getPeriod(by date: Date) async -> Period? {
		let result = await repository.get(by: date)
		switch result {
			case .success(let period):
				return period
			case .failure(let error):
				print(error)
				return nil
		}
	}
	
	public func savePeriod(_ period: Period) async -> Period? {
		let result = await repository.save(period)
		switch result {
			case .success(let period):
				return period
			case .failure(let error):
				print(error)
				return nil
		}
	}
}
