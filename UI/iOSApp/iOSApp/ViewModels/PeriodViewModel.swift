//
//  PeriodViewModel.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 03/02/2023.
//

import Foundation
import Resolver
import Core

class PeriodViewModel: ObservableObject {
	@Injected private var periodService: PeriodServiceProtocol
	@Published public private(set) var currentPeriod: Period?
	
	func loadPeriod() async {
		currentPeriod = await periodService.getPeriod(by: Date())
		
		// TEMP!
		if currentPeriod == nil {
			let newPeriod = Period(
				id: UUID().uuidString,
				periodStart: Date().start(),
				periodEnd: Date().adding(.month, value: 1).adding(.day, value: -1).end(),
				amountAvailable: 15000
			)
			currentPeriod = await periodService.savePeriod(newPeriod)
		}
	}	
}
