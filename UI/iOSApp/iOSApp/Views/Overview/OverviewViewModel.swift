//
//  SpendingViewModel.swift
//  iOSApp
//
//  Created by Haakon Langaas Lageng on 12/02/2023.
//

import Foundation
import Resolver
import Core

public class OverviewViewModel: ObservableObject {
	@Injected private var periodService: PeriodServiceProtocol
	@Injected private var tagService: TagServiceProtocol
	
	@Published public private(set) var currentPeriod: Period?
	@Published public private(set) var tags: [Tag]?
	
	public func loadData() async {
		if let period = await periodService.getPeriod(by: Date()) {
			DispatchQueue.main.async {
				self.currentPeriod = period
			}
		}
		if let allTags = await tagService.getAllTags() {
			DispatchQueue.main.async {
				self.tags = allTags
			}
			
			// Make sure we have the default tag as a minimum
			if allTags.isEmpty {
				let tag = Tag(id: nil, tag: "default")
				_ = await tagService.saveTag(tag)
				
				DispatchQueue.main.async {
					self.tags = [tag]
				}
			}
		}
	}
	
	public func getProjectedResult(budget: Int, data: [ChartData]) -> [ChartData] {
		let currentDay = Calendar.current.dateComponents([.day], from: Date()).day!
		let spentSoFar = data.map{ $0.spendings }.reduce(0, +)
		let spentOnAverage = spentSoFar / currentDay
		let budgetAverage = budget / 31
		
		var newData = [ChartData]()
		var reducedBudget = budget
		var reducedAverage = budget
		
		for dataPoint in data {
			let calendarDate = Calendar.current.dateComponents([.day], from: dataPoint.day)
			if let calendarDay = calendarDate.day, calendarDay > currentDay {
				reducedBudget -= spentOnAverage
			} else {
				reducedBudget -= dataPoint.spendings
			}
			
			newData.append(ChartData(day: dataPoint.day, spendings: reducedBudget, budgeted: reducedAverage, dailyBudget: budgetAverage))
			
			reducedAverage -= budgetAverage
			if reducedAverage < 0 {
				reducedAverage = 0
			}
		}
		
		return newData
	}
	
	// TEMP DATA BELOW
	
	let februaryData: [ChartData] = [
		ChartData(day: Date.date(2023, 2, 1), spendings: 150, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 2), spendings: 127, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 3), spendings: 233, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 4), spendings: 134, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 5), spendings: 150, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 6), spendings: 150, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 7), spendings: 0, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 8), spendings: 20, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 9), spendings: 999, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 10), spendings: 146, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 11), spendings: 2102, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 12), spendings: 150, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 13), spendings: 0, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 14), spendings: 2, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 15), spendings: 150, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 16), spendings: 10, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 17), spendings: 766, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 18), spendings: 150, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 19), spendings: 150, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 20), spendings: 0, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 21), spendings: 0, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 22), spendings: 10, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 23), spendings: 60, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 24), spendings: 300, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 25), spendings: 1566, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 26), spendings: 0, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 27), spendings: 234, budgeted: 268, dailyBudget: 268),
		ChartData(day: Date.date(2023, 2, 28), spendings: 876, budgeted: 268, dailyBudget: 268),
	]
	
	let marchData: [ChartData] = [
		ChartData(day: Date.date(2023, 3, 1), spendings: 350, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 2), spendings: 227, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 3), spendings: 833, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 4), spendings: 123, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 5), spendings: 150, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 6), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 7), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 8), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 9), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 10), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 11), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 12), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 13), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 14), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 15), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 16), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 17), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 18), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 19), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 20), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 21), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 22), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 23), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 24), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 25), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 26), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 27), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 28), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 29), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 30), spendings: 0, budgeted: 242, dailyBudget: 242),
		ChartData(day: Date.date(2023, 3, 31), spendings: 0, budgeted: 242, dailyBudget: 242)
	]
	
	let categoryData: [ChartData] = [
		ChartData(day: Date.date(2023, 3, 1), spendings: 3550, budgeted: 242, dailyBudget: 242, tag: "#groceries"),
		ChartData(day: Date.date(2023, 3, 1), spendings: 2210, budgeted: 242, dailyBudget: 242, tag: "#apparel"),
		ChartData(day: Date.date(2023, 3, 1), spendings: 1500, budgeted: 242, dailyBudget: 242, tag: "#dining"),
		ChartData(day: Date.date(2023, 3, 1), spendings: 953, budgeted: 242, dailyBudget: 242, tag: "#fun"),
		ChartData(day: Date.date(2023, 3, 1), spendings: 633, budgeted: 242, dailyBudget: 242, tag: "#travel")
	]
}
