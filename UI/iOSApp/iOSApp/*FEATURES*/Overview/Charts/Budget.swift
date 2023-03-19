//
//  Budget.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 16/03/2023.
//

import Foundation

public class Budget {
	var totalBudget: Int
	var dailyBudget: Int
	var days: [ChartData]
	
	init(totalBudget: Int, dailyBudget: Int, days: [ChartData]? = nil) {
		self.totalBudget = totalBudget
		self.dailyBudget = dailyBudget
		self.days = days ?? []
	}
}
