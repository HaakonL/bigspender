//
//  DateExtensions.swift
//  Core
//
//  Created by Haakon Langaas Lageng on 03/02/2023.
//

import Foundation

public extension Date {
	func noon(using calendar: Calendar = .current) -> Date {
		calendar.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
	}
	func start(using calendar: Calendar = .current) -> Date {
		calendar.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
	}
	func end(using calendar: Calendar = .current) -> Date {
		calendar.date(bySettingHour: 23, minute: 59, second: 59, of: self)!
	}
	func day(using calendar: Calendar = .current) -> Int {
		calendar.component(.day, from: self)
	}
	func adding(_ component: Calendar.Component, value: Int, using calendar: Calendar = .current) -> Date {
		calendar.date(byAdding: component, value: value, to: self)!
	}
	func monthSymbol(using calendar: Calendar = .current) -> String {
		calendar.monthSymbols[calendar.component(.month, from: self)-1]
	}
}
