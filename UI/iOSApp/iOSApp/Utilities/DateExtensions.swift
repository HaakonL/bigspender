//
//  DateExtensions.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 05/03/2023.
//

import Foundation

extension Date {
	public static func date(_ year: Int, _ month: Int, _ day: Int) -> Date {
		var components = DateComponents()
		components.hour = 0
		components.minute = 0
		components.second = 0
		components.nanosecond = 0
		components.year = year
		components.month = month
		components.day = day
		return Calendar.current.date(from: components) ?? Date.now
	}
}
