//
//  SpendingViewModel.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 12/02/2023.
//

import Foundation
import Resolver
import Core

class OverviewViewModel: ObservableObject {
	@Injected private var periodService: PeriodServiceProtocol
	@Published public private(set) var currentPeriod: Period?
	
	func loadPeriod() async {
		if let period = await periodService.getPeriod(by: Date()) {
			DispatchQueue.main.async {
				self.currentPeriod = period
			}
		}
	}
	
	func getProjectedResult(budget: Decimal, data: [ChartData]) -> [ChartData] {
		let currentDay = Calendar.current.dateComponents([.day], from: Date()).day!
		let spentSoFar = data.map{ $0.spendings }.reduce(0, +)
		let spentOnAverage = spentSoFar.int / currentDay
		
		var newData = [ChartData]()
		var reducedBudget = budget.int
		for dataPoint in data {
			let calendarDate = Calendar.current.dateComponents([.day], from: dataPoint.day)
			if let calendarDay = calendarDate.day, calendarDay > currentDay {
				reducedBudget -= spentOnAverage
			} else {
				reducedBudget -= dataPoint.spendings.int
			}
			
			newData.append(ChartData(day: dataPoint.day, spendings: Decimal(reducedBudget)))
		}
		
		return newData
	}
	
	// TEMP DATA BELOW
	
	let februaryData: [ChartData] = [
		ChartData(day: Date.date(2023, 2, 1), spendings: 150),
		ChartData(day: Date.date(2023, 2, 2), spendings: 127),
		ChartData(day: Date.date(2023, 2, 3), spendings: 233),
		ChartData(day: Date.date(2023, 2, 4), spendings: 134),
		ChartData(day: Date.date(2023, 2, 5), spendings: 150),
		ChartData(day: Date.date(2023, 2, 6), spendings: 150),
		ChartData(day: Date.date(2023, 2, 7), spendings: 0),
		ChartData(day: Date.date(2023, 2, 8), spendings: 20),
		ChartData(day: Date.date(2023, 2, 9), spendings: 999),
		ChartData(day: Date.date(2023, 2, 10), spendings: 146),
		ChartData(day: Date.date(2023, 2, 11), spendings: 2102),
		ChartData(day: Date.date(2023, 2, 12), spendings: 150),
		ChartData(day: Date.date(2023, 2, 13), spendings: 0),
		ChartData(day: Date.date(2023, 2, 14), spendings: 2),
		ChartData(day: Date.date(2023, 2, 15), spendings: 150),
		ChartData(day: Date.date(2023, 2, 16), spendings: 10),
		ChartData(day: Date.date(2023, 2, 17), spendings: 766),
		ChartData(day: Date.date(2023, 2, 18), spendings: 150),
		ChartData(day: Date.date(2023, 2, 19), spendings: 150),
		ChartData(day: Date.date(2023, 2, 20), spendings: 0),
		ChartData(day: Date.date(2023, 2, 21), spendings: 0),
		ChartData(day: Date.date(2023, 2, 22), spendings: 10),
		ChartData(day: Date.date(2023, 2, 23), spendings: 60),
		ChartData(day: Date.date(2023, 2, 24), spendings: 300),
		ChartData(day: Date.date(2023, 2, 25), spendings: 1566),
		ChartData(day: Date.date(2023, 2, 26), spendings: 0),
		ChartData(day: Date.date(2023, 2, 27), spendings: 234),
		ChartData(day: Date.date(2023, 2, 28), spendings: 876),
	]
	
	let marchData: [ChartData] = [
		ChartData(day: Date.date(2023, 3, 1), spendings: 350),
		ChartData(day: Date.date(2023, 3, 2), spendings: 227),
		ChartData(day: Date.date(2023, 3, 3), spendings: 833),
		ChartData(day: Date.date(2023, 3, 4), spendings: 1234),
		ChartData(day: Date.date(2023, 3, 5), spendings: 150),
		ChartData(day: Date.date(2023, 3, 6), spendings: 0),
		ChartData(day: Date.date(2023, 3, 7), spendings: 0),
		ChartData(day: Date.date(2023, 3, 8), spendings: 0),
		ChartData(day: Date.date(2023, 3, 9), spendings: 0),
		ChartData(day: Date.date(2023, 3, 10), spendings: 0),
		ChartData(day: Date.date(2023, 3, 11), spendings: 0),
		ChartData(day: Date.date(2023, 3, 12), spendings: 0),
		ChartData(day: Date.date(2023, 3, 13), spendings: 0),
		ChartData(day: Date.date(2023, 3, 14), spendings: 0),
		ChartData(day: Date.date(2023, 3, 15), spendings: 0),
		ChartData(day: Date.date(2023, 3, 16), spendings: 0),
		ChartData(day: Date.date(2023, 3, 17), spendings: 0),
		ChartData(day: Date.date(2023, 3, 18), spendings: 0),
		ChartData(day: Date.date(2023, 3, 19), spendings: 0),
		ChartData(day: Date.date(2023, 3, 20), spendings: 0),
		ChartData(day: Date.date(2023, 3, 21), spendings: 0),
		ChartData(day: Date.date(2023, 3, 22), spendings: 0),
		ChartData(day: Date.date(2023, 3, 23), spendings: 0),
		ChartData(day: Date.date(2023, 3, 24), spendings: 0),
		ChartData(day: Date.date(2023, 3, 25), spendings: 0),
		ChartData(day: Date.date(2023, 3, 26), spendings: 0),
		ChartData(day: Date.date(2023, 3, 27), spendings: 0),
		ChartData(day: Date.date(2023, 3, 28), spendings: 0),
	]
	
	let categoryData: [ChartData] = [
		ChartData(day: Date.date(2023, 3, 1), spendings: 3550, tag: "#groceries"),
		ChartData(day: Date.date(2023, 3, 1), spendings: 2210, tag: "#apparel"),
		ChartData(day: Date.date(2023, 3, 1), spendings: 1500, tag: "#dining"),
		ChartData(day: Date.date(2023, 3, 1), spendings: 953, tag: "#fun"),
		ChartData(day: Date.date(2023, 3, 1), spendings: 633, tag: "#travel")
	]
}
