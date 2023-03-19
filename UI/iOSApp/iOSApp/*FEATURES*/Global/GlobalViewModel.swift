//
//  GlobalViewModel.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 19/03/2023.
//

import Foundation

public class GlobalViewModel: ObservableObject {
	@Published public var currentPeriod: Date = Date()
	
	private var calendar: Calendar = Calendar.current
	
	init() {
		calendar.locale = Locale(identifier: "en_US_POSIX")
	}
	
	public func nextPeriod() {
		currentPeriod = currentPeriod.adding(.month, value: 1)
	}
	
	public func previousPeriod() {
		currentPeriod = currentPeriod.adding(.month, value: -1)
	}
	
	public func resetPeriod() {
		currentPeriod = Date()
	}
	
	public var month: String {
		"\(currentPeriod.monthSymbol(using: calendar).lowercased())"
	}
	
	public var year: String {
		"\(Calendar.current.component(.year, from: currentPeriod))"
	}
	
	public var monthAndYear: String {
		"\(month) \(year)"
	}
}
