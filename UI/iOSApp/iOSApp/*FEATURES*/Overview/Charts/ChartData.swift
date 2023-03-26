//
//  LineChartData.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 05/03/2023.
//

import Foundation

public class ChartData: Equatable {
	public static func == (lhs: ChartData, rhs: ChartData) -> Bool {
		lhs.day == rhs.day && lhs.spendings == rhs.spendings
	}
	
	var day: Date
	var spendings: Int
	var budgeted: Int
	var tag: String
	var animate: Bool
	
	init(day: Date = Date(), spendings: Int = 0, budgeted: Int = 0, tag: String = "", animate: Bool = false) {
		self.day = day
		self.spendings = spendings
		self.budgeted = budgeted
		self.tag = tag
		self.animate = animate
	}
}
