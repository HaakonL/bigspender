//
//  LineChartData.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 05/03/2023.
//

import Foundation

class ChartData {
	var day: Date
	var spendings: Decimal
	var tag: String
	var animate: Bool
	
	init(day: Date = Date(), spendings: Decimal = 0.0, tag: String = "", animate: Bool = false) {
		self.day = day
		self.spendings = spendings
		self.tag = tag
		self.animate = animate
	}
}
