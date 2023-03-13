//
//  LineChartData.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 05/03/2023.
//

import Foundation

public class ChartData {
	var day: Date
	var spendings: Int
	var budgeted: Int
	var dailyBudget: Int
	var tag: String
	var animate: Bool
	
	init(day: Date = Date(), spendings: Int = 0, budgeted: Int = 0, dailyBudget: Int = 0, tag: String = "", animate: Bool = false) {
		self.day = day
		self.spendings = spendings
		self.budgeted = budgeted
		self.dailyBudget = dailyBudget
		self.tag = tag
		self.animate = animate
	}
}
