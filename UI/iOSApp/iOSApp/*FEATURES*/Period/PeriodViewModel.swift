//
//  PeriodViewModel.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 21/03/2023.
//

import Foundation
import Core
import Resolver

public class PeriodViewModel: ObservableObject {
	private var globalViewModel: GlobalViewModel = Resolver.resolve()
	@Injected private var periodService: PeriodServiceProtocol

	@Published public private(set) var period: Period?
	
	public func loadPeriod() {
		period = Period(id: UUID(), start: Date(), end: Date(), budget: 15000)
	}
	
	public func savePeriod(start: Date, end: Date, budget: Int) async {
		let period = Period(id: UUID(), start: start, end: end, budget: budget)
		_ = await periodService.savePeriod(period)
	}
}
